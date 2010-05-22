<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


function processRegexp($matches) {
	global $db,$error;
	$set=$db->query("select node_id from nodes where node_name='".$matches[1]."' order by node_views desc limit 1");
	$set->next();
	$id=$set->getString('node_id');
	return "<a href='/id/$id'>".$matches[2]."</a>";
}

class nodes {

function processRegexp($matches) {
	print_r($matches);
}

function addNode($params) {
	global $db,$node,$error;
	$parent_id=$params['node_parent'];
	$parent_permissions=permissions::checkPermissions($parent_id);
	if (!$parent_permissions['w']) {
		$error=$error_messages['WRITE_PERMISSION_ERROR'];
		log::log('add','error','WRITE_PERMISSION_ERROR');
		return false;
	}

        $kset=$db->query("select user_k from users where user_id='$params[node_creator]'");
        $kset->next();
        $user_k=$kset->getString('user_k');
	
	if (!$user_k) {
		$error=$error_messages['K_SPENT'];
		return false;
	}

	

	$set=$db->query("select node_vector from nodes where node_id='$parent_id'");
	$set->next();
	$parent_vector=$set->getString('node_vector');

	//working with external links
	$external_link=$params['external_link'];

	$template_id=$params['template_id'];
	if (!is_numeric($template_id)) $template_id=DEFAULT_TEMPLATE_ID;

	$q="insert into nodes set 
node_name='".addslashes($params['node_name'])."',
node_external_access='".$node['node_external_access']."',
node_system_access='".$node['node_system_access']."',
node_creator='".$params['node_creator']."',
template_id='".$template_id."',
external_link='".$external_link."',
node_parent='".$params['node_parent']."',
node_views=0,node_created=NOW(),
node_vector='".$params['node_vector']."'";
	$db->query("start transaction");		
        $db->query($q);
        $id=$db->getLastInsertId();
	$db->query("insert into node_content set node_id='$id',node_content='".$params['node_content']."'");
        $new_id=str_pad($id,VECTOR_CHARS,"0",STR_PAD_LEFT);
	$new_vector=$parent_vector.$new_id;

	$db->query("update nodes set node_vector='$new_vector' where node_id='$id'");
	$db->query("update nodes set node_children_count=node_children_count+1 where node_id='$parent_id'");

        $node_vector=trim(chunk_split($new_vector,VECTOR_CHARS,';'),';');
	//if ($_SESSION['user_id']==548) echo "LALALA".$node_vector;
	$ancestors=explode(";",$node_vector);
	foreach($ancestors as $key => $ancestor_id) {
		if ($key) {
			$ancestor_id=ltrim($ancestor_id,'0');
			$db->query("update nodes set node_descendant_count=node_descendant_count+1,lastdescendant_created=NOW() where node_id='$ancestor_id'");
		}
	}
	$db->query("update node_access set node_user_subchild_count=node_user_subchild_count+1 where node_id='$parent_id'");
	--$user_k;
        $db->query("update users set user_k='$user_k' where user_id='$params[node_creator]'");
	$db->query("commit");
        log::log('add','ok',$id);

	return $id;
}


function processContent($node_content) {
	global $node;
        include_once(SYSTEM_ROOT.'/inc/htmlparse.inc');
	
	if ($node['template_id']==$node['node_id'] && $_POST['event']=='configure_content') {

	}

	elseif ($_POST['no_html']) {
		$node_content=htmlspecialchars($node_content);
	}

	else {
	        global $db,$htmlparse,$error;

	        if (!htmlparse::htmlparse($node_content)) {
			$error=$htmlparse;
			return false;
		}

	        $node_content = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank'href=\"\\6\\7\">\\6\\7</a>",$node_content);
		$node_content=preg_replace_callback("/##(.*)##(.*)##/i","processRegexp",$node_content);
       	}

	$node_content=addslashes($node_content);
	return $node_content;
}


	function getUserByLogin($login) {
		global $error, $error_messages;
		$q2="select user_id from users where login='".$login."'";
                $userset=$db->query($q2);
                $userset->next();
                $id=$userset->getString('user_id');
		if (is_numeric($id)) return $id;
		else {
			$error = $error_messages['USER_NOT_FOUND'];
			return false;
		}
	}


	function getNodeIdByName($name) {
		global $db;
		$q="select node_id from nodes where node_name='$name'";
		$set=$db->query($q);
		$set->next();
		return $set->getString('node_id');
	}

	function getNodeById($node_handle,$user_id) {
		global $db, $error;
		$q="select length(concat(nodes.node_vector)) as vector_depth,node_content.node_content,nodes.*,nodes.node_creator as node_owner_id,creator.node_name as owner,node_access.*,nodes.node_id as node_id,node_parent.node_name as node_parent_name from nodes left join nodes as creator on creator.node_id=nodes.node_creator left join nodes as node_parent on nodes.node_parent=node_parent.node_id left join node_content on nodes.node_id=node_content.node_id left join node_access on (node_access.node_id='$node_handle' and node_access.user_id='$user_id') where nodes.node_id='$node_handle'";

		$result=$db->query($q);
		if (!$result->next()) {
			$error="no such node_id $node_handle exists";
			return false;
		}
		else {
			$node=$result->getRecord();
		}	
		return $node;
		
	}


	function redirByName($node_handle) {
		global $db, $error;
		$user_id=$_SESSION['user_id'];
		$set=$db->query("select node_id from nodes where node_name='$node_handle' and node_creator='$user_id'");
		if ($set->next()) {
			$node_id=$set->getString('node_id');
			if (!empty($node_id)) {
				Header("Location: /id/$node_id");
			}
			return true;
		}
		$set=$db->query("select node_id from nodes where node_name='$node_handle' ");
		$set->next();
		$node_id=$set->getString('node_id');
		if (!empty($node_id)) {
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
