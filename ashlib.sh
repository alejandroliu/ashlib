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
#****f* ashlib/find_in_path
# FUNCTION
#   Determines is the specified file is in the path variable
# SYNOPSIS
#   find_in_path needle haystack_variable
# INPUTS
#   needle -- item to find in the path variable
#   haystack_variable -- name of the variable contining path
# RETURN VALUE
#   returns 1 if not found, 0 if found.
# OUTPUT
#   Shows the file found.
#****

find_in_path() {
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

#****f* ashlib/include
# FUNCTION
#   includes the module
# SYNOPSIS
#   include module [other modules ...]
# INPUTS
#   module - module to include
# RETURN VALUE
#   0 on success, otherwise the number of failed modules.
#****

include() {
  [ -z "$ASHLIB_PATH" ] && export ASHLIB_PATH="$ASHLIB" 

  local ext fn i c=0
  for i in "$@"
  do
    for ext in ".sh" ""
    do
      if fn=$(find_in_path $i$ext ASHLIB_PATH) ; then
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
