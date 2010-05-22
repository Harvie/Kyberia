<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	function book() {
		global $db,$error,$node;
		$q="update neurons set link='bookmark',synapse_creator='".$_SESSION['user_id']."',synapse=synapse+1 where dst='".$_SESSION['user_id']."' and src='".$node['node_id']."'";
		$result=$db->update($q);
		if (!$result) {
			$q="insert into neurons set synapse_created=NOW(),dst='".$_SESSION['user_id']."',src='".$node['node_id']."',synapse_creator='".$_SESSION['user_id']."',link='bookmark'";
			$db->query($q);
		}
		$q="update node_access set last_visit='',node_bookmark='yes' where user_id='".$_SESSION['user_id']."' and node_id='".$node['node_id']."'";
		$result=$db->query($q);
		if ($result) {
			log::log('book','ok');
			return true;
		}
		else {
			log::log('book','failed');
			$error='book failed';
			return false;
		}
	}
?>