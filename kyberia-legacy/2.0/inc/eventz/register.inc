<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


function register() {
	
        global $db,$error;
	$error="kyberia.sk had shut down operations. we'll make a comeback";
	return false;
        $user_info=AddSlashes($_POST['user_info']);
        $email=AddSlashes($_POST['email']);
        $password1=$_POST['password1'];
        $password2=$_POST['password2'];
        $login=AddSlashes($_POST['login']);
        $user_icq=AddSlashes($_POST['user_icq']);
        $user_www=AddSlashes($_POST['user_www']);
        $user_ad=$_POST['user_ad'];
	$node_content=AddSlashes($_POST['user_info']);

        $set=$db->query("select * from users where login='$login'");
	if($set->getNumRows()>0) {
                global $error;
                $error="<br><br>CHYBA:: Uzivatel s podobnym loginom uz je zaregistrovany.";
                return false;
        }
        elseif($password1!=$password2) {
                global $error;
                $error="<br><br>CHYBA:: Heslo a overovacie heslo niesu rovnake. Prosim skus znova.";
                return false;
        }
        elseif(strlen($password1)<6) {
                global $error;
                $error="<br><br>CHYBA:: Heslo musi mat minimalne 6 znakov. Noze potrap mozocek.";
                return false;
        }
        elseif(empty($user_info)) {
                global $error;
                $error="<br><br>CHYBA:: Prosim napis nieco o sebe.<br><br>";
                return false;
        }
        elseif(empty($email)) {
                global $error;
                $error="<br><br>CHYBA:: Prosim zadaj svoj email.<br><br>";
                return false;
        }
        elseif((strpos($email, '@') === false) || (strpos($email, '@') == '0') || (strpos($email, '@') >= (strlen($email) - 4))) {

                global $error;
                $error="<br><br>CHYBA:: Prosim zadaj korektny email.<br><br>";
                return false;
        }

	$fplog = fopen("/tmp/keket.txt", "a");
	fwrite($fplog, "\n$email\n");
	fwrite($fplog, $_SERVER['REMOTE_ADDR'].' '.$_SERVER['X_FORWARDED_FOR']);
	fclose($fplog);

	if ($email == 'foobar@pisem.net') {
		die();
	}

	if ($_SERVER['HTTP_HOST']=='www.slobodnavolba.sk') {
		$vector=';1;103';
		$parent='103';
	}

	elseif ($_SERVER['HTTP_HOST']=='www.hysteria.sk') {
		$vector=';1;102';
		$parent='102';
	}

	else {
		$vector='';
		$parent='';
	}

		
if (!empty($_POST['cube_vector'])) {
	$q = "insert into nodes set external_link='db://user',node_creator='$id',node_name='$login',node_external_access='yes',node_system_access='public',node_parent='$parent',node_vector='$vector', template_id='7'";
	$db->query("insert into nodes set external_link='db://user',node_creator='$id',node_name='$login',node_external_access='yes',node_system_access='public',node_parent='$parent',node_vector='$vector', template_id='7'");
        $last_id=$db->getLastInsertId();
	$db->query("insert into node_content set node_content='$node_content',node_id='$last_id'");

        $q="INSERT INTO users set user_status='waiting',user_id='$last_id',login='$login'";
  	$node_content=nodes::processContent($user_info);
        if (!empty($email)) $q.=", email='$email'";
	  $q.=",password='".md5($password1)."'";
        if (!empty($user_icq)) $q.=", icq='$user_icq' ";
        if (!empty($user_www)) $q.=", www='$user_www' ";
        if (!empty($user_ad)) $q.=", user_ad='$user_ad' ";
	$q.=",cube_vector='".$_POST['cube_vector']."'";
        $db->query($q);
}	

else {
	$id=ubik::ubikRegister();
	$q = "insert into nodes set external_link='db://user',node_creator='$id',node_name='$login',node_external_access='yes',node_system_access='public',node_parent='$parent',node_vector='$vector', template_id='7'";
	$db->query("insert into nodes set external_link='db://user',node_creator='$id',node_name='$login',node_external_access='yes',node_system_access='public',node_parent='$parent',node_vector='$vector', template_id='7'");
        $last_id=$db->getLastInsertId();
	$db->query("insert into node_content set node_content='$node_content',node_id='$last_id'");

        $q="INSERT INTO users set user_status='waiting',user_id='$last_id',login='$login'";
  	$node_content=nodes::processContent($user_info);
        if (!empty($email)) $q.=", email='$email'";
	  $q.=",password='".md5($password1)."'";
        if (!empty($user_icq)) $q.=", icq='$user_icq' ";
        if (!empty($user_www)) $q.=", www='$user_www' ";
        if (!empty($user_ad)) $q.=", user_ad='$user_ad' ";
        $db->query($q);

}	

        echo "<center><span class='most_important'>Registracia prebehla uspesne. Budete informovany e-mailom.</span>";
	die();
}




?>
