<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

function configure_parent() {
	global $db,$error,$node;
	$user_id=$_SESSION['user_id'];

			if (empty($_POST['node_creator'])) {
				$owner_id=$node['node_creator'];
			}

			else {
				$node_creator=$_POST['node_creator'];
				$q="select user_id from users where login like '$node_creator'";
				$ownerset=$db->query($q);
				if (!$ownerset->getNumRows()) {
					$error="user $node_creator does not exist";
					return false;
				}
				else {
					$ownerset->next();
					$owner_id=$ownerset->getString('user_id');
				}
			}

			$node_vector=$_POST['node_vector'];
			$old_vector=$node['node_vector'];
			if (is_numeric($_POST['template_id'])) $template_id=$_POST['template_id'];
			$node_parent=$_POST['node_parent'];
			$node_created=$_POST['node_created'];
			$node_id=$node['node_id'];
	

			$permissions=permissions::checkPermissions($node_parent);
			if (!$permissions['w']) {
				$error="you don't have permissions for writing into $node_parent";
				return false;
			}

			if ($node_parent) {
//				$set=$db->query("select node_vector from nodes where node_id='$node_parent'");
//				$set->next();
//				$node_vector=$set->getString('node_vector');
				$parent_node=nodes::getNodeById($node_parent,$_SESSION['user_id']);
				$node_vector=$parent_node['node_vector'].";".$parent_node['node_id'];;
			}

			if ($node_vector!=$old_vector) {
				$q="update nodes set node_vector=replace(node_vector,'$old_vector','$node_vector') where node_vector like '%$old_vector;$node_id%'";
				$changed=$db->update($q);
				$q="update nodes set node_children_count=node_children_count+1 where node_id='$node_parent'";
				$db->update($q);
				$q="update nodes set node_children_count=node_children_count-1 where node_id='$old_parent'";
				$db->update($q);
				log::log('vector change',$changed,$old_vector,$node_vector);
			}
			return true;
?>