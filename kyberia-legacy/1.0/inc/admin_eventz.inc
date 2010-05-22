<?php
switch ($_POST['event']) {
	case 'register' :
		eventz::userRegister();
	break;

	case 'veto' :
		eventz::veto();
	break;

	case 'update forum' :
		$status=eventz::updateForum();
		if ($status) Header("Location: ".SCRIPT."?action=admin&subaction=forums&nocache=".time());
	break;

}

class eventz {

	function userRegister() {
		global $user_id;
		global $kyberia;
		global $user_name;
		$result=$_POST['result'];
		$message=$_POST['message'];
		$action_parameter=$_POST['action_parameter'];
		$action_result=$_POST['action_result'];		
		$user_info=$_POST['user_info'];
		$login=$_POST['login'];
		$email=$_POST['email'];
		$data_1="$login<br>$email<br>$user_info";
		$data_2="komentar od registratora $user_name :: $message";					
		$q="insert into admin set action_timestamp=NOW(),action_name='register',action_parameter='$action_parameter',action_result='$action_result',action_data_2='$data_2',action_data_1='$data_1',admin_id='$user_id'";
		$kyberia->executeQuery($q);
		$kyberia->query("update user set user_active='waiting' where id='$action_parameter'");

	}


	function veto() {
		global $kyberia;
		global $user_id;
		$action_id=$_GET['action_id'];
		
	}

	function updateForum() {
		global $user_id;
		global $kyberia;
		$forum_id=$_POST['forum_id'];
		$forum_name=$_POST['forum_name'];
		$forum_category=$_POST['forum_category'];
		$forum_owner=$_POST['forum_owner'];
		$set=$kyberia->query("select id from user where login='$forum_owner'");
		if (!$set->getNumRows()) {
			$error="uzivatel s danym menom neexistuje";
			return false;
		}
		$set->next();
		$forum_owner=$set->getString('id');
		$q="insert into forum set forum_name='$forum_name',forum_owner='$forum_owner',forum_category='$forum_category',forum_id='$forum_id'";
//		echo $q;
		$kyberia->query($q);
		return true;
	}
		

}
