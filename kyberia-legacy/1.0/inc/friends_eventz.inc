<?php
switch ($_POST['event']) {
        case 'pridaj priatela':
                $status=eventz::addfriend();
		if ($status) {
			Header("Location:".SCRIPT."?action=ludia&subaction=friends");
		}
                else echo $error;
	break;

	case 'zmaz priatela':
                $status=eventz::deletefriend();
		if ($status) {
			Header("Location:".SCRIPT."?action=ludia&subaction=friends");
		}
                else echo $error;
	break;

	case 'zmen nastavenie':
                $status=eventz::changeseting();
		if ($status) {
			Header("Location:".SCRIPT."?action=ludia&subaction=friends");
		}
                else echo $error;
	break;

	case 'denniky':
                $status=eventz::alljournaux();
		if ($status) {
			Header("Location:".SCRIPT."?action=ludia&subaction=friends");
		}
                else echo $error;
	break;

	case 'kluby':
                $status=eventz::allforum();
		if ($status) {
			Header("Location:".SCRIPT."?action=ludia&subaction=friends");
		}
                else echo $error;
	break;
}

class eventz {

function addfriend() {
	global $kyberia;
	global $user_id;
	global $user_name;
	$friend_text=$_POST['friend_text'];
	$friend_name=$_POST['friend_name'];

	if (empty($friend_name)) {
		global $error;
		$error="Nezadal si meno priatela.";
		return false;
	}


	$q="select id from user where login='$friend_name'";
	$result=$kyberia->query($q);
	$result->next();
	$friend=$result->getRecord();
	$friend_id=$friend['id'];

	if (empty($friend_text)) {
		global $error;
		$error="Nezadal si text k priatelovi.";
		return false;
	}

	elseif ($friend_id==$user_id) {
		global $error;
		$error="egotrip?";
		return false;
	}

	elseif(empty($friend_id)) {
		global $error;
		$error="Uzivatel neexistuje!";
		return false;
	}

	$friend_text=strip_tags($friend_text,'<a><b><i><u><img><br><p><font>');
	$friend_text=str_replace("\n","<br>",$friend_text);
	$friend_text = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a href=\"\\6\\7\">\\6\\7</a>",$friend_text);
	$friend_text=addslashes($friend_text);
	$q="select * from friends where user_id='$user_id' and friend_id='$friend_id'";
	$result=$kyberia->query($q);

	if (($result->getNumRows())>0) {
		$q="update friends set friend_text='$friend_text' where user_id='$user_id' and friend_id='$friend_id'";
		$kyberia->query($q);
		$kyberia->ubikMail($friend_id,"Uzivatel $user_name zmenil tvoj friend komentar na text: $friend_text");
	}

	else {
		$q="insert into friends set user_id='$user_id',friend_text='$friend_text',friend_id='$friend_id'";
		$result=mysql_query($q);
		$kyberia->ubikMail($friend_id,"Uzivatel $user_name si ta pridal medzi priatelov s textom: $friend_text");
		$q="update user set charisma=charisma+1 where id='$friend_id'";
		$kyberia->query($q);

    $q2="select friend_id from friends where user_id='$user_id'";
    $set2=$kyberia->query($q2);
    $friends_serial="";
    while ($set2->next()){
      $friends_serial.=($set2->getString('friend_id')).";";
    }
		$kyberia->query("update user set friends_serial='$friends_serial' where id='$user_id'");


		return true;
	}


}

function deletefriend() {
	global $kyberia;
	global $user_id;
	global $user_name;
	$friend_text=$_POST['friend_text'];
	$friend_name=$_POST['friend_name'];

	$q="select id from user where login='$friend_name'";
	$result=$kyberia->query($q);
	$result->next();
	$friend=$result->getRecord();
	$friend_id=$friend['id'];

	if(empty($friend_id)) {
                global $error;
                $error="Uzivatel neexistuje!";
                return false;
        }

	$kyberia->query("delete from friends where friend_id='$friend_id' and user_id='$user_id'");
	$kyberia->query("update user set charisma=charisma-1 where id='$friend_id'");

    $q2="select friend_id from friends where user_id='$user_id'";
    $set2=$kyberia->query($q2);
    $friends_serial="";
    while ($set2->next()){
      $friends_serial.=($set2->getString('friend_id')).";";
    }
		$kyberia->query("update user set friends_serial='$friends_serial' where id='$user_id'");

}


function changeseting() {
	global $kyberia;
	global $user_id;
	global $user_name;
	global $jornaux;
	global $forum;

	if($jornaux){
		foreach($jornaux as $indx => $valu){
			$valu2=explode("_",$valu);
			$val=$valu2['1'];
			if (!($send[$val])){
				$send[$val]=0;
				$s_j[$val]='1';
				$send[$val]+=$s_j[$val];
			}
		}
	}

	if($forum){
		foreach($forum as $indx => $valu){
			$valu2=explode("_",$valu);
			$val=$valu2['1'];
			if (!($check[$val])){
				if(!$send[$val]){$send[$val]=0;}
				$check[$val]=1;
				$s_f[$val]='1';
				$send[$val]+=($s_f[$val])*2;
			}
		}
	}

	$q="select * from friends where user_id='$user_id'";
	$set=$kyberia->query($q);

	while ($set->next()){
		$f_id=$set->getString('friend_id');
		$s_mail=$set->getString('send_mail');
		$db_send[$f_id]=$s_mail;
		if(!$send[$f_id]){$send[$f_id]=0;}
		if (($db_send[$f_id])!=($send[$f_id])){
			$modify[$f_id]=$send[$f_id];

		}
	}
	if($modify){
		foreach($modify as $f_id => $s_m){
			$q="update friends set send_mail='$s_m' where user_id='$user_id' and friend_id='$f_id'";
			$kyberia->query($q);
		}
	}

}


function alljournaux() {
	global $kyberia;
	global $user_id;
	global $user_name;
	global $jornaux;
	global $forum;
	$journauxall=$_POST['journauxall'];

	if(!$journauxall){
		$journauxall=0;
	}else{$journauxall=1;}

	if($forum){
		foreach($forum as $indx => $valu){
			$valu2=explode("_",$valu);
			$val=$valu2['1'];
			if (!($check[$val])){
			$send[$val]=0;
				$check[$val]=1;
				$s_f[$val]='1';
				$send[$val]+=($s_f[$val])*2;
				$send[$val]+=$journauxall;
			}
		}
	}

	$q="select * from friends where user_id='$user_id'";
	$set=$kyberia->query($q);

	while ($set->next()){
		$f_id=$set->getString('friend_id');
		$s_mail=$set->getString('send_mail');
		$db_send[$f_id]=$s_mail;
		if(!$send[$f_id]){$send[$f_id]=$journauxall;}
		if (($db_send[$f_id])!=($send[$f_id])){
			$modify[$f_id]=$send[$f_id];

		}
	}
	if($modify){
		foreach($modify as $f_id => $s_m){
			$q="update friends set send_mail='$s_m' where user_id='$user_id' and friend_id='$f_id'";
			$kyberia->query($q);
		}
	}

}

function allforum() {
	global $kyberia;
	global $user_id;
	global $user_name;
	global $jornaux;
	global $forum;
	$forumall=$_POST['forumall'];

	if(!$forumall){
		$forumall=0;
	}else{$forumall=1;}

	if($jornaux){
		foreach($jornaux as $indx => $valu){
			$valu2=explode("_",$valu);
			$val=$valu2['1'];
			if (!($check[$val])){
				$check[$val]=1;
				$send[$val]=0;
				$s_j[$val]='1';
				$send[$val]+=$s_j[$val];
				$send[$val]+=$forumall*2;
			}
		}
	}


	$q="select * from friends where user_id='$user_id'";
	$set=$kyberia->query($q);

	while ($set->next()){
		$f_id=$set->getString('friend_id');
		$s_mail=$set->getString('send_mail');
		$db_send[$f_id]=$s_mail;
		if(!$send[$f_id]){$send[$f_id]=$forumall*2;}
		if (($db_send[$f_id])!=($send[$f_id])){
			$modify[$f_id]=$send[$f_id];

		}
	}
	if($modify){
		foreach($modify as $f_id => $s_m){
			$q="update friends set send_mail='$s_m' where user_id='$user_id' and friend_id='$f_id'";
			$kyberia->query($q);
		}
	}

}






}