<?php

	function smarty_function_get_children($params,&$smarty) {

		global $db,$node;

		$node_id=$node['node_id'];

		$listing_amount=$params['listing_amount'];
		if (!is_numeric($listing_amount)) {
			$listing_amount=23;
		}
		$offset=$params['offset'];
		if (!is_numeric($offset)) {
			$offfset=0;
		}

		if ($_POST['get_children_orderby']=="asc") $orderby='asc';
		else $orderby='desc';

		$q="select node_access.last_visit,creator.node_name as creator,users.*,nodes.*,
node_content.*,nodes.node_id as node_id from nodes 
left join node_access on (nodes.node_id=node_access.node_id 
and node_access.user_id='".$_SESSION['user_id']."') left join node_content on (node_content.node_id=nodes.node_id) left join users on users.user_id=nodes.node_creator left join nodes as creator on nodes.node_creator=creator.node_id where nodes.node_parent='$node_id'";

                if (!empty($params['search'])) {
			if ($params['search_type']=='content') $sql_type.=" and node_content like '%".addslashes($params['search'])."%' ";
			else {
				$id=nodes::getNodeByLogin($params['search']);
				$sql_type=" and nodes.node_creator='$id'";
			}
			$q.=$sql_type;
		}	
		if ($children_type=='4') $q.=" order by nodes.node_created desc limit $offset,$listing_amount";
		else $q.=" order by nodes.template_id,nodes.node_name LIMIT $offset,$listing_amount";
		$set=$db->query($q);
	
		while ($set->next()) {
			$get_children_array[]=$set->getRecord();
		}

		$smarty->assign('get_children',$get_children_array);
	}
?>
