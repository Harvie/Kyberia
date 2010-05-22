<?php

	function smarty_function_get_atom($params,&$smarty) {

		global $db,$node;
		$node_id=$node['node_id'];
		if ( preg_match("/(\d+)-(.+)/",$_GET['magic_word'],$mu)) {
	                  $magic_uid=$mu['1'];
	                  $magic_word=addslashes($mu['2']);
			 $q1="select last_visit from node_access where user_id='$magic_uid' and node_id='$node_id'";
			 $set=$db->query($q1);
			 $set->next();
			 $lv=$set->getString('last_visit');
			 		                                                  
		$q="select nodes.node_id,node_name,node_content from nodes left join node_content on nodes.node_id=node_content.node_id  where nodes.node_parent='$node_id' and node_created>'$lv' order by node_id desc";
		$set=$db->query($q);
}	
		while ($set->next()) {
			$get_atom[]=$set->getRecord();
		}

		$smarty->assign('get_atom',$get_atom);
	}
?>
