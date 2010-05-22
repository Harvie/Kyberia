<?php

	function smarty_function_get_children_by_type($params,&$smarty) {

		if ($params['orderby']=='desc') $orderby="desc";

		$type=$params['type'];
		if ($params['listing_amount']=='all') $listing_amount='23232323232323323';
		else $listing_amount=$params['listing_amount'];

		if (empty($params['offset'])) $offset=0;
		else $offset=$params['offset'];

		global $db,$node;
		if (!$params['parent_id']) {
			$parent_id=$node['node_id'];
		}
		else $parent_id=$params['parent_id'];

		$node_type=$node['node_type'];
		$user_id=$_SESSION['user_id'];

		$q="select users.*,nodes.*,node_content.* from nodes  left join 
node_content on (node_content.node_id=nodes.node_id) left  
join users on users.user_id=nodes.node_creator where node_parent='$parent_id'  
and template_id='$type' order by node_created $orderby LIMIT $offset,$listing_amount";
		
		$set=$db->query($q);
		while ($set->next()) $pole[]=$set->getRecord();
		$smarty->assign('get_children_by_type',$pole);
	}
?>