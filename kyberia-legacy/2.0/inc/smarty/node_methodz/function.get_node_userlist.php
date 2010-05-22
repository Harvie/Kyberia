<?php

	function smarty_function_get_node_userlist($params,&$smarty) {

		global $db,$node;
		if (is_numeric($params['node_id'])) $node_id=$params['node_id'];
		else $node_id=$node['node_id'];

		$set=$db->query("select login,user_id from users where user_action_id='$node_id'");
		while ($set->next()) {
			$userlist[]=$set->getRecord();
		}

		$smarty->assign('userlist',$userlist);

	}
?>