#!/bin/sh
#
#****h* ashlib/mkid
# FUNCTION
# Create arbintrary id strings
#****

##
## Arbitrary id strings
##
mkid() {
  #****f* mkid/mkid
  # NAME
  #   mkid -- create arbitrary id strings
  # SYNOPSIS
  #   mkid _text_
  # INPUTS
  # * text -- text to convert into id
  # OUTPUT
  # Sanitized text
  # FUNCTION
  # `mkid` accepts a string and sanitizes it so
  # that it can be used as a shell variable name
  #****
  ## create arbitrary id strings
  ## # USAGE
  ## mkid txt
  ## # ARGS
  ## * txt -- text to convert into id
  ## # OUTPUT
  ## sanitized text
  ## # DESC
  ## Given an arbitrary input text, this creates a suitable id for
  ## it.
  echo "$*" | tr ' -' '__' | tr -dc '_A-Za-z0-9' \
  		| sed -e 's/^\([0-9]\)/_n\1/'
}
