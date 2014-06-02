#!/bin/sh
#
# Reference functions
#
#****f*
# FUNCTION
#   create a symbol from a given string
#
#   It is meant to sanitize text so it is suitable for variable nameing.
# SYNOPSIS
#   mksym txt
# INPUTS
#   txt -- text to convert into variable name
# OUTPUT
#   sanitized text
#****
mksym() {
  tr ' /.a-z-' '___A-Z_'  <<<"$*"| tr -dc '_A-Z0-9'
}

#****f*
# FUNCTION
#   Assigns a value to the named variable.  It is intented to accept
#   variables for the varname parameter
# SYNOPSIS
#   assign varname varvalue
# INPUTS
#   varname -- variable to assign a value
#   value -- value to assign
#****
assign() {
  local var="$1"
  eval "$1=\"\$2\""
}

#****f*
# FUNCTION
#   Returns the value of varname.  It is meant to allow variables
#   to be used for varnames.
# SYNOPSIS
#   get varname
# INPUTS
#   varname -- variable to lookup
# OUTPUT
#   value of varname
#****
get() {
  eval echo \"\$$1\"
}


