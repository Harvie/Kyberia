<?php

switch ($_POST['event']) {
	case 'filtrovat':
		$set=$kyberia->query("select * from user where login='$_POST[mail_from]'");
		if ($set->getNumRows()) {
			$set->next();
			header("Location: ?action=posta&from=".$set->getString("id")."&limit=$_POST[limit]");
			exit();
		}
		$error = "Co tak zadat spravne meno?";
		break;

	case 'poslat':

	//do not send a message when limit number is changed
	if ($user_amount!=$limit) {
		$count=post_eventz::cachePost();
	}

	else {
		$status=post_eventz::send();
		if ($status) {
			Header("Location:".SCRIPT."?action=posta&nocache=".time());
		}
	}
	break;

	case 'zmazat':
	post_eventz::delete();

	Header("Location:".SCRIPT."?action=posta".(is_numeric($_GET['from']) ? "&from={$_GET[from]}" : ''));
	break;

	case 'vymaz vsetko':
	post_eventz::deleteAll();

	header("Location: ?action=posta");
	exit();
	break;

	case ('<<' or '>>' or '>' or '<'):
	$count=post_eventz::cachePost();
	break;
}


class post_eventz {

	function cachePost() {
		global $kyberia;
		global $user_id;
		$set=$kyberia->query("select count(*) as pocet from mail where mail_from='$user_id' or mail_to='$user_id'");
		if ($set->getNumRows()) {
			$set->next();
			return $set->getString('pocet');
		}
		else {
			global $error;
			$error="Chyba? Kde sa ksakru stala chyba?";
		}
	}


	function send() {
		global $kyberia;
		global $user_id;
		global $user_name;
		global $user_mode_message;
		$mail_name=$_POST['mail_to'];
		$mail_to=explode(";",$mail_name);
		$mail_text=$_POST['mail_text'];
		$nohtml=$_POST['nohtml'];

		if ($mail_name=="hromi") {
			global $error;
			$error="there is no hromi. jhnprcvlhckwrth production wishes you happy consonant memorizing ;)";
			return false;
		}

        if (count($mail_to)==1) {
	        $q="select id from user where login='$mail_name'";
			$result=$kyberia->query($q);
			$result->next();
			$to=$result->getRecord();
			$mail_to_id[]=$to['id'];
        }

        elseif (count($mail_to)>1) {
        	foreach ($mail_to as $mail_to_exploded) {
	        	$q="select id from user where login='$mail_to_exploded'";
				$result=$kyberia->query($q);
				$result->next();
		   		$to=$result->getRecord();
		   		$mail_to_id[]=$to['id'];
            }
        }


		if (empty($mail_text)) {
			global $error;
			$error="Prilis kratka sprava. Syr vesela krava, student prava a ci dobra trava?";
		}

        /*
		if ($mail_to_id==$user_id) {
			$error="mas schizofreniu ked si pises postu?";
		}
        */

		if (!empty($nohtml)) {
			$mail_text=htmlspecialchars($mail_text);
		}

		if ($mail_to_id) {
			$mail_text=strip_tags($mail_text,'<a><b><i><u><img><br><p><font>');
			$mail_text=str_replace("\n","<br>",$mail_text);
			$mail_text = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a href=\"\\6\\7\">\\6\\7</a>",$mail_text);

			//add user mode message
			if (!empty($user_mode_message)) $mail_text.="<br><br>-->$user_mode_message<--";

			$mail_text=addslashes($mail_text);

            foreach ($mail_to_id as $mail_to_id_send) {
            	$q="insert into mail2 set mail_user='$user_id',mail_read='no',mail_from='$user_id',mail_text='$mail_text',mail_to='$mail_to_id_send',mail_timestamp=NOW()";
				$result=mysql_query($q);
                $duplicate_id=mysql_insert_id();
				$q="insert into mail2 set mail_duplicate_id='$duplicate_id',mail_read='no',mail_user='$mail_to_id_send',mail_from='$user_id',mail_text='$mail_text',mail_to='$mail_to_id_send',mail_timestamp=NOW()";
				$result=mysql_query($q);
		   		$kyberia->query("update user set user_mail=user_mail+1,mail_name='$user_name' where id='$mail_to_id_send'");
           	}
            return true;

		}
		else {
			global $error;
			$error="<font color='red'>Uzivatel $mail_to neexistuje!!!</font>";
			return false;
		}
	}

	function delete() {
	$delete=$_POST['delete'];
	global $user_id;
	global $kyberia;

	$delbetween=$_POST['delbetween'];
        if (!empty($delbetween)) {
                $max=max($delete);
                $min=min($delete);
                $q="delete from mail2 where mail_user='$user_id' and mail_id>'$min' and mail_id<'$max'";
		$kyberia->update($q);
        }

	else {
		foreach ($delete as $messagedel) {
		$q="delete from mail2 where mail_id='$messagedel' and  mail_user='$user_id'";
		$kyberia->query($q);
		}
	}
	}

	function deleteAll() {
		global $kyberia;
		global $user_id;

		$kyberia->update("delete from mail2 where mail_user='$user_id'");
	}
}