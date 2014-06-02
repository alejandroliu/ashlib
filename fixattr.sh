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
#****f* fixattr/fixattr
# FUNCTION
#   Makes sure the file has the appropriate attributes (permissions and
#   ownership)
# SYNOPSIS
#   fixattr [options] file
# INPUTS
#   --mode=mode -- Target file mode
#   --user=user -- User to own the file
#   --group=group -- Group that owns the file
#   file -- file to modify.
#****
fixattr() {
  local MODE= USER= GROUP=

  while [ $# -gt 0 ]
  do
    case "$1" in
	--mode=*)
	    MODE=${1#--mode=}
	    ;;
	--user=*)
	    USER=${1#--user=}
	    ;;
	--group=*)
	    GROUP=${1#--group=}
	    ;;
	-*)
	    echo "Invalid option: $1" 1>&2
	    return 1
	    ;;
	*)
	    break
	    ;;
    esac
    shift
  done

  if [ $# -eq 0 ] ; then
    echo "No file specified" 1>&2
    return 1
  elif [ $# -gt 1 ] ; then
    echo "Ignoring additional options: $*" 1>&2
  fi

  local FILE="$1"

  if [ -z "$GROUP" ] ; then
    # Check if USER == {user}:{group}
    eval $(
	echo $USER | (
	    IFS=:
	    read A B
	    [ -z "$B" ]
	    echo USER=$A \; GROUP=$B
	)
    )
  fi

  local MSG=

  if [ -n "$USER" ] ; then
    if [ $(find $FILE -maxdepth 0 -user $USER | wc -l) -eq 0 ] ; then
      chown $USER $FILE    
      MSG=$(echo $MSG chown)
    fi
  fi
  if [ -n "$GROUP" ] ; then
    if [ $(find $FILE -maxdepth 0 -group $GROUP | wc -l) -eq 0 ] ; then
      chgrp $GROUP $FILE    
      MSG=$(echo $MSG chgrp)
    fi
  fi
  if [ -n "$MODE" ] ; then
    if [ $(find $FILE -maxdepth 0 -perm $MODE | wc -l) -eq 0 ] ; then
      chmod $MODE $FILE
      MSG=$(echo $MSG chmod)
    fi
  fi
  [ -n "$MSG" ] && echo "$FILE $MSG" 1>&2
}
