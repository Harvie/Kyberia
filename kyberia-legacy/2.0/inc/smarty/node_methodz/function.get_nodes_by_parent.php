<?php

	function smarty_function_get_nodes_by_parent($params,&$smarty) {
		global $node;

		$parent=$params['parent'];
		$permissions=permissions::checkPermissions($parent);
		if (!$permissions['r']) {
			$error=$error_messages['READ_PERMISSION_ERROR'];
			return false;
		}
		
		if ($params['listing_amount']=='all') $listing_amount='232323233';
		else $listing_amount=$params['listing_amount'];
		if (empty($params['offset'])) $offset=0;
		else $offset=$params['offset'];

		if ($params['orderby']) {
 			$orderby=addslashes($params['orderby']);
		}

		global $db,$node;
		$node_id=$node['node_id'];
		$user_id=$_SESSION['user_id'];
		$q="select node_content.*,parent.node_name as parent_name,users.*,nodes.*,node_access.node_user_subchild_count from nodes left join nodes as parent on parent.node_id=nodes.node_parent left join node_access on node_access.node_id=nodes.node_id and node_access.user_id='$user_id' left join node_content on (node_content.node_id=nodes.node_id) left  join users on users.user_id=nodes.node_creator where ";
		$q.=" nodes.node_parent='$parent' and nodes.node_system_access!='private'"; 

			
                if ($_POST['template_event']=='filter_by') {
	                if ($_POST['search_type']=='content')
       			         $sql_type.=" and node_content like '%".addslashes($_POST['node_content'])."%' ";
			else {
		                $q2="select user_id from users where login='".$_POST['node_content']."'";
		                $userset=$db->query($q2);
		                $userset->next();
		                $id=$userset->getString('user_id');
		                $sql_type=" and nodes.node_creator='$id'";
	                }
        	        $q.=$sql_type;
	        }
                                                                                                                                                                                                                                                                                                                        
		if ($orderby) $q.=" order by $orderby ";
		else $q.=" order by nodes.node_id desc ";
		$q.= " LIMIT $offset,$listing_amount ";
		$set=$db->query($q);
		while ($set->next()) $pole[]=$set->getRecord();
		$smarty->assign('get_nodes_by_parent',$pole);

	}
?>