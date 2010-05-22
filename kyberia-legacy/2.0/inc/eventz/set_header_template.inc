<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


function set_header_template() {
	global $db,$error;
	$header_id=$_POST['header_id'];
	$user_id=$_SESSION['user_id'];
	if (!$user_id) {
		return false;
	}
	
	$db->query("update users set header_id='$header_id' where user_id='$user_id'");
	$_SESSION['header_id']=$header_id;
}

?>
