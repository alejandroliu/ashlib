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
#****f* fixfile/fixfile
# FUNCTION
#   Function to modify files in-place.
#
#   Files are modified in-place only if the contents change.  This means
#   time stamps are kept accordingly.
#
#   <stdin> will be used as the contents of the new file unless --filter
#   is specified.  When in filter mode, the <stdin> is a shell script
#   that will be executed with <stdin> is the current contents of the
#   file and <stdout> as the new contents of the file.
#   Again, file is only written to if its conents change.
# SYNOPSIS
#   fixfile [options] file
# INPUTS
#   --mode=mode -- mode to set permissions to.
#   --user=user -- set ownership to user
#   --group=group -- set group to group
#   --nobackup -- disable creation of backups
#   --backupdir=dir -- if specified, backups are saved to the central dir.
#   --backupext=ext -- Backups are created by adding ext.  Defaults to "~".
#   --filter -- Use filter mode.  The stdin is used as an script that will
#     modify stdin (current file) and the stdout is used as the new contents
#     of the file.
#   file -- file to modify
#   <stdin> -- Will be the contents of the new file (unless --filter mode)
#****
fixfile() {
  local MODE= USER= GROUP= BACKUPDIR= BACKUPEXT="~" FILTER=no

  while [ $# -gt 0 ]
  do
    case "$1" in
	--nobackup)
	    BACKUPDIR=
	    BACKUPEXT=
	    ;;
	--backupext=*)
	    BACKUPDIR=
	    BACKUPEXT=${1#--backupext=}
	    ;;
        --backupdir=*)
	    BACKUPDIR=${1#--backupdir=}
	    BACKUPEXT=
	    ;;
	--filter)
	    FILTER=yes
	    ;;
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

  local OTXT=""
  if [ -f $FILE ] ; then
    OTXT=$(sed 's/^/:/' $FILE)
  fi

  if [ $FILTER = yes ] ; then
    # Stdin is not contents but actually is a filter script
    local INCODE="$(cat)"
    if [ -f $FILE ] ; then
      local NTXT="$(cat $FILE)"
    else
      local NTXT=""
    fi
    local NTXT=$(echo "$NTXT" | (eval "$INCODE" )| sed 's/^/:/' )
  else
    local NTXT=$(sed 's/^/:/')
  fi
  
  if [ x"$OTXT" != x"$NTXT" ] ; then
    if [ -f $FILE ] ; then
      if [ -z "$BACKUPDIR" ] ; then
	[ -n "$BACKUPEXT" ] && cp -dp $FILE $FILE$BACKUPEXT
      else
	cp -dp $FILE $BACKUPDIR/$(basename $FILE)
      fi
    fi
    echo "$NTXT" | sed 's/^://' > $FILE
    MSG=$(echo $MSG updated)
  fi

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
