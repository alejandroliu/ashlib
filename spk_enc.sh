#!/bin/sh
#
# Some SSL/SSH related encryption functions
#


spk_encrypt() {
## Encrypt `stdin` using a `ssh` public key.
## # USAGE
##     spk_encrypt [--base64] <public_key>
## # ARGS
## * --base64 : if specified, data will be base64 encoded.
## * public_key : public key file to use.  Will use the first `rsa` key found
## # OUTPUT
## Encrypted data
  local encode=false
  while [ $# -gt 0 ]
  do
    case "$1" in
      --base64) encode=true ;;
      --no-base64) encode=false ;;
      *) break
    esac
    shift
  done

  local pubkey="$1"
  [ ! -f "$pubkey" ] && return 1 || :
  pubkey=$(awk '$1 == "ssh-rsa" { print ; exit }' < "$pubkey")
  [ -z "$pubkey" ] && return 2 || :

  local w=$(mktemp -d) rc=0
  (
    echo "$pubkey" > "$w/recv-key.pub"
    ssh-keygen -e -f "$w/recv-key.pub" -m PKCS8 > "$w/recv-key.pkcs8"
    openssl rand -out "$w/secret.key" 32
    openssl rsautl -encrypt -oaep -pubin -inkey "$w/recv-key.pkcs8" -in "$w/secret.key" -out "$w/secret.key.enc"
    base64 < "$w/secret.key.enc"
    echo ""
    openssl aes-256-cbc -pass file:$w/secret.key $($encode && echo -a)
  ) || rc=$?
  rm -rf "$w"
  return $rc
}

spk_decrypt() {
## Decrypt `stdin` using a `ssh` private key.
##
## Password source can be one of the following:
##
## - pass:text
## - file:path
## - env:var
## - fd:number
## - stdin
##
## # USAGE
##     spk_decrypt [--base64] <private_key>
## # ARGS
## * --base64 : if specified, data will be base64 encoded.
## * --passwd=password : password for private key
## * private_key : private key file to use.
## # OUTPUT
## De-crypted data
  local encoded=false passin=""
  while [ $# -gt 0 ]
  do
    case "$1" in
      --base64) encoded=true ;;
      --no-base64) encoded=false ;;
      --passwd=*) passin="-passin ${1#--passwd=}" ;;
      *) break
    esac
    shift
  done

  local privkey="$1"
  [ ! -f "$privkey" ] && return 1 || :

  local w=$(mktemp -d) rc=0
  (
    local keydat="" line
    while read -r line
    do
      [ -z "$line" ] && break || :
      keydat="$keydat$line"
    done

    echo "$keydat" | base64 -d > $w/secret.key.enc
    cp -a "$privkey" "$w/privkey"
    if [ -n "$passin" ] ; then
      ssh-keygen -p -N '' -P "$passin" -f "$w/privkey" -m pem >/dev/null
    else
      ssh-keygen -p -N '' -f "$w/privkey" -m pem >/dev/null
    fi
    openssl rsautl -decrypt -oaep -inkey "$w/privkey" -in "$w/secret.key.enc" -out "$w/secret.key"
    openssl aes-256-cbc -d -pass file:$w/secret.key $($encoded && echo -a)
  ) || rc=$?
  rm -rf "$w"
  return $rc
}

