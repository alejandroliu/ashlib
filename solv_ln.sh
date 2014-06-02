#!/bin/sh
#
# Resolves symbolic links so they are relative paths
#
solv_ln() {
  local target="$1" linknam="$2"

  [ -d "$linknam" ] && linknam=$linknam/$(basename $target)

  local linkdir=$(cd $(dirname $linknam) && pwd) || return 1
  local targdir=$(cd $(dirname $target) && pwd) || return 1

  linkdir=$(echo "$linkdir" | sed 's!^/!!' | tr ' /' '/ ')
  targdir=$(echo "$targdir" | sed 's!^/!!' | tr ' /' '/ ')

  local a b

  while true
  do
    set - $linkdir ; a="$1"
    set - $targdir ; b="$1"
    [ $a != $b ] && break
    set - $linkdir ; shift ; linkdir="$*"
    set - $targdir ; shift ; targdir="$*"
    [ -z "$linkdir" ] && break;
    [ -z "$targdir" ] && break;
  done

  if [ -n "$linkdir" ] ; then
    set - $linkdir
    local q=""
    linkdir=""
    while [ $# -gt 0 ]
    do
      shift
      linkdir="$linkdir$q.."
      q=" "
    done
  fi
  echo $linkdir $targdir $(basename $target) | tr '/ ' ' /'
}
