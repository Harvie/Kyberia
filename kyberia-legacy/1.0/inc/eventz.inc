<?php
switch ($_POST['event']) {
        case 'pridaj priatela':
                $status=eventz::addfriend();
		if ($status) {
			Header("Location:".ACTION_SCRIPT."friends");		
		}
                else echo $error;
		break;

}

class eventz {

function addfriend() {
	global $kyberia;
	global $user_id;
	$friend_text=$_POST['friend_text'];
	$friend_name=$_POST['friend_name'];

	$q="select id from user where login='$friend_name'";
	$result=$kyberia->query($q);
	$result->next();
	$friend=$result->getRecord();
	$friend_id=$friend['id'];

	if ($friend_id==$user_id) {
		global $error;
		$error="egotrip?";
		return false;
	}

	elseif ($friend_id) {
		$friend_text=strip_tags($friend_text,'<a><b><i><u><img><br><p><font>');
		$friend_text=str_replace("\n","<br>",$friend_text);
		$friend_text = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a href=\"\\6\\7\">\\6\\7</a>",$friend_text);
		$friend_text=addslashes($friend_text);
		$q="insert into friends set user_id='$user_id',friend_text='$friend_text',friend_id='$friend_id'";
		$result=mysql_query($q);
		$kyberia->ubikMail($friend_id,"Uzivatel $user_name si ta pridal medzi priatelov s textom: $friend_text");
	}

	else {
		global $error;
		$error="Uzivatel neexistuje!";
		return false;
	}
}


}
