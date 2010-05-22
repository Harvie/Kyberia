<?php

	function smarty_function_get_neurons($params,&$smarty) {
		global $db, $error, $node, $time_1, $time_2;
		$node_id=$node['node_id'];
		$q="select neurons.*,node_content,users.login,nodes.* from neurons left join nodes on neurons.peripheral=nodes.node_id left join users on nodes.node_creator=users.user_id left join node_content on node_content.node_id=nodes.node_id where central='$node_id' order by synapse desc";
		$result=$db->query($q);
		while ($result->next()) {
			$get_dendrites[]=$result->getRecord();
		}		
		$smarty->assign('get_dendrites',$get_dendrites);

		$q="select neurons.*,node_content,users.login,nodes.* from neurons left join nodes on neurons.central=nodes.node_id left join users on nodes.node_creator=users.user_id left join node_content on node_content.node_id=nodes.node_id where peripheral='$node_id'  order by synapse desc";
		$result=$db->query($q);
		while ($result->next()) {
			$get_axons[]=$result->getRecord();
		}		
		$smarty->assign('get_axons',$get_axons);

	}
?>