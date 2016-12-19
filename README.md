ashlib
======

Ashlib is a library that implements useful functions for either bash or sh.

## Copyright

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Synopsis

Include in your script:

    eval $(ashlib)

After that you can:

    include _module_

## Available modules

* ashlib.sh  
  Automatically included by `ashlib`.  Defines the `include` function.
* core.sh  
  Basic definitions.
* fixattr.sh  
  Fix file attributes (ownership and permissions)
* fixfile.sh  
  Update the contents of a file.
* fixlnk.sh  
  Update symbolic links.
* network.sh  
  Network related function
* refs.sh  
  A reference library
* rotate.sh  
  File rotation script
* solv_ln.sh  
  Resolve symbolic links
* ver.sh  
  Determine git version information.

## Utility commands

* ashlib  
  Set-up ashlib
* shlog  
  Run a shell while loging stdin.
* shdoc  
  Simple perl (?!?) script to create reference documentation.
* ashcc, ashrun & myphp  
  A preprocessor that makes use of `php` (through `myphp`) to generate
  single file shell scripts.

## Installation

A `makefile` is provide.  Installation can be done with:

    make install DESTDIR=/opt

## API

See [API](API-doc.md).
