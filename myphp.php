<?php
/**
 * myphp extensions
 *
 * This file implements some common php extensions that are handy to have
 * around.
 */


/** 
 * Carriage return constant
 */
define('CR',"\r");
/**
 * New line constant
 */
define('NL',"\n");
/**
 * MSDOS style file endign (CR+NL)
 */
define('CRLF',"\r\n");
/**
 * Horizontal Tab
 */
define('TAB',"\t");
/**
 * Single quote
 */
define('QUOTE',"'");

if (php_sapi_name() == 'cli') {
  /**
   * If true, we are running from commandline interface
   */
    define('CLI', true);
} else {
  /**
   * @ignore
   */
    define('CLI', false);
}

/**
 * Determine if $vec array is a vector
 *
 * @param array $vec    array to test
 * @return bool         true if it is a vector, false otherwise
 */
function is_vector(&$vec) {
  $lst = array_keys($vec);
  $cnt = count($lst);
  for ($i = 0; $i < $cnt ; $i++) {
    if ($i !== $lst[$i]) { return false; }
  }
  return true;
}

/**
 * Parse a string to detect boolean value
 *
 * @param mixed $value	value to test
 * @return bool		return boolean value
 */
function get_bool($value) {
  if ($value) {
    if (in_array(strtolower($value),array('false','','0','no','off'))) {
      return false;
    }
    return true;
  }
  return false;
}

