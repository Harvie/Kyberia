<?php
function smarty_function_get_stats($params,&$smarty) {
	global $db,$node;
	$node_id=$node['node_id'];

	if (is_numeric($params['user_id'])) {
		$user_id=$params['user_id'];
	}
	if (is_numeric($params['listing_amount'])) {
		$listing_amount=$params['listing_amount'];
	}
	else $listing_amount=DEFAULT_LISTING_AMOUNT;
	if (is_numeric($params['offset'])) {
		$offset=$params['offset'];
	}
	else $offset=0;

	if ($user_id) {
		$q="select * from node_access left join users on node_access.user_id=users.user_id where node_access.node_id='$node_id' order by last_visit desc limit 232323232323"; 		
		$set=$db->query($q);
		while ($set->next()) {
			$array[]=$set->getRecord();
		}
		$smarty->assign('get_stats',$array);
		return false;
	}

}
?>
