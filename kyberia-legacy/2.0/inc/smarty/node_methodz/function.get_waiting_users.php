<?php

	function smarty_function_get_waiting_users($params,&$smarty) {
		global $db, $error, $node;
		$node_id=$node['node_id'];
		$q="select node_content,users.* from users left join node_content on node_content.node_id=users.user_id where user_status='waiting'";
		if ($_SESSION['cube_vector']) $q.=" and cube_vector='".$_SESSION['cube_vector']."'";
		else $q.=" and cube_vector IS NULL";
		$result=$db->query($q);
		while ($result->next()) {
			$get_waiting_users[]=$result->getRecord();
		}		
		$smarty->assign('get_waiting_users',$get_waiting_users);

	}
?>