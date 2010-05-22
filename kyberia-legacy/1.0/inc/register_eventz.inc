<?php

switch ($_POST['event']) {
	case 'register':
	$status=register::register();
	if($status) {
		Header("Location:".SCRIPT."?status=$status");
	}
	else echo "<center><b><font color='red'>$error</font></b></center>";
	break;


}

class register {

function register() {
	global $kyberia;
	global $user_id;
	$user_info=$_POST['user_info'];
	$otazka_1=$_POST['otazka_1'];
	$otazka_2=$_POST['otazka_2'];
	$otazka_3=$_POST['otazka_3'];
	$email=$_POST['email'];
	$password1=$_POST['password1'];
	$password2=$_POST['password2'];
 	$login=$_POST['login'];
	$user_icq=$_POST['user_icq'];
	$user_www=$_POST['user_www'];
	$user_ad=$_POST['user_ad'];
	$set=$kyberia->query("select * from user where login='$login'");
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
	$q="INSERT INTO user set user_active='$user_active',login='$login'";
	if (!empty($user_info)) {
		$user_info=str_replace("\n","<br>",$user_info);
		$q.=", user_info='$user_info'";
	}
	if (!empty($email)) $q.=", email='$email'";
  $q.=",password='".md5($password1)."'";
	if (!empty($user_icq)) $q.=", user_icq='$user_icq' ";
	if (!empty($user_www)) $q.=", user_www='$user_www' ";
	if (!empty($user_ad)) $q.=", user_ad='$user_ad' ";
	$kyberia->query($q);
	$last_id=$kyberia->getLastInsertId();
	$kyberia->ubikRegister($login,$email,$user_www,$user_info,$last_id,$otazka_1,$otazka_2,$otazka_3);
	return "Rozhodnutie o registracii ti bude dorucene v priebehu niekolkych hodin";
}

}