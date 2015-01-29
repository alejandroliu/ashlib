#!/bin/sh

find_key() {
  local key="$1"
  local sect="$2"
  local txt="$3"

  [ -n "$sect" ] && txt="$(echo "$txt" | sed '1,/^:\['"$sect"'\]/d')"
  txt="$(echo "$txt" | sed -n '1,/^:\[/p')"

  echo "MATCH $key in '$txt'"
  echo "$txt" | grep -q "^:[ 	]*$key[ 	]="
  x=$?
  echo $x
  return $x
}


kvped() {
  local FILE="$1" ; shift

  local ocont=""
  [ -f "$FILE" ] && ocont=$(sed 's/^/:/' < "$FILE")
  local ncont="$ocont"

  local kvp
  for kvp in "$@"
  do
    [ -z "$kvp" ] && continue
    if [ x"$(expr substr "$kvp" 1 1)" = x"-" ] ; then
      local key="$(expr substr "$kvp" 2 1024)" sect=""
      if echo "$key" | grep -q '\.' ; then
	sect="$(echo "$key" | cut -d. -f1)"
	key="$( echo "$key" | cut -d. -f2)"
      fi
      #
      # Delete a key...
      #
      if [ -z "$sect" ] ; then
	ncont="$(echo "$ncont" | sed  '1,/^:\[/{/^:[ 	]*'"$key"'[ 	]*=/d}')"
      else
	ncont="$(echo "$ncont" | sed  '/^:\['"$sect"'\]/,/^:\[/{/^:[ 	]*'"$key"'[ 	]*=/d}')"
      fi
    else
      local sect='' key='' val=''
      val="$(echo "$kvp" | cut -d= -f2-)"
      key="$(echo "$kvp" | cut -d= -f1)"
      if echo "$key" | grep -q '\.' ; then
	sect="$(echo "$key" | cut -d. -f1)"
	key="$(echo "$key" | cut -d. -f2)"
      fi

      # Trivial case... missing section
      if [ -n "$sect" ] ; then
	if echo "$ncont" | grep -q "^:\[$sect\]" ; then
	  # Section found
	  :
	else
	  ncont="$(echo "$ncont" ; echo ":[$sect]" ; echo ":$key=$val")"
	  echo "ADD SECT $sect"
	  echo "$ncont"
	  echo "* * *"
	fi
      fi

      #if find_key "$key" "$sect" "$ncont" ; then
      ## Found!
      #echo "Edit key $key $sect"
      #else 
      #echo "Add key $key $sect"
      #fi

      # Matching pattern...
      if [ -z "$sect" ] ; then
	local spath="1,/^:\[/"
      else
	local spath="/^:\[$sect\]/,/^:\[/"
      fi

    fi
  done
}

kvped test.ini one.two=three via=noa -value1 value1=hi section.value1=no




# modify a entry (global)
# add an entry (global)
# delete an entry (global)
# modify a entry (section)
# add an entry (section)
# add entry to new section
# delete an entry (section)

# abc.cba=val
# abc=val
# -dxyz or -dxyz.zzyx
#
