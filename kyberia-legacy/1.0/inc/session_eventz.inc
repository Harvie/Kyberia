<?php

switch ($_POST['event']) {
        case 'register':
                $status=eventz::register();
		if ($status) {
			Header("Location:".SCRIPT."?action=session");		
		}
                
		break;

        case 'adduser':
                $status=eventz::adduser();
		if ($status) {
			Header("Location:".SCRIPT."?action=session");		
		}
                
		break;

        case 'zmen meno':
                $status=eventz::updateuser();
		if ($status) {
			Header("Location:".SCRIPT."?action=session");		
		}
                
		break;

        case 'delete':
                $status=eventz::delete();
		if ($status) {
			Header("Location:".SCRIPT."?action=session");		
		}
                
		break;


}

class eventz {

function register() {
	global $kyberia;
	global $user_id;
	global $user_name;

		$set=$kyberia->query("select count(*) as pocet from mindfuck");
		$set->next();
		$pocet=$set->getString('pocet');
		if ($pocet>=193) {
			global $error;
			$error="bohuzial uz nieje volne miesto. skus neskor";
			return false;
		}
		$q="insert into mindfuck set user_id='$user_id',meno='$user_name'";	
		$result=mysql_query($q);
		$kyberia->ubikMail($user_id,"Bol si zaregistrovany na kyberia session. Vdaka, dufam ze si to uzijes ;-)");
		return true;
	}

function adduser() {
	global $kyberia;
	global $user_id;
	global $user_name;

	$meno=$_POST['meno'];

		$set=$kyberia->query("select count(*) as pocet from mindfuck");
		$set->next();
		$pocet=$set->getString('pocet');
		if ($pocet>=193) {
			global $error;
			$error="bohuzial uz nieje volne miesto. skus neskor";
			return false;
		}
		$q="insert into mindfuck set user_id='$user_id',meno='$meno'";	
		$result=mysql_query($q);
		$kyberia->ubikMail($user_id,"Zaregistroval si znameho s menom $meno na kyberia party.");
		return true;
	}

function updateuser() {
	global $kyberia;
	global $user_id;
	global $user_name;

	$meno=$_POST['meno'];
	$mindfuck_id=$_POST['mindfuck_id'];
		$q="update mindfuck set meno='$meno' where (user_id='$user_id' and mindfuck_id='$mindfuck_id')";	
		$result=mysql_query($q);
//		$kyberia->ubikMail($user_id,"Zaregistroval si znameho s menom $meno na kyberia party.");
		return true;
	}



function delete() {
	global $kyberia;
	global $user_id;
	global $user_name;
	$mindfuck_id=$_POST['mindfuck_id'];
		$q="delete from mindfuck where (user_id='$user_id' and mindfuck_id='$mindfuck_id')";	
		$result=mysql_query($q);
//		$kyberia->ubikMail($user_id,"Zaregistroval si znameho s menom $meno na kyberia party.");
		return true;
	}


}

