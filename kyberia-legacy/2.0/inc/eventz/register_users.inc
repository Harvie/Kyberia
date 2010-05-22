<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


function register_users() {
	global $permissions,$node,$db,$error;
$user_id=$_SESSION['user_id'];
$user_name=$_SESSION['user_name'];
$hello="ahoj, tymto ta vitam v systeme kyberia.sk. do systemu ta zaregistrovala moja malickost. v pripade ze budes mat akykolvek problem, kontaktuj ma prosim cez postu\n\nako prve by si mal navstivit forum <a href=\'/id/1017832\'><b><font color=yellow>Zaciname s kyberiou</font></b></a>\n\ntoto je automaticky vygenerovana sprava";
require(SYSTEM_ROOT."/inc/phpmailer.inc");
$mail = new PHPMailer();
$mail->IsSMTP();                                   // send via SMTP
$mail->Host     = "onyx.hysteria.sk"; // SMTP servers
$mail->From     = "admin@kyberia.sk";
$mail->FromName = "kyberia.sk admin";
$mail->WordWrap = 50;                              // set word wrap
$mail->Subject  =  "kyberia.sk uspesna registracia";


	if (!$permissions['w']) {
		$error="you don't have permissions for performing this event";
		return false;
	}
	
	foreach ($_POST['waiting'] as $user =>$value) {
		$set=$db->query("select email,login,node_creator from users left join nodes on nodes.node_id=users.user_id where user_id='$user'");
		$set->next();
		$email=$set->getString('email');
		$login=$set->getString('login');

		$application_id=$set->getString('node_creator');
/*
		$application=$db->query("select * from nodes where node_id='$application_id'");
		$application->next();
		$application_vector=$application->getString('node_vector').";".$application_id;
		$application_parent=$application->getString('node_parent');
		$db->query("insert into nodes set node_created=NOW(),node_name='$login  registered',node_vector='$application_vector',node_creator='$user_id',node_type='4',node_parent='$application_parent'");
		$id=$db->getLastInsertId();
		$db->query("insert into node_content set node_id='$id',node_content='user $login successfully registered by $user_name'");
*/
		$params['node_creator']=$user_id;
		$params['node_parent']=$application_id;
		$params['node_name']="$login registered";
		$params['node_content']="user $login successfully registered by $user_name";
		nodes::addNode($params);

		$db->query("update users set user_status='newbie' where user_id='$user'");	
		$db->query("update nodes set node_creator=node_id where node_id='$user'");
		$db->query("insert into mail set mail_user='$user',mail_to='$user',mail_from='$user_id',mail_text='$hello'");
		$db->query("insert into mail set mail_user='$user_id',mail_to='$user',mail_from='$user_id',mail_text='$hello'");
		$db->query("update users set user_mail='1',user_mail_name='$user_name' where user_id='$user'");	
		$mail->ClearAddresses();
		$mail->AddAddress($email);               // optional name
		$mail->AltBody  =  "bol si uspesne zaregistrovany do komunity kyberia.sk s loginom $login . njoy";
		if(!$mail->Send())
		{
		   $error="could not sent mail";
		   return false;
		}

	 }
	return true;
}
?>
