<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	function configure_bookmarks() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
		$db->query("update node_access set bookmark_category=0 where user_id='".$_SESSION['user_id']."' and bookmark_category='$node_id'");
		foreach($_POST['bookmark'] as $key =>$value) {
			$db->query("update node_access set bookmark_category='$node_id' where user_id='".$_SESSION['user_id']."' and node_id='$key'");
		}
	
	}
?>
