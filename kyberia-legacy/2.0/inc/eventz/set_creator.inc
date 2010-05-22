<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


function set_creator() {
	global $node,$db;
	$owner=$_POST['owner'];
	$userset=$db->query("select user_id from users where login='$owner'");
	$userset->next();
	$user_id=$userset->getString('user_id');
	if (!is_numeric($user_id)) {
		$error="user $owner does not exist";
		return false;
	}

	if ($node['node_creator']!=$_SESSION['user_id']) {
		$error="you are not owner of da node";
		return false;
	}
	
	$node_id=$node['node_id'];	
	if (is_numeric($node_id)) {	
		$q="update nodes set node_creator='$user_id' where node_id='$node_id'";
		$db->query($q);
		$ubik['mail_to']=$user_id;
		$ubik['mail_text']="user ".$_SESSION['user_name']." have given you node <a href='/id/$node_id'>".$node['node_name']."</a>";
		ubik::ubikMail($ubik);
		return false;
	}

}

?>