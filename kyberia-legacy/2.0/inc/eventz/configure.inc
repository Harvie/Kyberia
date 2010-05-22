<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	function configure() {
		global $db,$error,$node;
		$user_id=$_SESSION['user_id'];

		if ($node['node_permission']=='owner') {			

		if (!empty($_FILES['description_image']['tmp_name'])) {
	      		$image=$_FILES['description_image']['tmp_name'];
	      		$image_name=$_FILES['description_image']['name'];

			if ($node['node_id']==$user_id) $width=50;
			else $width=123;

			if (stristr($image_name,".jpg") || stristr($image_name,".jpeg") ){
		                $cmd=UTILZ_DIR."/jpegtopnm  $image |".UTILZ_DIR."/pnmscale -width=$width | ".UTILZ_DIR."ppmquant 256 |".UTILZ_DIR."ppmtogif >".SYSTEM_ROOT."images/nodes/".substr($node['node_id'],0,1)."/".substr($node['node_id'],1,1)."/".$node['node_id'].".gif";
			}
		        elseif (stristr($image_name,".gif")) {
        		        $cmd=UTILZ_DIR."/gifsicle --resize ".$width."x_ $image > ".SYSTEM_ROOT."images/nodes/".substr($node['node_id'],0,1)."/".substr($node['node_id'],1,1)."/".$node['node_id'].".gif";
	        	}
			if ($cmd) {
				shell_exec($cmd);
			}
			echo $cmd;
		}

			if (empty($_POST['node_creator'])) {
				$owner_id=$node['node_creator'];
			}

			else {
				$node_creator=$_POST['node_creator'];
				$q="select user_id from users where login like '$node_creator'";
				$ownerset=$db->query($q);
				if (!$ownerset->getNumRows()) {
					$error="user $node_creator does not exist";
					return false;
				}
				else {
					$ownerset->next();
					$owner_id=$ownerset->getString('user_id');
				}
			}

			$node_vector=$_POST['node_vector'];
			$old_vector=$node['node_vector'];
			if (is_numeric($_POST['template_id'])) $template_id=$_POST['template_id'];
			$node_parent=$_POST['node_parent'];
			$node_created=$_POST['node_created'];
			$node_id=$node['node_id'];
	

			$permissions=permissions::checkPermissions($node_parent);
			if (!$permissions['w']) {
				$error="you don't have permissions for writing into $node_parent";
				return false;
			}

			if ($node_parent) {
//				$set=$db->query("select node_vector from nodes where node_id='$node_parent'");
//				$set->next();
//				$node_vector=$set->getString('node_vector');
				$parent_node=nodes::getNodeById($node_parent,$_SESSION['user_id']);
				$node_vector=$parent_node['node_vector'].";".$parent_node['node_id'];;
			}

			$node_name=$_POST['node_name'];

			$node_external_access=$_POST['node_external_access'];
			$node_system_access=$_POST['node_system_access'];

			require(SYSTEM_ROOT.'/inc/htmlparse.inc');
			global $htmlparse;
			htmlparse::htmlparse($node_name);

			if (!empty($htmlparse)) {
				$error=$htmlparse;	
				return false;
			}
			
			$node_id=$node['node_id'];
			
			//change also users table when changing users login
			if ($node['node_type']=='user' && $node_name!=$node['node_name']) {
				$node_name=strip_tags($node_name);
				$s=$db->query("select user_id from users where login='$node_name'");
				if ($s->getNumRows()) {
					$error="username $node_name already in use";
					return false;
				}
				else {
					echo "update users set login='$node_name' where user_id='$user_id'";
					$db->query("update users set login='$node_name' where user_id='$user_id'");
				}
			}
				
			$q="update nodes set template_id='$template_id',node_name='$node_name',node_system_access='$node_system_access',node_external_access='$node_external_access',node_creator='$owner_id' where node_id='$node_id'";
			$db->query($q);

			return true;

		}	
			
	}
?>