<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

function delete() {
	global $node,$db,$error;
	$nodes=$_POST['node_chosen'];

	if (empty($nodes)) {
		$nodes[]=$node['node_id'];
	}

	foreach ($nodes as $chosen) {
		if (empty($chosen)) {
			$error="just a little bug";
			return false;
		}

		$delete_node=nodes::getNodeById($chosen);
		$vector=$delete_node['node_vector'];


		if ($delete_node['node_creator']==$_SESSION['user_id'] || isHierarch($delete_node)) {
			$q="insert into tiamat (node_id,node_name,node_parent,node_thread_vector,node_type,node_external_access,node_system_access,node_children_count,node_creator,node_created,lastchild_created,k,node_views,node_destructor,node_content,node_descendant_count,lastdescendant_created,template_id) select nodes.node_id,node_name,node_parent,node_vector,node_type,node_external_access,node_system_access,node_children_count,node_creator,node_created,lastchild_created,k,node_views,'$user_id',node_content,node_descendant_count,lastdescendant_created,template_id from nodes left join node_content on nodes.node_id=node_content.node_id where nodes.node_id='$chosen'";
			echo $q;
//			$db->query($q);
			$q="delete from nodes where node_id='$chosen'";
			echo $q;
//			$db->query($q);
			$q="delete from node_access where node_id='$chosen'";
			echo $q;
//			$db->query($q);
			echo $q;
			$q="update node_access set node_user_subchild_count=node_user_subchild_count-1 where node_id='$node_parent' and last_visit<'$created'";
//			$db->query($q);
			echo $q;
			if (!empty($vector)) {
				$q="update nodes set node_vector=replace(node_vector,'$vector','') where node_vector like '$vector%'";
				echo $q;
//				$db->query($q);
			}

		}

	}

}
?>