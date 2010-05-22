<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


	function add() {
	
		global $db,$error,$node,$permissions,$types;
	$error="kyberia.sk had shut down operations. read-only mode. we'll make a comeback on 23.10. or later ;=]";
	return false;

		$node_content=$_POST['node_content'];
		$node_parent=$_POST['node_parent'];
		$template_id=$_POST['template_id'];
		if (empty($template_id)) $template_id=4;
		$node_type=$template_id;

		$node_name=addslashes(strip_tags($_POST['node_name']));
		$external_link=addslashes(strip_tags($_POST['external_link']));

		if (empty($node_name)) { $node_name=date("d.m.Y-G:i:s"); }
		$parent_name=$node['node_name'];
		$node_creator=$_SESSION['user_id'];
		$node_system_access=$node['node_system_access'];

		if (!empty($_POST['node_chosen'])) {
			$node_chosen=$_POST['node_chosen'];
			if (count($node_chosen)>1) {
				$error="please select only one node.";
				return false;
			}
			else {
				$node_parent=$node_chosen['0'];
			}

		}

		if (empty($node_system_access)) {
			$node_system_access='public';
		}

		$node_external_access=$_POST['node_external_access'];
		if (empty($node_external_access)) {
			$node_external_access='yes';
		}

		
		if (empty($node_content)) {
			$error=$error_messages['ADD_NO_CONTENT'];
			return false;
		}

		$node_content=nodes::processContent($node_content);

		if ($node_system_access=='crypto') {

			require(SYSTEM_ROOT.'/inc/crypto.inc');

			if ($_SESSION['crypto'][$node_parent]) {
				$key=$_SESSION['crypto'][$node_parent];
			}
		        else {
				$key = substr(md5(uniqid(rand(), true)),0,8);
			}
		
			$node_content=crypto::crypto($node_content,$key);


			//setting generated crypto password for viewing
	      	        if ($node_system_access=='crypto') {
	       	 	       $_SESSION['crypto'][$id]=$key;
			}

		}

		$params['node_name']=$node_name;
		$params['template_id']=$template_id;
		$params['node_parent']=$node_parent;
		$params['node_system_access']=$node_system_access;
		$params['node_creator']=$_SESSION['user_id'];
		$params['node_content']=$node_content;
		$params['external_link']=$external_link;
		nodes::addNode($params);
		return true;
	}
?>