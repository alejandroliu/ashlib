#!/bin/sh
##
## Arbitrary id strings
##
mkid() {
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
