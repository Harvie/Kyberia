<?php
function smarty_function_get_node_commanders($brawco,&$smarty) {
	global $db,$node;
	$node_id=$node['node_id'];
	$set=$db->query("select node_permission,users.login from node_access left join users on node_access.user_id=users.user_id where node_id='$node_id' and node_permission!='' order by node_permission");

	while ($set->next()) {
 		$commanders[$set->getString('node_permission')].=$set->getString('login').";";
	}

	$smarty->assign('masters',$commanders['master']);
	$smarty->assign('ops',$commanders['op']);
	$smarty->assign('access',$commanders['access']);
	$smarty->assign('bans',$commanders['ban']);
	$smarty->assign('silence',$commanders['silence']);
}

?>
