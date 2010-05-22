<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */



function set_parent() {

	global $node,$db,$error;
	$new_parent_id=$_POST['new_parent'];
	$nodes=$_POST['node_chosen'];
	$hierarch_id=$node['node_id'];

	$new_parent=nodes::getNodeById($new_parent_id,$_SESSION['user_id']);
	$new_parent_permissions=permissions::checkPermissions($new_parent);
	
	if (!$new_parent_permissions['w'] and !isHierarch($new_parent)) {
		global $error_messages;
		$error=$error_messages['WRITE_PERMISSION_ERROR'];
		return false;
	}

	$parent_vector=$new_parent['node_vector'];

	if (!is_array($nodes)) {
		$nodes[]=$node['node_id'];
	}
	
	if (($node['node_creator']!=$_SESSION['user_id']) and ($node['node_permission']!='master') and !permissions::isHierarch($node)) {
		global $error_messages;
		$error=$error_messages['EVENT_PERMISSION_ERROR'];
		return false;
	}

	foreach ($nodes as $chosen_id) {
		unset($chosen);

		$new_vector=$parent_vector.str_pad($chosen_id,VECTOR_CHARS,"0",STR_PAD_LEFT);;

		$chosen=nodes::getNodeById($chosen_id,$_SESSION['user_id']);

		if (($chosen['node_creator']!=$_SESSION['user_id']) and ($chosen['node_permission']!='master') and !permissions::isHierarch($chosen)) {
			global $error_messages;
			$error=$error_messages['EVENT_PERMISSION_ERROR'];
			return false;
		}


                $db->query("start transaction");
		$q="update nodes set node_parent='$new_parent_id',node_vector='".$new_vector."' where node_id='$chosen_id'";
		$db->query($q);
		$q="update nodes set node_vector=replace(node_vector,'".$chosen['node_vector']."','$new_vector') where node_vector like '".$chosen['node_vector']."%'";
		$changed=$db->update($q);
		$q="update nodes set node_children_count=node_children_count+1 where node_id='$new_parent_id'";
		$db->update($q);
		$db->query("commit");
		
	}
	return true;
}
?>