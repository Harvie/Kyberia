<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	
	function oplist() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
		$ops=explode(";",$_POST['oplist']);

		$db->query("update node_access set node_permission='' where node_id=$node_id and node_permission='op'");
		foreach ($ops as $op) {
			$set=$db->query("select user_id from users where login='$op'");
			$set->next();
			if ($set->getString('user_id')) {
				$q="update node_access set node_permission='op' where node_id=$node_id and user_id='".$set->getString('user_id')."'";
				$changed=$db->update($q);
				if (!$changed) {
					$q="insert into node_access set node_permission='op',node_id=$node_id,user_id=".$set->getString('user_id');
					echo $q;
					$db->query($q);
				}
				log::log('add op',$node_id,'ok',$op);
			}
			else { $error .= "$op does not exist..."; }
		}
	}
?>