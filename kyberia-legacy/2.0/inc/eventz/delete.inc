<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

function delete() {
//	die();

/* najprv insertne do tiamat vsetky data nody tykajuce sa dotycnej nody
potom ju zmaze
potom urobi to iste s descendantami
what about node_access and neurons ?
*/
	error_reporting(E_ALL);
	global $node,$db,$error;
	$nodes=$_POST['node_chosen'];
	$user_id=$_SESSION['user_id'];

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
		$node_parent=$delete_node['node_parent'];
		$created=$delete_node['node_created'];

		if ($delete_node['node_creator']==$_SESSION['user_id'] || permissions::isHierarch($delete_node)) {
			$q="insert into tiamat (node_id,node_name,node_parent,node_vector,
node_external_access,node_system_access,node_children_count,node_creator,node_created,lastchild_created,k,
node_views,node_destructor,node_content,node_descendant_count,lastdescendant_created,template_id,external_link) 
select nodes.node_id,node_name,node_parent,node_vector,node_external_access,node_system_access,
node_children_count,node_creator,node_created,lastchild_created,k,node_views,'$user_id',node_content,
node_descendant_count,lastdescendant_created,template_id,external_link from nodes left join node_content on nodes.node_id=node_content.node_id where nodes.node_id='$chosen'";

			$q="delete from nodes where node_id='$chosen'";
			$db->query($q);
			echo $q;
			if (!empty($vector)) {
				$q="select node_id from nodes where node_vector like '$vector%'";
				echo $q;
				$cset=$db->query($q);
				while ($cset->next()) {
					$chosen_child=$cset->getString('node_id');
				$q="insert into tiamat (node_id,node_name,node_parent,node_vector,
node_external_access,node_system_access,node_children_count,node_creator,node_created,lastchild_created,k,
node_views,node_destructor,node_content,node_descendant_count,lastdescendant_created,template_id,external_link) 
select nodes.node_id,node_name,node_parent,node_vector,node_external_access,node_system_access,
node_children_count,node_creator,node_created,lastchild_created,k,node_views,'$user_id',node_content,
node_descendant_count,lastdescendant_created,template_id,external_link from nodes left join node_content on nodes.node_id=node_content.node_id where nodes.node_id='$chosen_child'";
					echo $q;
					$db->query($q);

				}
			}
			log::log('delete',$chosen,'ok',$_SESSION['user_id']);
		}
		else {
			global $error_messages;
			$error=$error_messages['EVENT_PERMISSION_ERROR'];
			log::log('delete',$chosen,'EVENT_PERMISSION_ERROR',$_SESSION['user_id']);
			return false;
		}

		

	}

}
?>