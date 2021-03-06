<?php

	function smarty_function_get_nodes_by_type($params,&$smarty) {
		global $node;
		$type=$params['type'];
		if ($params['listing_amount']=='all') $listing_amount='2323232323232323';
		else $listing_amount=$params['listing_amount'];
		if (empty($params['offset'])) $offset=0;
		else $offset=$params['offset'];
		if ($params['vector']) {
 			$vector=addslashes($params['vector']);
		}
		if ($params['orderby']) {
 			$orderby=addslashes($params['orderby']);
		}

		global $db,$node;
		$node_id=$node['node_id'];
		$user_id=$_SESSION['user_id'];
		$q="select node_content.*,parent.node_name as parent_name,users.*,nodes.*,node_access.node_user_subchild_count from nodes left join nodes as parent on parent.node_id=nodes.node_parent left join node_access on node_access.node_id=nodes.node_id and node_access.user_id='$user_id' left join node_content on (node_content.node_id=nodes.node_id) left  join users on users.user_id=nodes.node_creator where ";
		if ($vector) $q.="nodes.node_vector like '$vector%' and";
		$q.=" nodes.template_id='$type' and nodes.node_system_access!='private'"; 
		if ($orderby) $q.=" order by $orderby ";
		else $q.=" order by nodes.node_id desc ";
		$q.= " LIMIT $offset,$listing_amount ";
		$set=$db->query($q);

		while ($set->next()) $pole[]=$set->getRecord();
		$smarty->assign('get_nodes_by_type',$pole);

	}
?>