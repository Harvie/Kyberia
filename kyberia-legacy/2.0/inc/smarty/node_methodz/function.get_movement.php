<?php
function smarty_function_get_movement($params,&$smarty) {
	global $db;

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
		$q="select * from node_access left join nodes on node_access.node_id=nodes.node_id where user_id='$user_id' and nodes.node_system_access='public' order by last_visit desc limit $offset,$listing_amount"; 		
		$set=$db->query($q);
		while ($set->next()) {
			$array[]=$set->getRecord();
		}
		$smarty->assign('get_movement',$array);
		return false;
	}

}
?>
