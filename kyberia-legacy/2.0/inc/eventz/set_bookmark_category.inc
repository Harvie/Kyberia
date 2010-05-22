<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */



function set_bookmark_category() {
	echo "hello world";
	global $node,$db,$error;
	$bookmarks=$_POST['bookmarks_chosen'];
	$category_id=$_POST['bookmark_category_id'];
	$new_parent=nodes::getNodeById($category_id,$_SESSION['user_id']);
	$new_parent_permissions=permissions::checkPermissions($new_parent);

	
	if (!$new_parent_permissions['w']) {
		global $error_messages;
		$error=$error_messages['WRITE_PERMISSION_ERROR'];
		return false;
	}



	foreach ($bookmarks as $chosen_id) {
		
		unset($chosen);

                $db->query("start transaction");
		$set=$db->query("select bookmark_category from node_access where node_id='$chosen_id' and user_id='".$_SESSION['user_id']."'");
		$set->next();
		$old_category=$set->getString('old_category');

		$q="update node_access set bookmark_category='$category_id' where node_id='$chosen_id' and user_id='".$_SESSION['user_id']."'";
		$db->query($q);

		$q="update neurons set central='$category_id' where peripheral='$chosen_id' and central='$old_category'";
		$db->update($q);
		$db->query("commit");
	}

	return true;	
}
?>