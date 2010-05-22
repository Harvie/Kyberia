<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


	function logout() {
		global $db;
		$q="update users set user_action_id=null where user_id='".$_SESSION['user_id']."'";
		$db->query($q);
 		log::log('logout',$node['node_id'],'ok',$_SESSION['user_name']);
		session_unset();
		Header("Location: /main");
	}

?>