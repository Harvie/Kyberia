<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

define(UBIK_ID,'332'); 

class ubik {


	function ubikRegister() {
	
		global $db;
		$user_info=$_POST['user_info'];
		$login=$_POST['login'];
		$checkboxes=$_POST['checkboxes'];
		$user_www=$_POST['user_www'];
		$email=$_POST['email'];
		$icq=$_POST['user_icq'];

		$node_name=Addslashes("register application from gateway ".$_SERVER['HTTP_HOST']." for user $login");
		$text=nodes::processContent($user_info)."<br><br>";

		if ($email) $text.="email :: $email<br>";
		if ($user_www) $text.="www :: $user_www<br>";

		print_r($checkboxes);

		foreach ($checkboxes as $key => $value) {
			$text.="$key<br>";
		}
/*
		$q="insert into nodes set node_created=NOW(),node_name='$node_name',node_system_access='public',node_external_access='no',node_parent=63802,node_vector=';101;63535;63557;63802',node_creator=".UBIK_ID;
		$db->query($q);
		$id=$db->getLastInsertId();
		$q="insert into node_content set node_id='$id',node_content='$text'";
		$db->query($q);
		return $id;
*/
		$params['node_creator']=UBIK_ID;
		$params['node_content']=$text;
		$params['node_name']=$node_name;
		$params['node_parent']=63802;
		return nodes::addNode($params);
		
	}

	function ubikMail($params) {
		global $db;
		if (is_numeric($params['mail_to'])) $mail_to=$params['mail_to'];
		else return false;
		if (!empty($params['mail_text'])) $mail_text=addslashes($params['mail_text']);
		else return false;	
		$q="insert into mail set mail_from='".UBIK_ID."',mail_to='$mail_to',mail_user='$mail_to',mail_timestamp=NOW(),mail_text='$mail_text'";
		$db->query($q);
		$db->query("update users set user_mail_name='ubik',user_mail=user_mail+1 where user_id='$mail_to'");

	}
}

?>