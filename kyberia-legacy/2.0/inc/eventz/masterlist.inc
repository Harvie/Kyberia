<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	
	function masterlist() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
		if ($node['node_permission']!='owner') {
			$error=$error_messages['EVENT_PERMISSION_ERROR'];
			return false;
		}

		$masters=explode(";",$_POST['masterlist']);
		$db->query("update node_access set node_permission='' where node_id=$node_id and node_permission='master'");
		foreach ($masters as $master) {
			$set=$db->query("select user_id from users where login='$master'");
			$set->next();
			if ($set->getString('user_id')) {
				$q="update node_access set node_permission='master' where node_id=$node_id and user_id='".$set->getString('user_id')."'";
				$changed=$db->update($q);
				if (!$changed) {
					$q="insert into node_access set node_permission='master',node_id=$node_id,user_id=".$set->getString('user_id');
					$db->query($q);
					log::log('add master',$node_id,'ok',$master);

				}
			}
			else { $error .= "$master does not exist..."; }
		}
	}
?>