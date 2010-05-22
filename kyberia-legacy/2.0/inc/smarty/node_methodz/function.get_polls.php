<?php

	function smarty_function_get_poll($params,&$smarty) {
		global $db,$node;
		if (!is_numeric($params['poll_id'])) $poll_id=$node['node_id'];
		else $poll_id=$params['poll_id'];
		$user_id=$_SESSION['user_id'];
		$set=$db->query("select nodes.*,node_content.node_content,node_access.node_permission from nodes left join node_content on node_content.node_id=nodes.node_id left join node_access on (nodes.node_id=node_access.node_id and node_access.user_id='$user_id') where node_parent='$poll_id' and node_type='11' order by node_id desc limit 1");
		$set->next();
		$option_array=unserialize($set->getString('node_content'));
		$permission=$set->getString('node_permission');
		
		if ($permission=='ban') $voted='yes';
		else $voted='no';
	
 		$poll=Array("voted"=>$voted,"node_id"=>$set->getString('node_id'),"question"=>$set->getString('node_name'),"total"=>$set->getString('node_views'),"options"=>$option_array);		
		$smarty->assign('get_poll',$poll);
		print_r($poll);
}
?>