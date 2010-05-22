<?php

	function smarty_function_get_poll($params,&$smarty) {
		global $db,$node;
		$user_id=$_SESSION['user_id'];
		if (!is_numeric($params['poll_id'])) $poll_id=$node['node_id'];
		else $poll_id=$params['poll_id'];

		if (is_array($params['poll'])) {
			$array=$params['poll'];
			$voted='yes';
		}

		else {
			$set=$db->query("select nodes.*,node_content.node_content,node_access.node_permission from nodes left join node_content on node_content.node_id=nodes.node_id left join node_access on (nodes.node_id=node_access.node_id and node_access.user_id='$user_id') where node_parent='$poll_id' and node_type='11' order by node_id desc limit 1");
//			echo "select nodes.*,node_content.node_content,node_access.node_permission from nodes left join node_content on node_content.node_id=nodes.node_id left join node_access on (nodes.node_id=node_access.node_id and node_access.user_id='$user_id') where node_parent='$poll_id' and node_type='11' order by node_id desc limit 1";
			$set->next();
			$array=$set->getRecord();
			if ($array['node_permission']=='ban') $voted='yes';
			else $voted='no';
		}

		$option_array=unserialize($array['node_content']);		
		$permission=$array['node_permission'];		

		$poll=Array("voted"=>$voted,"node_id"=>$array['node_id'],"question"=>$array['node_name'],"total"=>$array['node_views'],"options"=>$option_array);		
		$smarty->assign('get_poll',$poll);

}
?>