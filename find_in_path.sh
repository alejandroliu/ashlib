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
find_in_path() {
  ##   Find a file in a path
  ## # USAGE
  ##   find_in_path [--path=PATH] file
  ## # OPTIONS
  ## * --path=PATH : don't use $PATH but the provided PATH
  ## # DESC
  ## Find a file in the provided path or PATH environment
  ## variable.
  ##
  local spath="$PATH"
  while [ $# -gt 0 ]
  do
    case "$1" in
    --path=*)
      spath="${1#--path=}"
      ;;
    *)
      break
      ;;
    esac
  done
  if [ x"${1:0:1}" = x"/" ] ; then
    [ -f "$1" ] && echo "$1"
    return
  fi
  local d oIFS="$IFS" ; IFS=":"
  for d in $spath
  do
    if [ -f "$d/$1" ] ; then
      echo "$d/$1"
      break
    fi
  done
  IFS="$oIFS"
}

