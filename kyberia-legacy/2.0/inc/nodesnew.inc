<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


{{
class nodes {

function processRegexp($matches) {
	print_r($matches);
}

function processContent($node_content) {
        require(SYSTEM_ROOT.'/inc/htmlparse.inc');
	if ($_POST['no_html']) {
		$node_content=htmlspecialchars($node_content);
	}

	else {
	        global $db,$htmlparse,$error;
/*
	        if (!htmlparse::htmlparse($node_content)) {
			$error=$htmlparse;
			return false;
		}
*/
	        $node_content = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank'href=\"\\6\\7\">\\6\\7</a>",$node_content);
		$node_content=preg_replace_callback("/#(.*)#(.*)#/i","processRegexp",$node_content);
//		$node_content=strip_tags($node_content,'<center><a><b><i><u><img><br><p><font><pre>');
       	}
	$node_content=addslashes($node_content);
	return $node_content;
}


	function getNodeById($node_handle,$user_id) {
		global $db, $error;
		$q="select length(concat(nodes.node_vector,';',nodes.node_id)) as vector_depth,node_content.node_content,nodes.*,nodes.node_creator as node_owner_id,creator.node_name as owner,node_access.*,nodes.node_id as node_id,node_parent.node_name as node_parent_name from nodes left join nodes as creator on creator.node_id=nodes.node_creator left join nodes as node_parent on nodes.node_parent=node_parent.node_id left join node_content on nodes.node_id=node_content.node_id left join node_access on (node_access.node_id='$node_handle' and node_access.user_id='$user_id') where nodes.node_id='$node_handle'";

		$result=$db->query($q);
		if (!$result->next()) {
			$error="no such node_id $node_handle exists";
			return false;
		}
		else {
			$node=$result->getRecord();
			if (($node['node_system_access']=='crypto') && isset($_SESSION['crypto'])) {
				require(SYSTEM_ROOT.'/inc/crypto.inc');
				$node['node_content']=crypto::decrypto($node['node_content'],$_SESSION['crypto'][$node['node_id']]);
			}	
		return $node;
		}
	}


	function getNodeByOldId($node_handle,$user_id) {
		global $db, $error;
		$q="select nodes.* from nodes  where nodes.old_id='$node_handle'";

		$result=$db->query($q);
		if (!$result->next()) {
			$error="no such old_id $node_handle exists";
			return false;
		}
		else {
			return $result->getRecord();
		}

	}

	function redirByName($node_handle) {
		global $db, $error;
		$set=$db->query("select node_id from nodes where node_name='$node_handle'");
		$set->next();
		$node_id=$set->getString('node_id');
		if ($node_id) {
			Header("Location: /id/$node_id");
		}
		
	}

	function getNodesByName($node_handle) {
		global $db, $error;
		$q="select nodes.* from nodes where node_name='$node_handle%'";

		$result=$db->query($q);

		while ($result->next()){
			$record[]=$result->getRecord();
		}
		return $record;

	}



	function getChildrenNodes($orderby="desc",$offset=0,$limit=DEFAULT_LISTING_AMOUNT) {
		global $db, $error, $node;
		$node_handle=$node['node_id'];
	
		$q="select users.*,nodes.*,node_content.* from nodes 
left join node_content on (node_content.node_id=nodes.node_id) 
left join users on users.user_id=nodes.node_creator where 
node_parent='$node_handle' order by node_created $orderby LIMIT $offset,$limit";
		echo $q;
		$result=$db->query($q);

		while ($result->next()) {
			$array[]=$result->getRecord();
		}
		
		return $array;

	}


	function getThreadedChildrenNodes($orderby="desc",$offset=0,$limit=DEFAULT_LISTING_AMOUNT) {
		global $db, $error, $node;
		$node_handle=$node['node_id'];
	
		$q="select length(node_vector) as depth,users.login,nodes.*,node_content.* from nodes  left join node_content on (node_content.node_id=nodes.node_id)  left join users on users.user_id=nodes.node_creator where  node_vector like '".$node['node_vector'].";".$node['node_id']."%' and node_type=3 order by concat(node_vector,';',nodes.node_id,';z') desc,depth LIMIT $offset,$limit";

		$result=$db->query($q);

		while ($result->next()) {
			$children_array[]=$result->getRecord();
		}
		
		return $children_array;

	}



	function getNodeAccessData() {
		global $node,$db;
		$q="select users.login,node_access.* from node_access left join users on users.user_id=node_access.user_id where node_id='".$node['node_id']."' and node_permission!=''";
		$result=$db->query($q);

                while ($result->next()) {
                        $access_data[]=$result->getRecord();
                }

                return $access_data;

	}
}

?>
