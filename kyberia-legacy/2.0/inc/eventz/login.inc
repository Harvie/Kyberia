<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

function login(){

	global $db,$error,$node_id;
	$login=addslashes($_POST['login']);
	$password=$_POST['password'];
	$hash=md5($password);

	if (!session_id()) {
		$error='asi nemas zapnute cookies alebo co';
		return false;
	} 
	
	$q="select * from users where login='$login'";
	$set=$db->query($q);
	$set->next();	

  	require(SYSTEM_ROOT.'/inc/ldap.inc');
	$user_id=$set->getString('user_id');
	$ldap_response=LDAPuser::auth($user_id,$password);
	if ($set->getString('password')!=$hash and !$ldap_response) {
		$error="Zadal si nespravne uzivatelske meno alebo heslo. Rob so sebou nieco";
		log::log('login',$node_id,'failed',$_SERVER['REMOTE_ADDR'],$login);
		return false; 
	}

	elseif ($set->getString('user_status')=='waiting') {
		$error='Tvoja registracia este nebola schvalena.';
		return false;
	}

	else {

		$user_id=$set->getString('user_id');
		$cube_vector=$set->getString('cube_vector');
		
		// saves friends list as an array into user session

		    $q="select distinct node_parent,node_name from nodes where node_creator='$user_id' and external_link='session://friend' order by node_parent";
		    $friendset=$db->query($q);
		    while ($friendset->next()){
 			$_SESSION['friends'][$friendset->getString('node_parent')]=true;
		    }


		    $q="select nodes.node_name,nodes.node_id from node_access left join nodes on node_access.node_id=nodes.node_id where node_access.user_id='$user_id' and node_bookmark='yes' order by node_name";
		    $bookmarkset=$db->query($q);
		    while ($bookmarkset->next()){
 			$_SESSION['bookmarks'][$bookmarkset->getString('node_id')]=$bookmarkset->getString('node_name');
		    }

		//saves ignored users as an array into user session
		    $q="select node_parent,node_name from nodes where node_creator='$user_id' and external_link='session://ignore'";
		    $ignoreset=$db->query($q);
		    while ($ignoreset->next()){
 			$_SESSION['ignore'][$ignoreset->getString('node_parent')]=true;

		    }
		
			LDAPuser::replicate($login,$user_id,$password);

			$_SESSION['user_id']=$user_id;
			$_SESSION['user_name']=$login;
			if (!empty($cube_vector)) $_SESSION['cube_vector']=$cube_vector;			
			if (empty($_SESSION['template_set'])) $_SESSION['template_set']=$set->getString('template_set');
			if (is_numeric($_POST['screen_width'])) $_SESSION['browser']['screen_width']=$_POST['screen_width'];
			if (is_numeric($_POST['screen_height'])) $_SESSION['browser']['screen_height']=$_POST['screen_height'];
			$_SESSION['listing_amount']=$set->getString('listing_amount');
			$_SESSION['listing_order']=$set->getString('listing_order');
 			$_SESSION['header_id']=$set->getString('header_id');
			log::log('login',$node_id,'ok',$login);


		      }

		return true;
		
	}
?>