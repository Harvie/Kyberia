<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	
	function silencelist() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
		$silence=explode(";",$_POST['silence']);

                if ($node['node_permission']!=('owner' OR 'master' OR 'op')) {
                        $error=$error_messages['EVENT_PERMISSION_ERROR'];
                        return false;
                }

		$db->query("update node_access set node_permission='' where node_id=$node_id and node_permission='silence'");
		foreach ($silence as $sil) {
			$set=$db->query("select user_id from users where login='$sil'");
			$set->next();
			if ($set->getString('user_id')) {
				$q="update node_access set node_permission='silence' where node_id=$node_id and user_id='".$set->getString('user_id')."'";
				$changed=$db->update($q);
				if (!$changed) {
					$q="insert into node_access set node_permission='silence',node_id=$node_id,user_id=".$set->getString('user_id');
					$db->query($q);
				}
				log::log('add silence',$node_id,'ok',$sil);
			}
			else { $error .= "$sil does not exist..."; }
		}
	}
?>