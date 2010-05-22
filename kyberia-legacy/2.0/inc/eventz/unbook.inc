<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	function unbook() {

		global $db,$error,$node;
		$q="update neurons set link='soft' where synapse_creator='".$_SESSION['user_id']."' and peripheral='".$node['node_id']."' and link='bookmark'";
		$result=$db->update($q);
		
		$q="update node_access set last_visit='',node_bookmark='no' where user_id='".$_SESSION['user_id']."' and node_id='".$node['node_id']."'";
		$result=$db->query($q);
		if ($result) {
			log::log('unbook','ok');
			return true;
		}
		else {
			log::log('unbook','failed');
			$error='unbook failed';
			return false;
		}
	}
?>