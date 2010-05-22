<?php

switch ($_POST['event']) {
        case 'pridaj dennik':
                $status=eventz::addJournaux();
		if ($status) {
			Header("Location:".SCRIPT."?action=journaux");
		}

	break;

	case 'zmaz dennik':
                $status=eventz::deleteJournaux();
		if ($status) {
			Header("Location:".SCRIPT."?action=journaux");
		}

	break;
}

class eventz {

function addJournaux() {

	global $kyberia;
	global $user_id;
	global $user_name;
	$dennik_text=$_POST['dennik_text'];
	$type=$_POST['type'];
	$nadpis=$_POST['dennik_title'];
	$journaux_access=$_POST['journaux_access'];

	if (empty($nadpis)) {
		$error="musis zadat nazov denniku";
		return false;
	}

	elseif (empty($dennik_text)) {
		$error="dennik je prazdny";
		return false;
	}


	else {
			$dennik_text = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank' href=\"\\6\\7\">\\6\\7</a>",$dennik_text);
			$dennik_text=strip_tags($dennik_text,'<a><b><i><u><img><br><p><font>');
			$dennik_text=str_replace("\n","<br>",$dennik_text);
			$dennik_text=addslashes($dennik_text);

		$result=$kyberia->query("insert into dennik set autor='$user_id',zapis='$dennik_text',nadpis='$nadpis',datum=NOW(),type='$type'");
		$journaux_id=$kyberia->getLastInsertId();

		$q="select friends.* from friends where friend_id='$user_id'";
		$set=$kyberia->query($q);
		while($set->next()){
			$send_bin=$set->getString('send_mail');
			$u_id=$set->getString('user_id');
			$s_forum=floor($send_bin/2);
			$pp=$send_bin%2;
			$s_journaux=floor($pp/1);
			if ($s_journaux){
				$sprava="<b>".$user_name."</b> napisal novy dennik s nazvom <br>\"<a href='?action=journaux&node_id=$journaux_id' target='_blank'>".$nadpis."</a>\"";
				$kyberia->ubikMail($u_id,$sprava);

			}

		}

	}

	if (!empty($journaux_access) and $type=="private") {
		$access=explode(";",$journaux_access);
		foreach($access as $user_access) {
			$q="select id from user where login like '%$user_access%'";
			$set=$kyberia->query($q);
			$set->next();
			$access_id=$set->getString('id');
			if ($access_id) {
				$q="insert into node_access set user_id='$access_id',node_id='$journaux_id',node_type='journaux',access_type='access'";
				$kyberia->query($q);
			}
		}
	}


}

function deleteJournaux() {
	global $kyberia;
	global $user_id;
	global $user_name;
	$journaux_id=$_POST['journaux_id'];

	$kyberia->update("delete from dennik where autor='$user_id' and id='$journaux_id'");
}

}