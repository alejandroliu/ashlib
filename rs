#!/bin/bash
#
# Run snippets
#
set -euf -o pipefail
mydir="$(cd "$(dirname "$0")" && pwd)"

if [ -L "$0" ] ; then
  ashlib=$(dirname $(readlink -f "$0"))
else
  # First check if submodules are there...
  if [ -d "$mydir/.git" ] ; then
    if [ -f "$mydir/.gitmodules" ] ; then
      # Check if submodules are all there...
      grep -E '^\s*path\s*=\s*' "$mydir"/.gitmodules | sed 's/^\s*path\s*=\s*//' | while read subpath
      do
	if [ ! -e "$mydir/$subpath/.git" ] ; then
	  (cd "$mydir" && git submodule update --init --recursive)
	  break
	fi
      done
    fi
  fi

  if [ -L "$mydir/.ashlib" ] ; then
    # Check if there is a run-time file...
    ashlib="$mydir/.ashlib"
  elif [ -d "$mydir/ashlib" ] ; then
    ashlib="$mydir/ashlib"
  else
    echo "Missing \"ashlib\"" 1>&2
    exit 1
  fi

  if [ ! -f "$ashlib/rs" ] ; then
    echo "Missing \"ashlib/rs\" script" 1>&2
    exit 2
  fi

  # Make sure this script and the submodule are in sync...
  if ! cmp "$0" "$ashlib/rs" >/dev/null 2>&1 ; then
    echo "Updating $0..." 1>&2
    rm -f "$0"
    cp -a "$ashlib/rs" "$0"
    exec "$SHELL" "$0" "$@"
    exit $?
  fi
fi

export ASHLIB="$ashlib"
. "$ashlib/ashlib.sh"
. "$ashlib/shesc.sh"

if [ $# -gt 0 ] && [ x"$1" = x"-s" ] ; then
  # Run using script...
  shift
  cmdline="$(shell_escape "$SHELL") $(shell_escape "$0")"
  for i in "$@"
  do
    cmdline="$cmdline $(shell_escape "$i")"
  done
  exec script -c "$cmdline" typescript.$(date +%F.%H.%M.%S)
fi

#
# Configuration statements
#
vars=""
cfg() {
  local kv k v cmd cvars=""
  for kv in "$@"
  do
    k="$(echo "$kv" | cut -d= -f1)"
    eval v=\"\${$k:-}\"
    if [ -z "$v" ] ; then
      v="$(echo "$kv" | cut -d= -f2-)"
    fi
    if (echo "$v" | grep -q "'") ; then
      cmd="$k=$(shell_escape "$v");"
    else
      cmd="$k='$v';"
    fi
    vars="$vars$cmd"
    cvars="$cvars$cmd"
  done
  eval "$cvars"
}
remote_target() {
  _bashonly_remote_target "$@"
}
_bashonly_remote_target() {
  run_cmd=( do_ssh "$@" )
}
run_cmd=( do_local )
no_remote_target() {
  echo "Ignoring remote target: $*" 1>&2
}

included=(.)
include_once() {
  _bashonly_include_once "$@"
}

_bashonly_include_once() {
  local f g ff
  local oPATH="$PATH" ; export PATH="$PATH:."

  for ff in "$@"
  do
    f="$(find_in_path "$ff")"
    if [ -z "$f" ] ; then
      echo "$ff: not included" 1>&2
      continue
    fi
    local __FILE__="$f" __DIR__="$(dirname "$f")"

    f="$(readlink -f "$f")"
    for g in "${included[@]}"
    do
      [ "$g" = "$f" ] && break
    done
    [ "$g" != "." ] && continue
    included=( "$f" "${included[@]}" )

    export PATH="$oPATH:.:$(dirname "$f")"
    . "$f"
  done
  export PATH="$oPATH"
}

load_snippets() {
  #
  # Include snippets ... be careful not to include the same file twice
  #
  include_once snippets.sh "$mydir/snippets.sh"  ${RS_SNIPPETS:-}
}

setx="${RS_SETX:-false}"
testmode="${RS_TESTMODE:-false}"

while [ $# -gt 0 ]
do
  case "$1" in
  -x|--set-x)
    setx=true
    ;;
  -t|--test)
    testmode=true
    ;;
  -l|--local)
    run_cmd=( do_local )
    remote_target() {
      no_remote_target "$@"
    }
    ;;
  --target=*)
    remote_target ${1#--target=}
    remote_target() {
      no_remote_target "$@"
    }
    ;;
  --*=*)
    jj=${1#--}
    cfg "$jj"
    ;;
  *)
    break
    ;;
  esac
  shift
done

if [ $# -eq 0 ] ; then
  cat <<-__EOF__
	Usage: $0 [options] {snippet} [args]
	Options:
	  -s : create typescript
	  -x : set -x
	  -t|--test: test mode
	  --local : force local mode
	  --target=dest : force remote target to dest
	  --key=value : define cfg value

	Snippets:
	$(
	  load_snippets
	  declare -F | grep '^declare -f [jpl]l_' | sed 's/^declare -f [jpl]l_//' | sort -u |while read f
	  do
	    eval g='"${ii_'$f':-}"'
	    if [ -n "$g" ] ; then
	      echo "- $f : $g"
	    else
	      echo "- $f"
	    fi
	  done
	)
	__EOF__
  exit 0
fi

#
# Main drivers
#
do_local() {
  # Handling local snippets...

  # Load ashlib modules...
  local f
  for f in core fixattr fixfile fixlnk kvped shesc solv_ln urlencode on_exit ${RS_ASHMODS:-}
  do
    include_once $ashlib/$f.sh
  done

  if (
    type spp_autolocal >/dev/null 2>&1 && spp_autolocal && run_local_fn spp_autolocal
    type spp_autoexec >/dev/null 2>&1 && run_local_fn spp_autoexec

    local pp found=false
    for pp in ll pl jl
    do
      if type ${pp}_${1} >/dev/null 2>&1 ; then
	run_local_fn --prefix="${pp}_" "$@"
	found=true
      fi
    done
    type spp_autoend >/dev/null 2>&1 && run_local_fn spp_autoend
    type spp_autoendlocal >/dev/null 2>&1 && run_local_fn spp_autoendlocal

    if ! $found ; then
      echo "$1: Snippet not found" 1>&2
      exit 1
    fi
  ) ; then
    echo 'OK' 1>&2
  else
    local err=$?
    echo "ERROR: $err" 1>&2
    exit $err
  fi
}

do_ssh() {
  _bashonly_do_ssh "$@"
}
_bashonly_do_ssh() {
  # Handling remote snippets
  local pp found=false
  for pp in ll pl jl
  do
    if type ${pp}_${1} >/dev/null 2>&1 ; then
      found=true
      break
    fi
  done
  if ! $found ; then
    echo "$1: unknown snippet" 1>&2
    exit 2
  fi

  if [ "$pp" = "jl" ] ; then
    # This is just a local snippet without any bells or wistles
    run_local_fn --prefix="jl_" "$@"
    return $?
  fi

  exec 3>&1 # Remember stdout...
  (
    # Create executable payload
    echo "set -euf"
    $setx && echo "set -x"

    type spp_autolocal >/dev/null 2>&1 && spp_autolocal
    echo "$vars"

    for f in core fixattr fixfile fixlnk kvped shesc solv_ln urlencode on_exit ${RS_ASHMODS:-}
    do
      cat $ashlib/$f.sh
    done
    export_fns

    type spp_autoexec >/dev/null 2>&1 && echo spp_autoexec

    if type ll_${1} >/dev/null 2>&1 ; then
      sshout() {
	"$@" 1>&4
      }
      rcmd() {
	sshout echo "$@"
      }
      run_local_fn --prefix="ll_" "$@" 4>&1 1>&3
    fi
    if type pl_${1} >/dev/null 2>&1 ; then
      echo -n "pl_$1" ; shift
      for f in "$@"
      do
	echo -n " $(shell_escape "$f")"
      done
      echo ''
    fi
    echo 'rc=$?'
    echo 'echo DONE: $rc'

    type spp_autoend >/dev/null 2>&1 && echo spp_autoend
    type spp_autoendlocal >/dev/null 2>&1 && run_local_fn spp_autoendlocal
    echo 'exit $rc'
  ) | (
    if $testmode ; then
      exec cat
    else
      set - "${run_cmd[@]}"
      shift
      exec ssh $(ck_sshagent) "$@"
    fi
    echo $?
  )
}

ck_sshagent() {
  [ -z "${SSH_AUTH_SOCK:-}" ] && return
  [ -e "$SSH_AUTH_SOCK" ] && echo '-A'
}

run_local_fn() {
  if [ $# -gt 1 ] ; then
    case "$1" in
    --prefix=*)
      local fn="${1#--prefix=}$2"
      shift 2
      set - "$fn" "$@"
      ;;
    esac
  fi
  if $testmode ; then
    declare -f "$1"
    #~ # Hack the function so that we only show it not run it...
    #~ eval "$(declare -f "$1" | (
      #~ while read ln
      #~ do
	#~ echo "$ln"
	#~ if [ x"$ln" = x"{" ] ; then
	  #~ echo "set -v -n -x"
	  #~ break
	#~ fi
      #~ done
      #~ cat
    #~ ))"
    #~ "$@"
  else
    $setx && set -x
    "$@"
    $setx && set +x
    return 0
  fi
}

export_fns() {
  for f in $(declare -F | grep '^declare -f ' | grep -v _bashonly_ | sed 's/^declare -f//')
  do
    declare -f "$f"
  done
}

ii_ping="test connectivity"
pl_ping() {
  echo "Hello world $(hostname)"
}
#######################################################################

#
# Environment files
#
[ -f "$mydir.env" ] && . "$mydir.env"
if [ -n "${RUN_ENVFILE:-}" ] ; then
  [ -f "${RUN_ENVFILE}" ] && . "${RUN_ENVFILE}"
fi
load_snippets


"${run_cmd[0]}" "$@"
