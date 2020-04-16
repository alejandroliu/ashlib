#!/bin/sh
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#*#####################################################################
## This is a implicit module automatically invoked by:
##
##    eval $(ashlib)
##
## The `core` module is included automatically.
#*####################################################################

ifind_in_path() {
    ## Determines if the specified file is in the path variable
    ## # USAGE
    ##   ifind_in_path needle haystack_variable
    ## # ARGS
    ## * needle -- item to find in the path variable
    ## * haystack_variable -- name of the variable contining path
    ## # RETURNS
    ## 0 if found, 1 if not found
    ## # OUTPUT
    ## full path of found file
    local cmd="$1"
    local dirs="$(eval echo \$$2 | tr ':' ' ')"
    local dd
    for dd in $dirs
    do
      if [ -e $dd/$cmd ] ; then
	echo $dd/$cmd
	return 0
      fi
    done
    return 1
}

include() {
  ## Include an `ashlib` module.
  ## # USAGE
  ##   include module [other modules ...]
  ## # ARGS
  ## * module -- module to include
  ## # RETURNS
  ## 0 on success, otherwise the number of failed modules.
  [ -z "${ASHLIB_PATH:-}" ] && export ASHLIB_PATH="${ASHLIB:-}"

  local ext fn i c=0
  for i in "$@"
  do
    for ext in ".sh" ""
    do
      if fn=$(ifind_in_path $i$ext ASHLIB_PATH) ; then
	. $fn
	break
      fi
    done
    if [ -z "$fn" ] ; then
      echo "$i: not found" 1>&2
      c=$(expr $c + 1)
    fi
  done
  return $c
}
include core
