#!/bin/sh
#
#

randpw() {
  ## Generate a random password
  ## # Usage
  ##    randpw [cnt]
  ## # ARGS
  ## * cnt - password length
  ## # OUTPUT
  ## Random password
  local cnt=32 i
  [ $# -gt 0 ] && cnt="$1"

  local n=$(expr $cnt \* 3 / 4 + 1) # adjust due to base64 encoding...
  local tx="$((for i in $(seq 1 $n)
  do
    echo -ne $(printf '\\x%02x' $(expr $RANDOM % 256))
  done) | base64 -w 0)"

  expr substr "$tx" 1 $cnt
}

#~ for j in '' 32 16 8 4 30 $(seq 8 20) 50 64 80 90 71 4096
#~ do
  #~ k=$(randpw $j)
  #~ echo $j:$(expr length "$k") $k
#~ done


