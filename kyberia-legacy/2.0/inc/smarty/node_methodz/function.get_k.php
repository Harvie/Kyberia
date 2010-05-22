<?php
	function smarty_function_get_k($params,&$smarty) {

		global $db,$node;
		if (is_numeric($params['offset'])) $offset=$params['offset'];
		else $offset=0;
		if (is_numeric($params['listing_amount'])) $listing_amount=$params['listing_amount'];
		else $listing_amount=23;
		if (!is_numeric($_POST['interval'])) $interval=1;
		else $interval = $_POST['interval'];
		if ($params['vector']) {
			$vector=$params['vector'];
			$interval=365;
		}	
		else $vector="00";
		
$q="select node_content.node_content,nodes.*,parent.node_name as parent_name,users.login as creator
 from nodes left join node_content on node_content.node_id=nodes.node_id left join nodes as parent on nodes.node_parent=parent.node_id
 left join users on users.user_id=nodes.node_creator where nodes.node_created>now()-interval $interval day 
  and nodes.node_vector like '$vector%' and nodes.k>0 order by nodes.k desc limit $offset,$listing_amount";

		$set=$db->query($q);
		while ($set->next()) {
			$k_array[]=$set->getRecord();
		}

		$smarty->assign('get_k',$k_array);



	}
?>