<?php

	function smarty_function_get_linked_nodes($params,&$smarty) {
		global $db, $error, $node, $time_1, $time_2;
		$time_1=$time_1;
		$time_2=$time_2;
                $orderby=$params['orderby'];
		if ($orderby!='desc' && $orderby!='asc') $orderby='desc';
	
		if (!empty($time_1) || !empty($time_2)) {
			if ($orderby=='desc') {
				$from=$time_2;
				$to=$time_1;
			}
			else {
				$from=$time_1;
				$to=$time_2;
			}
			$time=" and synapse_created>'$from' and synapse_created<='$to'";
		}
		else {
			$time="";
		}

		$node_id=$node['node_id'];
		$q="select neurons.synapse_created,node_content,author.login,linker.login as linker,nodes.* from neurons left join nodes on neurons.src=nodes.node_id left join users as linker on neurons.synapse_creator=linker.user_id left join users as author on nodes.node_creator=author.user_id left join node_content on node_content.node_id=nodes.node_id where dst='$node_id' and link='hard' $time order by synapse_created $orderby";
		$result=$db->query($q);
		while ($result->next()) {
			$array=$result->getRecord();
			$array['node_status']="linked";
			$array['node_vector']=$node['node_vector'].";".$node['node_id'];
			$array['node_created']=$array['synapse_created'];
			$get_linked_nodes[]=$array;
		}		
		$smarty->assign('get_linked_nodes',$get_linked_nodes);
		
		$q="select neurons.synapse_created,node_content,users.login,nodes.* from neurons left join nodes on neurons.src=nodes.node_id left join users on nodes.node_creator=users.user_id left join node_content on node_content.node_id=nodes.node_id where dst='$node_id' and link='bookmark' $time order by synapse_created $orderby";
		$result=$db->query($q);
		while ($result->next()) {
			$array=$result->getRecord();
			$array['node_status']="linked";
			$array['node_vector']=$node['node_vector'].";".$node['node_id'];
			$array['node_created']=$array['synapse_created'];
			$get_linked_bookmarks[]=$array;
		}		
		$smarty->assign('get_linked_bookmarks',$get_linked_bookmarks);
		}
?>