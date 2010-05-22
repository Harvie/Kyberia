<?php
function smarty_function_get_bookmark($brawco,&$smarty) {
	global $db;
	$q="select * from node_access left join nodes on node_access.node_id=nodes.node_id where user_id='".$_SESSION['user_id']."' and node_bookmark='yes' order by bookmark_category,node_name";
	$result=$db->query($q);
	while ($result->next()) {
		$record[]=$result->getRecord();
	}
	$smarty->assign('get_bookmark',$record);

}
?>
