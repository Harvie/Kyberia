
<?php
	function smarty_function_get_userlist($params,&$smarty) {
		global $db,$node;
		if (is_numeric($params['node_id'])) $node_id=$params['node_id'];
		else $node_id=$node['node_id'];
		if ($params['vector']) {
			$vector=AddSlashes($params['vector']);
		}
		if ($_SESSION['cube_vector']) {
			$vector=$_SESSION['cube_vector'];
		}
		
		$q="select user_action,user_action_id,(UNIX_TIMESTAMP()-UNIX_TIMESTAMP(last_action)) as  idle,login,user_id from users where ";
		if ($vector) $q.=" user_location_vector like '$vector%' and ";
		$q.="  user_action_id IS NOT NULL order by login";

		$set=$db->query($q);


		while ($set->next()) {

			if (!empty($_SESSION['friends'][$set->getString('user_id')])) {
				$array=$set->getRecord();
				$array['idle_time_minutes']=floor($array['idle']/60);
				$array['idle_time_seconds']=$array['idle']%60;
				$active_friends[]=$array;
				
			}
			else {
				$array=$set->getRecord();
				$array['idle_time_minutes']=floor($array['idle']/60);
				$array['idle_time_seconds']=$array['idle']%60;
				$active_users[]=$array;

			}
		}

		$smarty->assign('active_users',$active_users);

		$smarty->assign('active_friends',$active_friends);



	}
?>
