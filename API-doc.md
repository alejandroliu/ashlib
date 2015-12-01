# API docs

## Modules

* [ashlib.sh](#id01)
* [core.sh](#id04)
* [fixattr.sh](#id07)
* [fixfile.sh](#id09)
* [fixlnk.sh](#id0b)
* [kvped.sh](#id0d)
* [mkid.sh](#id10)
* [network.sh](#id12)
* [refs.sh](#id14)
* [rotate.sh](#id18)
* [solv_ln.sh](#id1a)
* [ver.sh](#id1c)

## Functions

* [assign](#id16) ([refs.sh](#id14))
* [fatal](#id06) ([core.sh](#id04))
* [find_in_path](#id02) ([ashlib.sh](#id01))
* [find_key](#id0e) ([kvped.sh](#id0d))
* [find_nic](#id13) ([network.sh](#id12))
* [fixattr](#id08) ([fixattr.sh](#id07))
* [fixfile](#id0a) ([fixfile.sh](#id09))
* [fixlnk](#id0c) ([fixlnk.sh](#id0b))
* [get](#id17) ([refs.sh](#id14))
* [gitver](#id1d) ([ver.sh](#id1c))
* [include](#id03) ([ashlib.sh](#id01))
* [kvped](#id0f) ([kvped.sh](#id0d))
* [mkid](#id11) ([mkid.sh](#id10))
* [mksym](#id15) ([refs.sh](#id14))
* [rotate](#id19) ([rotate.sh](#id18))
* [solv_ln](#id1b) ([solv_ln.sh](#id1a))
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



### <a name="id05"></a>warn

  Show a warning on stderr

#### USAGE

  warn message



## <a name="id07"></a>fixattr.sh

### <a name="id08"></a>fixattr

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



## <a name="id09"></a>fixfile.sh

### <a name="id0a"></a>fixfile

Function to modify files in-place.

#### USAGE

  fixfile [options] file

#### OPTIONS

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



## <a name="id0b"></a>fixlnk.sh

### <a name="id0c"></a>fixlnk

Function to update symlinks

#### USAGE

   fixlnk target lnk

#### ARGS

* target -- where the link should be pointing to
* lnk -- where the link is to be created

#### DESC

Note that this will first check if the symlink needs to be corrected.
Otherwise no action is taken.



## <a name="id0d"></a>kvped.sh

### <a name="id0e"></a>find_key

### <a name="id0f"></a>kvped

Found!



## <a name="id10"></a>mkid.sh


Arbitrary id strings



### <a name="id11"></a>mkid

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



## <a name="id12"></a>network.sh

Network functions

Some utilities used to manage network and related tasks



### <a name="id13"></a>find_nic

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



## <a name="id14"></a>refs.sh

Symbolic/Reference functions

Let's you add a level of indirection to shell scripts



### <a name="id16"></a>assign

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



### <a name="id17"></a>get

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



### <a name="id15"></a>mksym

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



## <a name="id18"></a>rotate.sh

### <a name="id19"></a>rotate

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



## <a name="id1a"></a>solv_ln.sh

### <a name="id1b"></a>solv_ln

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



## <a name="id1c"></a>ver.sh

### <a name="id1d"></a>gitver

Determine the current version information

#### USAGE

    gitver _git-directory_

#### ARGS

* git-directory : Directory to the git repository

#### OUTPUT

version information




