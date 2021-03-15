# API docs

## Modules

* [ashlib.sh](#idffd921712058fa2f06a1d30244c15a6f)
* [cfv.sh](#id9019d8761ef8d7214af93c55e2822f54)
* [core.sh](#id9a3132e6272f32dafc2231703598e6a9)
* [fixattr.sh](#id803ba90cea72dbccc78e418701e00871)
* [fixfile.sh](#id45e162b38f2f1be9db6574209fc7910c)
* [fixlnk.sh](#iddfbd26f6bcc1362d842e921421c0aa8c)
* [jobqueue.sh](#id509df82dd312617c416423e9f62124a8)
* [kvped.sh](#id5fb6ba6c81dc28eedf0df3e2ba155f1c)
* [mkid.sh](#ide5f098a9c8fc5466e4ef148ca4a19a05)
* [mnt.sh](#id0ff04fe1eb718fc8dcfa67323e80eb2a)
* [network.sh](#idd06d403b38e0abfc8c88688e78504674)
* [on_exit.sh](#id66bddc838a92b164203b09563e403172)
* [pp.sh](#idb3466428ed7fa15c0c78fb8fea22d1e2)
* [randpw.sh](#idc9c99aabd02e0f1f60565b21c48f1845)
* [refs.sh](#id5b306578a1c827d077d30e27023183a3)
* [rotate.sh](#id32936da437148dd5f08db046297b455e)
* [sdep.sh](#idb9f2656e147700a022cc3bd69b3fc9d2)
* [shesc.sh](#ida0fec3c3924f6b7d92a1a735fdfef9bd)
* [solv_ln.sh](#id7cd3c163f5946f312d8d67438718e7f1)
* [spk_enc.sh](#idbd3949c6c3cff681feef8d49312e9310)
* [urlencode.sh](#id0a29b969f7d331f4462051a135e2e4d4)
* [ver.sh](#id6a9e8d7c4df6435bc841b6c60f679f69)

## Functions

* [_do_shesc](#idda9ba5fc4ceb2684ebf096be94b75826) ([shesc.sh](#ida0fec3c3924f6b7d92a1a735fdfef9bd))
* [_kvp_find_sect](#iddaa6f9c4ab705ea4e8cccaa7347e4c75) ([kvped.sh](#id5fb6ba6c81dc28eedf0df3e2ba155f1c))
* [_kvp_in_sect](#id914441683f1c4fc1779891aa89ee3d5a) ([kvped.sh](#id5fb6ba6c81dc28eedf0df3e2ba155f1c))
* [_kvpadd](#ida6e8d14ba6a345032b9aac0dba2461d2) ([kvped.sh](#id5fb6ba6c81dc28eedf0df3e2ba155f1c))
* [_kvpappend](#id93b9b2f950cc8ad8cf977203588e2d54) ([kvped.sh](#id5fb6ba6c81dc28eedf0df3e2ba155f1c))
* [_kvpparsekvp](#idac26bce42d0806ba0ed287f9effc608a) ([kvped.sh](#id5fb6ba6c81dc28eedf0df3e2ba155f1c))
* [assign](#id849d21e47dd393f960242d66a833bec6) ([refs.sh](#id5b306578a1c827d077d30e27023183a3))
* [cfv](#id1312191e776d42f9933d3b5ad9dec8d0) ([cfv.sh](#id9019d8761ef8d7214af93c55e2822f54))
* [exit_handler](#idfc752edfe7beaa671c632be87c402489) ([on_exit.sh](#id66bddc838a92b164203b09563e403172))
* [fatal](#id4c4fd598994533050c02ae49ba4af566) ([core.sh](#id9a3132e6272f32dafc2231703598e6a9))
* [find_in_path](#id271fc5b5d259b5634a1fc97aea302ae7) ([ashlib.sh](#idffd921712058fa2f06a1d30244c15a6f))
* [find_nic](#idf00297571499302861fbd99eebf70205) ([network.sh](#idd06d403b38e0abfc8c88688e78504674))
* [fixattr](#id92e0095f760c0308693d1c6b8b927d2a) ([fixattr.sh](#id803ba90cea72dbccc78e418701e00871))
* [fixfile](#id0980f1da72164338b94838b688224623) ([fixfile.sh](#id45e162b38f2f1be9db6574209fc7910c))
* [fixlnk](#id8569d0cfc56f995d8341b87c9ee8490a) ([fixlnk.sh](#iddfbd26f6bcc1362d842e921421c0aa8c))
* [get](#id4632c8d1245241bc21707033fe21ac93) ([refs.sh](#id5b306578a1c827d077d30e27023183a3))
* [gitver](#id846353a269ae44f882750a35618d42de) ([ver.sh](#id6a9e8d7c4df6435bc841b6c60f679f69))
* [ifind_in_path](#ida9884ee3a3823a7d0bd06656a54c9ed1) ([ashlib.sh](#idffd921712058fa2f06a1d30244c15a6f))
* [include](#idd087ba968162ba26d3492ab5df0b653a) ([ashlib.sh](#idffd921712058fa2f06a1d30244c15a6f))
* [job_queue](#idac06567f4f6638a3f132e9caf0eb92a2) ([jobqueue.sh](#id509df82dd312617c416423e9f62124a8))
* [job_worker](#ida29d42d961b6ff56e596cc934cc3dc79) ([jobqueue.sh](#id509df82dd312617c416423e9f62124a8))
* [kvped](#id125f332d4d55a39e7acfe170c87b2201) ([kvped.sh](#id5fb6ba6c81dc28eedf0df3e2ba155f1c))
* [mkid](#id566ae29c744927e330b3af31a7694bed) ([mkid.sh](#ide5f098a9c8fc5466e4ef148ca4a19a05))
* [mksym](#id54957d98a3229b58ae98bc7961c6e674) ([refs.sh](#id5b306578a1c827d077d30e27023183a3))
* [on_exit](#idfdfa2511ae59e20917bf176c230fabb3) ([on_exit.sh](#id66bddc838a92b164203b09563e403172))
* [pp](#id6be50960c2fd7034c4b4bfcb47179c91) ([pp.sh](#idb3466428ed7fa15c0c78fb8fea22d1e2))
* [ppCmd](#idc22b9642c9c8d9c3409ead9ed00f8d2a) ([pp.sh](#idb3466428ed7fa15c0c78fb8fea22d1e2))
* [ppSimple](#id61682546b7c0260a6590031e44eac992) ([pp.sh](#idb3466428ed7fa15c0c78fb8fea22d1e2))
* [quit](#idf4a61a2d64096d92e0b3c094bb55b27f) ([core.sh](#id9a3132e6272f32dafc2231703598e6a9))
* [randpw](#idfa4d2a7682d9fdbb25c07ce8394da1e7) ([randpw.sh](#idc9c99aabd02e0f1f60565b21c48f1845))
* [rotate](#idb1bc78262ce2d419f4bbd1a0b6b1dcaf) ([rotate.sh](#id32936da437148dd5f08db046297b455e))
* [sdep](#idb68b04cc4e001a96c2902d075b57039c) ([sdep.sh](#idb9f2656e147700a022cc3bd69b3fc9d2))
* [shell_escape](#id5c9e0d5935ecd7b69ec967a316ba8a09) ([shesc.sh](#ida0fec3c3924f6b7d92a1a735fdfef9bd))
* [solv_ln](#id5fa6216b7f8aa6562af0cee098da4977) ([solv_ln.sh](#id7cd3c163f5946f312d8d67438718e7f1))
* [spk_crypt](#id4e34e58f0a8e67a3f4311699d605d536) ([spk_enc.sh](#idbd3949c6c3cff681feef8d49312e9310))
* [spk_decrypt](#id6be32e83c4383dfa860034e605fd10ca) ([spk_enc.sh](#idbd3949c6c3cff681feef8d49312e9310))
* [spk_encrypt](#id100ba1ad39db5602f68e4fce4fad8227) ([spk_enc.sh](#idbd3949c6c3cff681feef8d49312e9310))
* [spk_pem_decrypt](#idead3561114f598a3e9a2202e7a6c2683) ([spk_enc.sh](#idbd3949c6c3cff681feef8d49312e9310))
* [spk_pem_encrypt](#id5abc89c8067654c9f8e0be36d67c54a4) ([spk_enc.sh](#idbd3949c6c3cff681feef8d49312e9310))
* [spk_private_key](#id5f3e327d9297d153c1710627eb53edb6) ([spk_enc.sh](#idbd3949c6c3cff681feef8d49312e9310))
* [spk_public_key](#idb79a0e4af17f4148ab6d5ef84aec9627) ([spk_enc.sh](#idbd3949c6c3cff681feef8d49312e9310))
* [sppinc](#id7b8947faa83df0570502472204954850) ([pp.sh](#idb3466428ed7fa15c0c78fb8fea22d1e2))
* [urldecode](#ida6f070dd764a74fc912948e0b572ac89) ([urlencode.sh](#id0a29b969f7d331f4462051a135e2e4d4))
* [urlencode](#id7bac90220760ff12ae0cb10b74754208) ([urlencode.sh](#id0a29b969f7d331f4462051a135e2e4d4))
* [warn](#id84676847fba018e6e735741efe42699d) ([core.sh](#id9a3132e6272f32dafc2231703598e6a9))

* * *

## <a name="idffd921712058fa2f06a1d30244c15a6f"></a>ashlib.sh

This is a implicit module automatically invoked by:

   eval $(ashlib)

The `core` module is included automatically.



### <a name="id271fc5b5d259b5634a1fc97aea302ae7"></a>find_in_path

  Find a file in a path

#### USAGE

  find_in_path [--path=PATH] file

#### OPTIONS

* --path=PATH : don't use $PATH but the provided PATH

#### DESC

Find a file in the provided path or PATH environment
variable.

#### RETURNS

0 if found, 1 if not found

#### OUTPUT

full path of found file



### <a name="ida9884ee3a3823a7d0bd06656a54c9ed1"></a>ifind_in_path

Determines if the specified file is in the path variable

#### USAGE

  ifind_in_path needle haystack_variable

#### ARGS

* needle -- item to find in the path variable
* haystack_variable -- name of the variable contining path

#### RETURNS

0 if found, 1 if not found

#### OUTPUT

full path of found file



### <a name="idd087ba968162ba26d3492ab5df0b653a"></a>include

Include an `ashlib` module.

#### USAGE

  include [--once] module [other modules ...]

#### ARGS

* --once|-1 : if specified, modules will not be included more than once
* module -- module to include

#### RETURNS

0 on success, otherwise the number of failed modules.



## <a name="id9019d8761ef8d7214af93c55e2822f54"></a>cfv.sh

Configurable variables

Define variables only if not specified.  It is used to
configure things via environment variables and provide
suitable defaults if there is none.

The way it works is to simply call the command like this:

VARIABLE=value command args

Then in the script, you woudld do:

cfv VARIABLE default



### <a name="id1312191e776d42f9933d3b5ad9dec8d0"></a>cfv

Define a configurable variable

#### USAGE

   cfv VARNAME value

#### ARGS

* VARNAME -- variable to define
* value -- default to use



## <a name="id9a3132e6272f32dafc2231703598e6a9"></a>core.sh

Some simple misc functions



### <a name="id4c4fd598994533050c02ae49ba4af566"></a>fatal

Fatal error

#### USAGE

   fatal message

#### DESC

Show the fatal error on stderr and terminates the script.



### <a name="idf4a61a2d64096d92e0b3c094bb55b27f"></a>quit

Exit with status

#### USAGE

   quit exit_code message

#### DESC

Show the fatal error on stderr and terminates the script with
exit_code.



### <a name="id84676847fba018e6e735741efe42699d"></a>warn

  Show a warning on stderr

#### USAGE

  warn message



## <a name="id803ba90cea72dbccc78e418701e00871"></a>fixattr.sh

### <a name="id92e0095f760c0308693d1c6b8b927d2a"></a>fixattr

Updates file attributes

#### USAGE

  fixattr [options] file

#### OPTIONS

* --mode=mode -- Target file mode
* --user=user -- User to own the file
* --group=group -- Group that owns the file
* file -- file to modify.

#### DESC

This function ensures that the given `file` has the defined file modes,
owner user and owner groups.



## <a name="id45e162b38f2f1be9db6574209fc7910c"></a>fixfile.sh

### <a name="id0980f1da72164338b94838b688224623"></a>fixfile

Function to modify files in-place.

#### USAGE

  fixfile [options] file

#### OPTIONS

* -D -- if specified, containing directory is created.
* --mode=mode -- mode to set permissions to.
* --user=user -- set ownership to user
* --group=group -- set group to group
* --nobackup -- disable creation of backups
* --backupdir=dir -- if specified, backups are saved to the central dir.
* --backupext=ext -- Backups are created by adding ext.  Defaults to "~".
* --filter -- Use filter mode.  The stdin is used as an script that will
    modify stdin (current file) and the stdout is used as the new contents
    of the file.
* --decode -- input is considered to be gzippped|base64 encoded data
* file -- file to modify

#### DESC

Files are modified in-place only if the contents change.  This means
time stamps are kept accordingly.

<stdin> will be used as the contents of the new file unless --filter
is specified.  When in filter mode, the <stdin> is a shell script
that will be executed with <stdin> is the current contents of the
file and <stdout> as the new contents of the file.
Again, file is only written to if its conents change.



## <a name="iddfbd26f6bcc1362d842e921421c0aa8c"></a>fixlnk.sh

### <a name="id8569d0cfc56f995d8341b87c9ee8490a"></a>fixlnk

Function to update symlinks

#### USAGE

   fixlnk [-D] target lnk

#### ARGS

* -D -- if specified, link directory is created.
* target -- where the link should be pointing to
* lnk -- where the link is to be created

#### DESC

Note that this will first check if the symlink needs to be corrected.
Otherwise no action is taken.



## <a name="id509df82dd312617c416423e9f62124a8"></a>jobqueue.sh

### <a name="idac06567f4f6638a3f132e9caf0eb92a2"></a>job_queue

Run jobs in a queue

#### USAGE

  <job generator> | job_queue [--workers=n] job_cmd [args]

#### OPTIONS

* --workers=n -- number of worker threads (defaults to 4)
* --verbose : output messages
* job_cmd -- command to execute
* args -- optional arguments

#### RETURNS

1 on error

#### DESC




### <a name="ida29d42d961b6ff56e596cc934cc3dc79"></a>job_worker

This is the worker thread function



## <a name="id5fb6ba6c81dc28eedf0df3e2ba155f1c"></a>kvped.sh

### <a name="iddaa6f9c4ab705ea4e8cccaa7347e4c75"></a>_kvp_find_sect

### <a name="id914441683f1c4fc1779891aa89ee3d5a"></a>_kvp_in_sect

### <a name="ida6e8d14ba6a345032b9aac0dba2461d2"></a>_kvpadd

### <a name="id93b9b2f950cc8ad8cf977203588e2d54"></a>_kvpappend

### <a name="idac26bce42d0806ba0ed287f9effc608a"></a>_kvpparsekvp

### <a name="id125f332d4d55a39e7acfe170c87b2201"></a>kvped

Function to modify INI files in-place.

#### USAGE

  kvped [options] file [modifiers]

#### OPTIONS

* --nobackup -- disable creation of backups
* --backupdir=dir -- if specified, backups are saved to the central dir.
* --backupext=ext -- Backups are created by adding ext.  Defaults to "~".
* file -- file to modify

#### DESC

Files are modified in-place only if the contents change.  This means
time stamps are kept accordingly.

*kvped* will read the given `file` and will apply the respective
modifiers.  The following modifiers are recognized:

* key=value :: Sets the `key` to `value` in the global (default)
  section.
* section.key=value :: sets the `key` in `section` to `value`.
* -key :: If a key begins with `-` it will be deleted.
* -section.key :: The `key` from `section` will be deleted.



## <a name="ide5f098a9c8fc5466e4ef148ca4a19a05"></a>mkid.sh


Arbitrary id strings



### <a name="id566ae29c744927e330b3af31a7694bed"></a>mkid

create arbitrary id strings

#### USAGE

mkid txt

#### ARGS

* txt -- text to convert into id

#### OUTPUT

sanitized text

#### DESC

Given an arbitrary input text, this creates a suitable id for
it.



## <a name="id0ff04fe1eb718fc8dcfa67323e80eb2a"></a>mnt.sh

Determine if the given directory is a mount point

### USAGE

is_mounted directory

### ARGS

* directory -- directory mount point

### DESC

Determine if the given directory is a mount point



## <a name="idd06d403b38e0abfc8c88688e78504674"></a>network.sh

Network functions

Some utilities used to manage network and related tasks



### <a name="idf00297571499302861fbd99eebf70205"></a>find_nic

find a nic from a MAC address

#### Usage

   find_nic mac

#### ARGS

* mac -- mac address to find (xx:xx:xx:xx:xx)

#### OUTPUT

The device name that belongs to that mac address

#### DESC

Given a mac address, returns the network interface to use in
ifconfig or other commands.



## <a name="id66bddc838a92b164203b09563e403172"></a>on_exit.sh

Used to manage multiple exit handlers



### <a name="idfc752edfe7beaa671c632be87c402489"></a>exit_handler

Actual exit function

#### USAGE

  trap exit_handler EXIT

#### DESC

Actual function that gets hooked into the standard EXIT trap
and calls all the registered exit handlers.



### <a name="idfdfa2511ae59e20917bf176c230fabb3"></a>on_exit

Register a command to be called on exit

#### USAGE

  on_exit exit_command

#### DESC

Adds a shell command to be executed on exit.
Instead of hooking `trap` _cmd_ `exit`, **on_exit** is cumulative,
so multiple calls to **on_exit** will not replace the exit handler
but add to it.

Only single commands are supported.  For more complex **on_exit**
sequences, declare a function and call that instead.



## <a name="idb3466428ed7fa15c0c78fb8fea22d1e2"></a>pp.sh

### <a name="id6be50960c2fd7034c4b4bfcb47179c91"></a>pp

Pre-processor
USAGE
	pp < input > output
DESC
Read some textual data and output post-processed data.

Uses HERE_DOC syntax for the pre-processing language.
So for example, variables are expanded directly as `$varname`
whereas commands can be embedded as `$(command call)`.

As additional extension, lines of the form:

```

#####! command

```

Are used to include arbitrary shell commands.  These however
are executed in line (instead of a subshell as in `$(command)`.
This means that commands in `##!` lines can be used to define
variables, macros or include other files.



### <a name="idc22b9642c9c8d9c3409ead9ed00f8d2a"></a>ppCmd

Command line `pp` driver

USAGE
	ppCmd [--output=output] -Iinclude-path -Dcmd file.m.ext ...
DESC
Implements a command line interface for the `pp` function

Input files of the form `file.m.ext` are then pre-processed and
the result is named `file.ext`.



### <a name="id61682546b7c0260a6590031e44eac992"></a>ppSimple

Pre-processor
USAGE
	ppSimple < input > output
DESC
Read some textual data and output post-processed data.

Uses HERE_DOC syntax for the pre-processing language.
So for example, variables are expanded directly as `$varname`
whereas commands can be embedded as `$(command call)`.



### <a name="id7b8947faa83df0570502472204954850"></a>sppinc

## <a name="idc9c99aabd02e0f1f60565b21c48f1845"></a>randpw.sh

### <a name="idfa4d2a7682d9fdbb25c07ce8394da1e7"></a>randpw

Generate a random password

#### Usage

   randpw [cnt]

#### ARGS

* cnt - password length

#### OUTPUT

Random password



## <a name="id5b306578a1c827d077d30e27023183a3"></a>refs.sh

Symbolic/Reference functions

Let's you add a level of indirection to shell scripts



### <a name="id849d21e47dd393f960242d66a833bec6"></a>assign

Assigns a value to the named variable

#### USAGE

    assign varname varvalue

#### ARGS

* varname -- variable to assign a value
* value -- value to assign

#### DESC

This function assigns a value to the named variable.  Unlink straight
assignment with `=`, the variable name can be a variable itself referring
to the actual variable.



### <a name="id4632c8d1245241bc21707033fe21ac93"></a>get

Returns the value of varname.

#### USAGE

  get varname

#### ARGS

* varname -- variable to lookup.

#### OUTPUT

  value of varname

#### DESC

`get` will display the value of the provided varname.  Unlike direct
references with `$`, the varname can be itself a variable containing
the actual variable to be referenced.



### <a name="id54957d98a3229b58ae98bc7961c6e674"></a>mksym

create a symbol from a given string

#### USAGE

   mksym txt

#### ARGS

* txt -- text to convert into variable name

#### OUTPUT

sanitized text

#### DESC

Given an arbitrary input text, this creates a suitable symbol for
it.

This function is meant to sanitize text so it is suitable for variable
nameing.



## <a name="id32936da437148dd5f08db046297b455e"></a>rotate.sh

### <a name="idb1bc78262ce2d419f4bbd1a0b6b1dcaf"></a>rotate

Function to rotate log files

#### USAGE

   rotate [options] file [files ...]

#### OPTIONS

* --count=n -- number of archive files (defaults to 10)

#### DESC

Rotates a logfile file by subsequently creating up to
count archive files of it. Archive files are
named "file.number[compress-suffix]" where number is the version
number, 0 being the newest and "count-1" the oldest.



## <a name="idb9f2656e147700a022cc3bd69b3fc9d2"></a>sdep.sh

### <a name="idb68b04cc4e001a96c2902d075b57039c"></a>sdep

## <a name="ida0fec3c3924f6b7d92a1a735fdfef9bd"></a>shesc.sh

Shell escape function.  Quotes strings so they can be safefly included
parsed by eval or in other scripts.



### <a name="idda9ba5fc4ceb2684ebf096be94b75826"></a>_do_shesc

### <a name="id5c9e0d5935ecd7b69ec967a316ba8a09"></a>shell_escape

  Escape string for shell parsing

#### USAGE

  shell_escape [options] "string"

#### OPTIONS

* -q : Always include single quotes
* - : End of options

#### DESC

shell_escape will examine the passed string in the
arguments and add any appropriate meta characters so that
it can be safely parsed by a UNIX shell.

It does so by enclosing the string with single quotes (if
it the string contains "unsafe" characters.).  If the string
only contains safe characters, nothing is actually done.



## <a name="id7cd3c163f5946f312d8d67438718e7f1"></a>solv_ln.sh

### <a name="id5fa6216b7f8aa6562af0cee098da4977"></a>solv_ln

Resolves symbolic links so they are relative paths

#### USAGE

    solv_ln target linkname

#### ARGS

* target - target path (as used with `ln -s`)
* linkname - link to be created

#### OUTPUT

Relative path from linkname to target

#### DESC

Given two paths in the same format as creating a symbolic link
using `ln -s`, it will return a relative path from `linknam` to
`target` as if `linknam` was a symbolic link to `target`.

`target` and `linkname` can be provided as absolute or relative
paths.



## <a name="idbd3949c6c3cff681feef8d49312e9310"></a>spk_enc.sh

### <a name="id4e34e58f0a8e67a3f4311699d605d536"></a>spk_crypt

Encrypt or decrypt `stdin` using a `ssh` public/private key.

#### USAGE

    spk_crypt [--encrypt|--decrypt] [--base64] [--passwd=xxxx] [--public|--private|--auto] <key-file>

#### ARGS


#### --encrypt : set encrypt mode


#### --decrypt : set decrypt mode

* --base64 : if specified, data will be base64 encoded.
* --passwd=xxxx : password for encrypted private key (if any)
* --public : use public key
* --private : use private key
* --auto : key type is determined from file.
* key-file :  key file to use.  If it contains multiple public keys, the first `rsa` key found is used.

#### OUTPUT

Encrypted/Decrypted data



### <a name="id6be32e83c4383dfa860034e605fd10ca"></a>spk_decrypt

Decrypt `stdin` using a `ssh` public/private key.

#### USAGE

    spk_decrypt [--base64] [--passwd=xxxx] [--public|--private|--auto] <key-file>

#### ARGS

* --base64 : if specified, data will be base64 encoded.
* --passwd=xxxx : password for encrypted private key (if any)
* --public : use public key
* --private : use private key
* --auto : key type is determined from file.
* key-file :  key file to use.  If it contains multiple public keys, the first `rsa` key found is used.

#### OUTPUT

Encrypted data



### <a name="id100ba1ad39db5602f68e4fce4fad8227"></a>spk_encrypt

Encrypt `stdin` using a `ssh` public/private key.

#### USAGE

    spk_encrypt [--base64] [--passwd=xxxx] [--public|--private|--auto] <key-file>

#### ARGS

* --base64 : if specified, data will be base64 encoded.
* --passwd=xxxx : password for encrypted private key (if any)
* --public : use public key
* --private : use private key
* --auto : key type is determined from file.
* key-file :  key file to use.  If it contains multiple public keys, the first `rsa` key found is used.

#### OUTPUT

Encrypted data



### <a name="idead3561114f598a3e9a2202e7a6c2683"></a>spk_pem_decrypt

Decrypt `stdin` using a `PKCS8/PEM` key.

#### USAGE

    spk_decrypt [--base64] <key-file>

#### ARGS

* --base64 : input data is base64 encoded
* key-file : key file to use.

#### OUTPUT

De-crypted data



### <a name="id5abc89c8067654c9f8e0be36d67c54a4"></a>spk_pem_encrypt

Encrypt `stdin` using a `PKCS8/PEM` key.

#### USAGE

    spk_pem_encrypt [--base64] <key-file>

#### ARGS

* --base64 : if specified, data will be base64 encoded.
* key-file : key file to use.

#### OUTPUT

Encrypted data



### <a name="id5f3e327d9297d153c1710627eb53edb6"></a>spk_private_key

Prepare a private key

#### USAGE

    spk_private [--passwd=xxx] <key-file> <output>

#### ARGS

* key-file : key file to use
* output : output file to use
* --passwd=password : password for private key

#### DESC

Reads a OpenSSH private key and create a key file usable by OpenSSL



### <a name="idb79a0e4af17f4148ab6d5ef84aec9627"></a>spk_public_key

Prepare a public key

#### USAGE

    spk_public <key-file> <output>

#### ARGS

* key-file : public key file to use.  Will use the first `rsa` key found
* output : output file to use

#### DESC

Reads a OpenSSH public key and create a key file usable by OpenSSL



## <a name="id0a29b969f7d331f4462051a135e2e4d4"></a>urlencode.sh

Functions for URL encoding/decoding



### <a name="ida6f070dd764a74fc912948e0b572ac89"></a>urldecode

Decodes URL encoded strings

#### USAGE

  urldecode text



### <a name="id7bac90220760ff12ae0cb10b74754208"></a>urlencode

URL encodes to escape special characters

#### USAGE

  urlencode text



## <a name="id6a9e8d7c4df6435bc841b6c60f679f69"></a>ver.sh

### <a name="id846353a269ae44f882750a35618d42de"></a>gitver

Determine the current version information from git

#### USAGE

    gitver _git-directory_

#### ARGS

* git-directory : Directory to the git repository

#### OUTPUT

version information




