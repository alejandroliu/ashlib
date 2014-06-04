# API docs

## Modules

* [ashlib.sh](#id01)
* [core.sh](#id04)
* [fixattr.sh](#id07)
* [fixfile.sh](#id09)
* [fixlnk.sh](#id0b)
* [refs.sh](#id0d)
* [solv_ln.sh](#id11)
* [ver.sh](#id13)

## Functions

* [assign](#id0f) ([refs.sh](#id0d))
* [fatal](#id06) ([core.sh](#id04))
* [find_in_path](#id02) ([ashlib.sh](#id01))
* [fixattr](#id08) ([fixattr.sh](#id07))
* [fixfile](#id0a) ([fixfile.sh](#id09))
* [fixlnk](#id0c) ([fixlnk.sh](#id0b))
* [get](#id10) ([refs.sh](#id0d))
* [gitver](#id14) ([ver.sh](#id13))
* [include](#id03) ([ashlib.sh](#id01))
* [mksym](#id0e) ([refs.sh](#id0d))
* [solv_ln](#id12) ([solv_ln.sh](#id11))
* [warn](#id05) ([core.sh](#id04))

* * *

## <a name="id01"></a>ashlib.sh

This is a implicit module automatically invoked by:

   eval $(ashlib)

The `core` module is included automatically.



### <a name="id01"></a>find_in_path

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



### <a name="id01"></a>include

Include an `ashlib` module.

#### USAGE

  include module [other modules ...]

#### ARGS

* module -- module to include

#### RETURNS

0 on success, otherwise the number of failed modules.



## <a name="id04"></a>core.sh

Some simple misc functions



### <a name="id04"></a>fatal

Fatal error

#### USAGE

   fatal message

#### DESC

Show the fatal error on stderr and terminates the script.



### <a name="id04"></a>warn

  Show a warning on stderr

#### USAGE

  warn message



## <a name="id07"></a>fixattr.sh

### <a name="id07"></a>fixattr

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

### <a name="id09"></a>fixfile

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

### <a name="id0b"></a>fixlnk

## <a name="id0d"></a>refs.sh

### <a name="id0d"></a>assign

### <a name="id0d"></a>get

### <a name="id0d"></a>mksym

## <a name="id11"></a>solv_ln.sh

### <a name="id11"></a>solv_ln

## <a name="id13"></a>ver.sh

### <a name="id13"></a>gitver


