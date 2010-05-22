<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


class permissions {

function isHierarch($node) {

	global $db;
	$user_id=$_SESSION['user_id'];
	if (!$user_id) return false;
	$node_vector=chunk_split($node['node_vector'],VECTOR_CHARS,';');
	$hierarchy=explode(';',$node_vector);		
	foreach ($hierarchy as $hierarch) {
		$hierarch=ltrim($hierarch,0);
		$q="select nodes.node_creator,node_access.node_permission from nodes left join node_access on nodes.node_id=node_access.node_id and node_access.user_id='".$_SESSION['user_id']."' where nodes.node_id='$hierarch'";
		$result=$db->query($q);
		$result->next();
		if ($result->getString('node_creator')==$user_id) 
			return true;
		if ($result->getString('node_permission')=='master') 
			return true;
		if ($result->getString('node_creator')=='operator') 
			return true;
		if ($user_id == 2045)
			return true;
	}
	return false;

}

function checkPermissions($node) {
global $db;
$user_id=$_SESSION['user_id'];

/*
thousand lights to Hierarchy! 
(check&set procedure for giving permissions for non-public subnodes according 
to bottom-top Hierarchy
*/
if (($node['node_system_access']!='public' and $node['node_system_access']!='crypto') and empty($node['node_permission'])) {
	$node_vector=trim(chunk_split($node['node_vector'],VECTOR_CHARS,';'),';');
	$hierarchy=array_reverse(explode(';',$node_vector));
	foreach ($hierarchy as $hierarch) {
		$hierarch=ltrim($hierarch,0);
		$q="select nodes.node_creator,nodes.node_system_access,node_access.node_permission from nodes left join node_access on nodes.node_id=node_access.node_id and node_access.user_id='".$_SESSION['user_id']."' where nodes.node_id='$hierarch'";
		$result=$db->query($q);
		$result->next();
		$hierarchy_bounce[]=$hierarch;

		//if hierarch permission rights are different than that of the node, quit the process changing nothing
		if ($result->getString('node_system_access')!=$node['node_system_access']) {
			break;
		}

		//if hierarch node_user relation exist, set it for node also
		elseif ($result->getString('node_permission')!='') {
			array_pop($hierarchy_bounce);
			$node['node_permission']=$result->getString('node_permission');
				$q="update node_access set node_permission='".$result->getString('node_permission')."' where node_id='".$node['node_id']."' and user_id='".$_SESSION['user_id']."'";
				$updated=$db->update($q);
				if (!$updated && IsSet($_SESSION['user_id'])) {
					$q="insert into node_access set node_permission='".$result->getString('node_permission')."', node_id='".$node['node_id']."',user_id='".$_SESSION['user_id']."'";
					$db->query($q);
				}
			break;
		}

		//similiar.if user is creator of hierarch, give him access
		elseif ($result->getString('node_creator')==$user_id) {
			array_pop($hierarchy_bounce);
			$node['node_permission']='access';
				$q="update node_access set node_permission='access' where node_id='".$node['node_id']."' and user_id='".$_SESSION['user_id']."'";
				$updated=$db->update($q);
				if (!$updated && IsSet($_SESSION['user_id'])) {
					$q="insert into node_access set node_permission='access', node_id='".$node['node_id']."',user_id='".$_SESSION['user_id']."'";
					$db->query($q);
				}
			break;
		}



	}	
			
}

	
//setting permissions for not logged in users
if ($_SESSION['user_id']==$node['node_creator']) {
		$permissions['r']=true;
		$permissions['w']=true;
}

elseif (!$_SESSION['user_id']) {

	if ($node['node_external_access']=='yes' AND ($node['node_system_access']=='public' OR $node['node_system_access']=='moderated' OR $node['node_system_access']=='cube')) {
		$permissions['r']=true;
		$permissions['w']=false;

	}

	else {

		$permissions['r']=false;
		$permissions['w']=false;
	}
}

//setting permissions for cube node

elseif ($node['node_system_access']=='cube') {

	if (strpos($node['node_vector'],$_SESSION['cube_vector'])==true ) {
		$permissions['r']=true;
		$permissions['w']=true;
	}	
	elseif (($node['node_permission']=='access')||($node['node_permission']=='op')||($node['node_permission']=='master')) {
                        $permissions['r']=true;
                        $permissions['w']=true;
       }


	else {
		$permissions['r']=false;
		$permissions['w']=false;
	}	
}


//setting permissions for private node
elseif ($node['node_system_access']=='private') {

	if (empty($node['node_permission'])) {
		$permissions['r']=false;
		$permissions['w']=false;
	}
	elseif ($node['node_permission']=='ban') {
		$permissions['r']=false;
		$permissions['w']=false;
	}

	elseif($node['node_permission']=='silence') {
		$permissions['r']=true;
		$permissions['w']=false;
	}
	else {

		$permissions['r']=true;
		$permissions['w']=true;
	}		
}

//setting permissions for moderated node
elseif ($node['node_system_access']=='moderated') {
	if (($node['node_permission']=='access')||($node['node_permission']=='op')||($node['node_permission']=='master')) {
			$permissions['r']=true;
			$permissions['w']=true;
		}
	elseif ($node['node_permission']=='ban') {
		$permissions['r']=false;
		$permissions['w']=false;
	}


		else {
			$permissions['r']=true;
			$permissions['w']=false;
		}		

}

//setting rights for public node
elseif ($node['node_system_access']=='public') {
	if ($node['node_permission']=='silence') {
		$permissions['r']=true;
		$permissions['w']=false;
	}

	elseif ($node['node_permission']=='ban') {
		$permissions['r']=false;
		$permissions['w']=false;
	}


	else {
		$permissions['r']=true;
		$permissions['w']=true;
	}
}


else {
		$permissions['r']=true;
		$permissions['w']=true;
}

return $permissions;
}

}

?>
