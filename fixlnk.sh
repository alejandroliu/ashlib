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
# TODO: Fix set -euf -o pipefail compatibility
fixlnk() {
## Function to update symlinks
## # USAGE
##    fixlnk target lnk
## # ARGS
## * target -- where the link should be pointing to
## * lnk -- where the link is to be created
## # DESC
## Note that this will first check if the symlink needs to be corrected.
## Otherwise no action is taken.

  if [ $# -ne 2 ] ; then
    echo "Usage: fixlnk {target} {lnk}" 1>&2
    return 1
  fi

  local LNKDAT="$1"
  local LNKLOC="$2"

  if [ -L "$LNKLOC" ] ; then
    CLNKDAT=$(readlink "$LNKLOC")
    [ x"$CLNKDAT" = x"$LNKDAT" ] && return 0
    echo "Updating $LNKLOC" 1>&2
    rm -f "$LNKLOC"
  elif [ -e "$LNKLOC" ] ; then
    echo "Fixing $LNKLOC" 1>&2
    rm -rf "$LNKLOC"
  else
    echo "Creating $LNKLOC" 1>&2
  fi
  ln -s "$LNKDAT" "$LNKLOC"
}
