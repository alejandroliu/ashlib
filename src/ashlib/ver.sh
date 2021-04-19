#!/bin/sh
#
#****h* ashlib/ver
# FUNCTION
# Functions related to version names
#****

gitver() {
#****f* ver/gitver
# NAME
#   gitver -- Determine the current version information from git
# SYNOPSIS
#   gitver _git-directory_
# ARGUMENTS
# * git-directory : Directory to the git repository
# OUTPUT
# version information
#****

## Determine the current version information from git
## # USAGE
##     gitver _git-directory_
## # ARGS
## * git-directory : Directory to the git repository
## # OUTPUT
## version information
  local dir="$1" ; shift
  if [ -d "$dir/.git" ] ; then
    if type git >/dev/null 2>&1 ; then
      # Git exists...
      local gitdir="--git-dir=$dir/.git"
      desc=$(git $gitdir describe --dirty=,M 2>/dev/null)
      branch_name=$(git $gitdir symbolic-ref -q HEAD)
      branch_name=${branch_name##refs/heads/}
      branch_name=${branch_name:-HEAD}
      if [ "master" = "$branch_name" ] ; then
	branch_name=""
      else
	branch_name=":$branch_name"
      fi
      echo $desc$branch_name
      return 0
    fi
  fi
  if [ -f "$dir.id" ] ; then
    cat "$dir.id"
    return 0
  fi
  if [ -f "$dir/.id" ] ; then
    cat "$dir/.id"
    return 0
  fi
  if [ -f "$dir/version.txt" ] ; then
    cat "$dir/version.txt"
    return 0
  fi
  echo 'Unknown'
  return 1
}

