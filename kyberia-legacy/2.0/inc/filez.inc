<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

class filez {

function filez($id) {
	global $db,$error;
	if (!is_dir(FILE_DIR.$_SESSION['user_id'])) {
		mkdir(FILE_DIR.$_SESSION['user_id']);
	}
	copy($_FILES['data_file']['tmp_name'],FILE_DIR.$_SESSION['user_id'].'/'.$_FILES['data_file']['name']);
	return $_SESSION['user_id'].'/'.$_FILES['data_file']['name'];
}

}

/* 
*  Returns disk usage in bytes of directory $d. Limit depth level with $depth. 
*  Updates, documentation and examples: http://daniel.lorch.cc/projects/disk_usage/ 
* 
*  Revision: 1.00 
*/ 

function disk_usage($d, $depth = NULL) { 
  if(is_file($d)) 
    return filesize($d); 

  if(isset($depth) && $depth < 0) 
    return 0; 
     
  if($d[strlen($d)-1] != '\\' || $d[strlen($d)-1] != '/') 
    $d .= '/'; 
     
  $dh=@opendir($d); 
  if(!$dh) 
    return 0; 

  while($e = readdir($dh)) 
    if($e != '.' && $e != '..') 
      $usage += disk_usage($d.$e, isset($depth) ? $depth - 1 : NULL); 

  closedir($dh); 

  return $usage; 
}


?>