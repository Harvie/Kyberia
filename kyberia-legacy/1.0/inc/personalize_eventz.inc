<?php

switch ($_POST['event']) {
	case 'zmen data':
	$status=personalize_eventz::updateData();
	if($status) {
		Header("Location:".SCRIPT."?action=$action");
	}
	break;

	case 'zmen ikonu':
	$status=personalize_eventz::updateIcon();
	if($status) {
//		Header("Location:".SCRIPT."?action=$action&status=$status");
	}
	break;

	case 'zmen heslo':
	$status=personalize_eventz::updatePassword();
	if($status) {
		Header("Location:".SCRIPT."?action=$action&status=$status");
	}
	break;

	case 'zmen nastavenie':
	$status=personalize_eventz::updateSettings();
	if($status) {
		Header("Location:".SCRIPT."?action=$action&status=$status");
	}
	break;
}

class personalize_eventz {

function updateData() {
	global $kyberia;
	global $user_id;
	$user_info=$_POST['user_info'];
	$email=$_POST['email'];
	$user_icq=$_POST['user_icq'];
	$user_www=$_POST['user_www'];
	$user_ad=$_POST['user_ad'];
	$q="UPDATE user set id='$user_id'";
	if (!empty($user_info)) {
		$user_info=str_replace("\n","<br>",$user_info);
		$q.=", user_info='$user_info'";
	}
	if (!empty($email)) $q.=", email='$email' ";
	if (!empty($user_icq)) $q.=", user_icq='$user_icq' ";
	if (!empty($user_www)) $q.=", user_www='$user_www' ";
	if (!empty($user_ad)) $q.=", user_ad='$user_ad' ";
	$q.=" where id='$user_id'";
	$kyberia->query($q);
}


function updateSettings() {
	global $kyberia;
	global $user_id;
	global $error;
	$user_amount=addSlashes($_POST['user_amount']);
	$user_sad=addSlashes($_POST['user_sad']);
	$user_happy=addSlashes($_POST['user_happy']);
	$user_drugged=addSlashes($_POST['user_drugged']);
	$user_love=addSlashes($_POST['user_love']);
	$user_agressive=addSlashes($_POST['user_agressive']);
	$user_active_icons=$_POST['user_active_icons'];
	$user_icons_in_forum=$_POST['user_icons_in_forum'];

	if ($user_amount>100) {
		$error="Pocet zobrazitelnych prispevkov nemoze byt vacsi ako 100.";
		return false;
	}

	$q="UPDATE user set user_amount='$user_amount'";
//	if (!empty($user_ad)) $q.=", user_ad='$user_ad' ";
	$q.=",user_sad='$user_sad'";
	$q.=",user_happy='$user_happy'";
	$q.=",user_drugged='$user_drugged'";
	$q.=",user_agressive='$user_agressive'";
	$q.=",user_love='$user_love'";
	$q.=",user_active_icons='$user_active_icons'";
	$q.=",user_icons_in_forum='$user_icons_in_forum'";
	$q.=" where id='$user_id'";
	$kyberia->query($q);
	$q="UPDATE session set user_amount='$user_amount'";
//	if (!empty($user_ad)) $q.=", user_ad='$user_ad' ";
	$q.=" where user_id='$user_id'";
	$kyberia->query($q);
	return true;
}


function updateIcon() {
	global $user_name;
	$icon=$_FILES['icon'];
	if (empty($icon['tmp_name'])) {
		global $error;
		$error='Zle zadany subor';
		return false;
	}

	else {
		if (strstr($icon['name'],".gif")) {
			$cmd=GIFSICLE." --resize 50x_ ".$icon['tmp_name']." > ".ICONDIR.strtolower($user_name).".gif";
		}

		elseif (strstr($icon['name'],".jpg")){
			$cmd=NETPBM."/jpegtopnm ".$icon['tmp_name']." | ".NETPBM."/pnmscale -width=50 | ".NETPBM."/ppmquant 256 | ".NETPBM."/ppmtogif > ".ICONDIR.strtolower($user_name).".gif";
		}


		echo $cmd;
		shell_exec($cmd);
		return "Pozor pozor! Vymena ikony pravdepodobne prebehla uspesne ale tvoj prehliadac ju ma ulozenu v cache. Klikni preto prosim <a href='http://www.kyberia.sk/images/users/$user_name.gif'>sem</a> a daj refresh. Mala by sa nacitat nova ikona. Ked to neurobis tak nebravcuj.";
	}
}

function updatePassword() {
	global $kyberia;
	global $user_id;
	global $user_name;
	$oldpassword=$_POST['oldpassword'];
	$password1=$_POST['password1'];
	$password2=$_POST['password2'];
	$set=$kyberia->query("select * from user where id='$user_id' and password='".md5($oldpassword)."'");
	if($set->getNumRows()==0) {
		global $error;
		$error="Zadal si zle stare heslo.";
		return false;
	}
	elseif($password1!=$password2) {
		global $error;
		$error="Heslo a overovacie heslo niesu rovnake. Prosim skus znova.";
		return false;
	}
	elseif(strlen($password1)<6) {
		global $error;
		$error="Heslo musi mat minimalne 6 znakov. Noze potrap mozocek.";
		return false;
	}
	else {
		$kyberia->query("update user set password='".md5($password1)."' where id='$user_id'");
		return "heslo uspesne zmenene";
	}

}

}