<?php
/**
 * shell script compiler
 *
 *    Copyright (C) 2014 A Liu Ly
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *++
 * = ASHCC(1)
 * :Revision: 1.0
 *
 * == NAME
 *
 * ashcc - Shell Script Compiler
 *
 * == SYNOPSIS
 *
 * *ashcc* _[-Iinc-dir] [-oOutputFile] [-ephp_code] [-Dconst=value]_ file ...
 *
 * == DESCRIPTION
 *
 * This file implements *ashcc*.  Is essentially a text file/macro
 * compiler, which uses php as its macro language.  Its main use is
 * to create configuration files based on templates, and to create
 * standalone shell scripts made of multiple modules.
 *
 * == OPTIONS
 *
 * *-I* include-dir::
 *    Adds the directory to the include directory search path.
 * *-o* OutputFile::
 *	Will save output to the specified file.  If not specified
 *	output is to stdout.
 * *-e* php_code::
 *	Evaluates the given PHP code.
 * *-D* const=value::
 *	Defines the constant named const to value.  Note that this
 *	is evaluted by PHP so if you need to define a string, you
 *	need to provide the quotes.
 *
 * == SEE ALSO
 *
 * php(1)
 *--
 */
array_shift($argv);
if (!isset($argv[0])) fwrite(STDERR,"No arguments given\n");

$ASHCC_OutPutFile = '';
$ASHCC_abort = false;

/**
 * Handle error messages.
 *
 * This is used to detect error condition so we do not create
 * invalid/incomplete files and exit on error condition so
 * `make` can clean-up.
 *
 * @internal
 */
function ASHCC_error_trap($errno,$errstr,$errfile,$errline) {
  switch ($errno) {
  case E_ERROR:
  case E_CORE_ERROR:
  case E_COMPILE_ERROR:
  case E_USER_ERROR:
    global $ASHCC_abort;
    $ASHCC_abort = true;
    fwrite(STDERR,"$errfile,$errline: FATAL ERROR ($errno) $errstr\n");
    break;
  case E_USER_WARNING:
    fwrite(STDERR,"$errfile,$errline: WARNING ($errno) $errstr\n");
    break;
  case E_USER_NOTICE:
    fwrite(STDERR,"$errfile,$errline: NOTICE ($errno) $errstr\n");
    break;
  default:
    fwrite(STDERR,"$errfile,$errline: [] ($errno) $errstr\n");
    break;
  }
  /* Don't execute PHP internal error handler */
  return true;
}

/**
 * Handle exit conditions
 *
 * Cleans-up stuff
 * @internal
 */
function ASHCC_shutdown(){
  if ($error = error_get_last()){
    switch($error['type']){
    case E_ERROR:
    case E_CORE_ERROR:
    case E_COMPILE_ERROR:
    case E_USER_ERROR:
      ASHCC_error_trap($error['type'],$error['message'],
		 $error['file'],$error['line']);
      ob_end_clean();
      break;
    }
  }
}

if (function_exists('error_get_last')) {
  register_shutdown_function('ASHCC_shutdown');
}
set_error_handler('ASHCC_error_trap');

ob_start();
while (count($argv)) {
  $f = array_shift($argv);
  if (substr($f,0,2) == '-I') {
    set_include_path(get_include_path() . PATH_SEPARATOR . substr($f,2));
  }  else if (substr($f,0,2) == '-o') {
    $ASHCC_OutPutFile = substr($f,2);
  } else if (substr($f,0,2) == '-e') {
    eval(substr($f,2).';');
  } else if (substr($f,0,2) == '-D') {
    list($l,$r) = explode('=',substr($f,2),2);
    $l = trim($l);
    eval('define($l,'.$r.');');
    unset($l,$r);
  } else {
    $script = $f;
    require($f);
    break;
  }
}

$s = ob_get_contents();
ob_end_clean();

if ($ASHCC_abort) {
  exit(1);
}

if ($ASHCC_OutPutFile == '') {
  echo $s;
} else {
  file_put_contents($ASHCC_OutPutFile,$s,LOCK_EX);
  chmod($ASHCC_OutPutFile,0777 & ~umask());
}
