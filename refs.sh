#!/bin/sh
#
# Reference functions
#
mksym() {
  tr ' /.a-z-' '___A-Z_'  <<<"$*"| tr -dc '_A-Z0-9'
}

assign() {
  local var="$1"
  eval "$1=\"\$2\""
}

get() {
  eval echo \"\$$1\"
}


