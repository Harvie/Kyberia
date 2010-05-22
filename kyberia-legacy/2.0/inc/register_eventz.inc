<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


switch ($_POST['event']) {
        case 'register':
        $status=register();
        if($status) {
		echo $status;
		die();
        }
        else echo "<center><b><font color='red'>$error</font></b></center>";
        break;


}

function register() {
        global $db;
        $user_info=AddSlashes($_POST['user_info']);
        $email=$_POST['email'];
        $password1=$_POST['password1'];
        $password2=$_POST['password2'];
        $login=$_POST['login'];
        $user_icq=$_POST['user_icq'];
        $user_www=$_POST['user_www'];
        $user_ad=$_POST['user_ad'];
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

	$db->query("insert into nodes set node_name='$login',node_external_access='yes',node_system_access='public',node_type='7',node_parent='1',node_vector=';1'");
        $last_id=$db->getLastInsertId();
	$db->query("insert into node_content set node_content='$node_content',node_id='$last_id'");

        $q="INSERT INTO users set user_id='$last_id', user_status='ban',login='$login'";
  	$node_content=nodes::processContent($user_info);
        if (!empty($email)) $q.=", email='$email'";
	  $q.=",password='".md5($password1)."'";
        if (!empty($user_icq)) $q.=", icq='$user_icq' ";
        if (!empty($user_www)) $q.=", www='$user_www' ";
        if (!empty($user_ad)) $q.=", user_ad='$user_ad' ";
        $db->query($q);

//	$db->ubikRegister($login,$email,$user_www,$user_info,$last_id,$otazka_1,$otazka_2,$otazka_3);
        return "<center><span class='most_important'>Registracia prebehla uspesne</span><br><a href='/'>Return to main page</a>";
}




?>
