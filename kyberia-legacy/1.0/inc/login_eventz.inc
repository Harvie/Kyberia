<?php

$status=login_eventz::login();
if ($status) {
	Header("Location:".SCRIPT);
}


class login_eventz {

function login(){
	global $kyberia;
	global $error;
	$login=addslashes($_POST['login']);
	$password=$_POST['password'];
	$oldpassword=$password;
	$hash=md5($oldpassword);
	if (empty($_COOKIE['kybersession'])) {
		$error='asi nemas zapnute cookies alebo co';
		return false;
	} 
	else $kybersession=$_COOKIE['kybersession'];

	if (strlen($login) != strlen($_POST['login'])) {
		$kyberia->ubikMail(252, "sql injekcia $login z $_SERVER[REMOTE_ADDR]");
		$kyberia->ubikMail(231, "sql injekcia $login z $_SERVER[REMOTE_ADDR]");
		$error = "Bohuzial, nemozes sa prihlasit, uz vyprsala tato nasa bonusova sluzba, prosim, sleduj nadalej kyberiu a cakaj na ine nase vychytavky.";
		return false;
	}

	$q="select * from user where login='$login' ";
	$set=$kyberia->query($q);
	$set->next();	
	if ($set->getString('password')!=$hash) {
		$error="Zadal si nespravne uzivatelske meno alebo heslo. Rob so sebou nieco";
		if ($set->getString('id')) {
			$kyberia->ubikMail($set->getString('id'),"Niekto sa skusal dostat do tvojho konta z adresy ".$_SERVER['REMOTE_ADDR']." a zadal heslo <select><option></option><option>$oldpassword</option></select>");		
		}

		return false; 
	}

	elseif ($set->getString('user_active')!='yes') {
		$error="Tvoja buducnost je este stale v rukach KKpBB";
		return false;
	}

	else {
		$user_id=$set->getString("id");

// updatuje friends_serial
    $q2="select friend_id from friends where user_id='$user_id'";
    $set2=$kyberia->query($q2);
    $friends_serial="";
    while ($set2->next()){
      $friends_serial.=($set2->getString('friend_id')).";";
    }
		$kyberia->query("update user set friends_serial='$friends_serial' where id='$user_id'");

		$kyberia->query("delete from session where user_id='$user_id'");
		$kyberia->query("INSERT into session set user_id='$user_id',session='$kybersession',user_name='".$set->getString('login')."',user_amount='".$set->getString('user_amount')."',admin='".$set->getString('admin')."'");
		$kyberia->query("insert into user_ip set ip='".$_SERVER['HTTP_X_FORWARDED_HOST']."::".$_SERVER['REMOTE_ADDR']."',user_id='$user_id'");
	}

	return true;
		
}

}

?>
