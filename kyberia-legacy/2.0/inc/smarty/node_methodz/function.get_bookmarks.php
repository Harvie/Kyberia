<?php
function smarty_function_get_bookmarks($brawco,&$smarty) {
	
	if (is_numeric($brawco['node_id'])) $bookcat=$brawco['node_id'];
	if (is_numeric($brawco['user_id'])) $user_id=$brawco['user_id'];
        global $db;

	//returning user specific bookmarks
	if ($user_id) {
		$q="select * from node_access left join nodes on node_access.node_id=nodes.node_id where user_id='$user_id' and node_bookmark='yes' and nodes.node_system_access='public'"; 		
		$set=$db->query($q);
		while ($set->next()) {
			$array[]=$set->getRecord();
		}
		$smarty->assign('get_bookmarks',$array);
		return false;
	}

	//returning my own bookmarks divided in categories
	$q="select distinct bookmark_category,nodes.* from node_access left join nodes on node_access.bookmark_category=nodes.node_id where user_id='".$_SESSION['user_id']."' and node_bookmark='yes' order by node_name";
        $result=$db->query($q);
        while ($result->next()) {
		$categories[$result->getString('node_id')]=$result->getRecord();
        }

        $q="select * from node_access left join nodes on node_access.node_id=nodes.node_id where user_id='".$_SESSION['user_id']."' and node_bookmark='yes'"; 
	if ($bookcat) $q.=" and (bookmark_category='$bookcat' or bookmark_category=0 or bookmark_category IS NULL) order by node_name desc";
	if ($bookcat && $_SESSION['user_id']==548) echo $q;
	
	else $q.="order by node_name";
        $result=$db->query($q);
        if (!$bookcat) { 
	while ($result->next()) {
		if (!$result->getString('bookmark_category')) {
			$categories['unsorted']['children'][]=$result->getRecord();
			$categories['unsorted']['sum']+=$result->getString('node_user_subchild_count');
		}
		else {
			$categories[$result->getString('bookmark_category')]['children'][]=$result->getRecord();
			$categories[$result->getString('bookmark_category')]['sum']+=$result->getString('node_user_subchild_count');
       		}
	 }	
	
        $smarty->assign('get_bookmarks',$categories);
	}
	
	else {
		while ($result->next()) {
			$bookmarks[]=$result->getRecord();
		}
		$smarty->assign('get_bookmarks',$bookmarks);
	}
}
?>
