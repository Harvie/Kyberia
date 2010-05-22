<?php

	function smarty_function_get_threaded_children($params,&$smarty) {
		global $db, $error, $node;

		$offset=$params['offset'];
		$limit=$params['listing_amount'];

                if (!empty($params['search'])) {
			if ($params['search_type']=='content') $sql_type.=" and node_content like '%".addslashes($params['search'])."%' ";
			else {
				$q2="select user_id from users where login='".$params['search']."'";
				$userset=$db->query($q2);
				$userset->next();
				$id=$userset->getString('user_id');
				$sql_type=" and nodes.node_creator='$id'";
			}
			$q.=$sql_type;
		}	
		if (!empty($params['time'])) $sql_type.=" and node_created >'".$params['time']."'";
		if (empty($params['orderby']) OR $params['orderby']=='desc') {
			//$orderby="node_vector desc";
			$orderby="concat(node_vector,'z') desc,depth";
		}
		else {
 			$orderby="node_vector asc";
		}
		if ($params['link']=='yes') $q.="(";
		$q.="select nodes.node_id,node_name,node_external_access,node_system_access,node_children_count,node_creator,node_created,lastchild_created,k,node_views,node_descendant_count,lastdescendant_created,template_id,node_updated,length(node_vector) as depth,users.login,node_vector, node_content from  nodes  left join node_content on node_content.node_id=nodes.node_id left join users on users.user_id=nodes.node_creator where node_vector like '".$node['node_vector']."%' $sql_type  and node_vector NOT LIKE '".$node['node_vector']."' order by $orderby LIMIT $offset,$limit";

		if ($params['link']=='yes') {
			$q.=" ) UNION (select nodes.node_id,node_name,node_external_access,node_system_access,node_children_count,node_creator,node_created,lastchild_created,k,node_views,node_descendant_count,lastdescendant_created,template_id,node_updated,length(node_vector) as depth,
			users.login,dst_vector as node_vector,node_content from neurons left join nodes on neurons.src=nodes.node_id  left join node_content on (node_content.node_id=nodes.node_id) left join users on users.user_id=nodes.node_creator where  dst_vector like '".$node['node_vector']."%' $sql_type  and dst_vector NOT LIKE '".$node['node_vector']."' order by $orderby LIMIT $offset,$limit)";				
		}

		if ($params['link']=='yes') $q.=" order by $orderby LIMIT $offset,$limit";

		$result=$db->query($q);

		while ($result->next()) {
			$get_children_array[]=$result->getRecord();
		}
		global $time_1, $time_2;
		$time_2=$result->getString('node_created');		
		$time_1=$get_children_array[0]['node_created'];

		$smarty->assign('get_threaded_children',$get_children_array);

	}
?>