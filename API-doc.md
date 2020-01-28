# API docs

## Modules

* [ashlib.sh](#id01)
* [core.sh](#id04)
* [fixattr.sh](#id08)
* [fixfile.sh](#id0a)
* [fixlnk.sh](#id0c)
* [kvped.sh](#id0e)
* [mkid.sh](#id15)
* [mnt.sh](#id17)
* [network.sh](#id18)
* [on_exit.sh](#id1a)
* [pp.sh](#id1d)
* [refs.sh](#id21)
* [rotate.sh](#id25)
* [shesc.sh](#id27)
* [solv_ln.sh](#id29)
* [urlencode.sh](#id2b)
* [ver.sh](#id2e)

## Functions

* [_kvp_find_sect](#id11) ([kvped.sh](#id0e))
* [_kvp_in_sect](#id12) ([kvped.sh](#id0e))
* [_kvpadd](#id13) ([kvped.sh](#id0e))
* [_kvpappend](#id10) ([kvped.sh](#id0e))
* [_kvpparsekvp](#id0f) ([kvped.sh](#id0e))
* [assign](#id23) ([refs.sh](#id21))
* [exit_handler](#id1b) ([on_exit.sh](#id1a))
* [fatal](#id06) ([core.sh](#id04))
* [find_in_path](#id02) ([ashlib.sh](#id01))
* [find_nic](#id19) ([network.sh](#id18))
* [fixattr](#id09) ([fixattr.sh](#id08))
* [fixfile](#id0b) ([fixfile.sh](#id0a))
* [fixlnk](#id0d) ([fixlnk.sh](#id0c))
* [get](#id24) ([refs.sh](#id21))
* [gitver](#id2f) ([ver.sh](#id2e))
* [include](#id03) ([ashlib.sh](#id01))
* [kvped](#id14) ([kvped.sh](#id0e))
* [mkid](#id16) ([mkid.sh](#id15))
* [mksym](#id22) ([refs.sh](#id21))
* [on_exit](#id1c) ([on_exit.sh](#id1a))
* [pp](#id1e) ([pp.sh](#id1d))
* [ppCmd](#id20) ([pp.sh](#id1d))
* [ppSimple](#id1f) ([pp.sh](#id1d))
* [quit](#id07) ([core.sh](#id04))
* [rotate](#id26) ([rotate.sh](#id25))
* [shell_escape](#id28) ([shesc.sh](#id27))
* [solv_ln](#id2a) ([solv_ln.sh](#id29))
* [urldecode](#id2d) ([urlencode.sh](#id2b))
* [urlencode](#id2c) ([urlencode.sh](#id2b))
* [warn](#id05) ([core.sh](#id04))

* * *

## <a name="id01"></a>ashlib.sh

This is a implicit module automatically invoked by:

   eval $(ashlib)

The `core` module is included automatically.



### <a name="id02"></a>find_in_path

Determines if the specified file is in the path variable

#### USAGE

  find_in_path needle haystack_variable

#### ARGS

* needle -- item to find in the path variable
* haystack_variable -- name of the variable contining path

#### RETURNS

0 if found, 1 if not found

#### OUTPUT

full path of found file



### <a name="id03"></a>include

Include an `ashlib` module.

#### USAGE

  include module [other modules ...]

#### ARGS

* module -- module to include

#### RETURNS

0 on success, otherwise the number of failed modules.



## <a name="id04"></a>core.sh

Some simple misc functions



### <a name="id06"></a>fatal

Fatal error

#### USAGE

   fatal message

#### DESC

Show the fatal error on stderr and terminates the script.



### <a name="id07"></a>quit

Exit with status

#### USAGE

   quit exit_code message

#### DESC

Show the fatal error on stderr and terminates the script with
exit_code.



### <a name="id05"></a>warn

  Show a warning on stderr

#### USAGE

  warn message



## <a name="id08"></a>fixattr.sh

### <a name="id09"></a>fixattr

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



## <a name="id0a"></a>fixfile.sh

### <a name="id0b"></a>fixfile

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
* file -- file to modify

#### DESC

Files are modified in-place only if the contents change.  This means
time stamps are kept accordingly.

<stdin> will be used as the contents of the new file unless --filter
is specified.  When in filter mode, the <stdin> is a shell script
that will be executed with <stdin> is the current contents of the
file and <stdout> as the new contents of the file.
Again, file is only written to if its conents change.



## <a name="id0c"></a>fixlnk.sh

### <a name="id0d"></a>fixlnk

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



## <a name="id0e"></a>kvped.sh

### <a name="id11"></a>_kvp_find_sect

### <a name="id12"></a>_kvp_in_sect

### <a name="id13"></a>_kvpadd

### <a name="id10"></a>_kvpappend

### <a name="id0f"></a>_kvpparsekvp

### <a name="id14"></a>kvped

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



## <a name="id15"></a>mkid.sh


Arbitrary id strings



### <a name="id16"></a>mkid

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



## <a name="id17"></a>mnt.sh

Determine if the given directory is a mount point

### USAGE

is_mounted directory

### ARGS

* directory -- directory mount point

### DESC

Determine if the given directory is a mount point



## <a name="id18"></a>network.sh

Network functions

Some utilities used to manage network and related tasks



### <a name="id19"></a>find_nic

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



## <a name="id1a"></a>on_exit.sh

Used to manage multiple exit handlers



### <a name="id1b"></a>exit_handler

Actual exit function

#### USAGE

  trap exit_handler EXIT

#### DESC

Actual function that gets hooked into the standard EXIT trap
and calls all the registered exit handlers.



### <a name="id1c"></a>on_exit

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



## <a name="id1d"></a>pp.sh

### <a name="id1e"></a>pp

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



### <a name="id20"></a>ppCmd

Command line `pp` driver

USAGE
	ppCmd [--output=output] -Iinclude-path -Dcmd file.m.ext ...
DESC
Implements a command line interface for the `pp` function

Input files of the form `file.m.ext` are then pre-processed and
the result is named `file.ext`.



### <a name="id1f"></a>ppSimple

Pre-processor
USAGE
	ppSimple < input > output
DESC
Read some textual data and output post-processed data.

Uses HERE_DOC syntax for the pre-processing language.
So for example, variables are expanded directly as `$varname`
whereas commands can be embedded as `$(command call)`.



## <a name="id21"></a>refs.sh

Symbolic/Reference functions

Let's you add a level of indirection to shell scripts



### <a name="id23"></a>assign

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



### <a name="id24"></a>get

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



### <a name="id22"></a>mksym

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



## <a name="id25"></a>rotate.sh

### <a name="id26"></a>rotate

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



## <a name="id27"></a>shesc.sh

Shell escape function.  Quotes strings so they can be safefly included
parsed by eval or in other scripts.



### <a name="id28"></a>shell_escape

  Escape string for shell parsing

#### USAGE

  shell_escape "string"

#### DESC

shell_escape will examine the passed string in the 
arguments and add any appropriate meta characters so that
it can be safely parsed by a UNIX shell.

It does so by enclosing the string with single quotes (if
it the string contains "unsafe" characters.).  If the string
only contains safe characters, nothing is actually done.



## <a name="id29"></a>solv_ln.sh

### <a name="id2a"></a>solv_ln

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



## <a name="id2b"></a>urlencode.sh

Functions for URL encoding/decoding



### <a name="id2d"></a>urldecode

Decodes URL encoded strings

#### USAGE

  urldecode text



### <a name="id2c"></a>urlencode

URL encodes to escape special characters

#### USAGE

  urlencode text



## <a name="id2e"></a>ver.sh

### <a name="id2f"></a>gitver

Determine the current version information from git

#### USAGE

    gitver _git-directory_

#### ARGS

* git-directory : Directory to the git repository

#### OUTPUT

version information




