<?php

/*
define("HAPPY","UIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
define("LOVE","mam vas rad.majte ma radi");
define("DRUGGED","som na kasu, serte na mna");
define("ANGRY","23 stoporenych volskych kokotov do riti a kotvu do chrbta. vam vsetkym!");
define("DEPRESSED","ZABITE MAAAAAAAAAAAAAAAAAA");
*/

include_once("htmlparse.inc");
switch ($_POST['event']) {

        case 'poslat':

		//do not send a message when limit number is changed
		if ($user_amount!=$limit and empty($_POST['submission_text'])) {}

		else {

        	        $status=eventz::add();
			if ($status) {
				Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&nocache=".time());
			}
		}
	break;

	case 'odpovedat':
                $status=eventz::answer();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&nocache=".time());
		}
		break;

	case 'zmazat':
                $status=eventz::delete();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&nocache=".time());
		}
		break;

	case 'K!':
                $status=eventz::k();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&nocache=".time());
		}
		break;



	case 'zmaz forum':
		$status=eventz::forum_delete();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&nocache=".time());
		}
		break;

	case 'book':
		$status=eventz::forum_book();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&nocache=".time());
		}
		break;

	case 'unbook':
		$status=eventz::forum_unbook();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&nocache=".time());
		}
		break;

	case 'addPoll':
		$status=eventz::forum_addpoll();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&nocache=".time());
		}
		break;

	case 'op list':
		$status=eventz::addOperator();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&status=ok&nocache=".time());
		}
		break;

	case 'master list':
		$status=eventz::addMaster();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&status=ok&nocache=".time());
		}
		break;
	case 'access list':
		$status=eventz::addAccess();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&status=ok&nocache=".time());
		}
		break;


	case 'ban list':
		$status=eventz::banUser();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&status=ok&nocache=".time());
		}
		break;

	case 'nahlad':
		$status=eventz::nahlad();
		break;

	case 'zmen nastavenie':
		$status=eventz::forum_change();
		if ($status) {
			Header("Location:".SCRIPT."?action=forum&node_id=".$node_id."&nocache=".time());
		}
		break;


}

class eventz {

function k() {
	$k_amount=$_POST['k_amount'];
	global $user_id;
	$submission_id=$_POST['delete_name'][0];
	global $kyberia;
	global $error;

	if ($k_amount<-1) {
		$error="ale rydaj sa PREC tam kam siel hitler a diablov MEC ti odrazi hlavu ;) ale fakt nevymyslaj bravcoviny karle, oko bez viecka vidi vsecko ;)";
		return false;
	}
	if ($k_amount > 1) {
		$error = "mozes dat maximalne 1K prispevku";
		return false;
	}

	if (!$submission_id) {
		$set=$kyberia->query("select user_k from user where id='$user_id'");
		$set->next();
		$k_amount=$set->getString('user_k');
		$error="nezadal si prispevok ktoremu sa maju pridelit K.dnes ti zostava $k_amount K";
		return false;
	}

	if  (!$k_amount) {
		$set=$kyberia->query("select user_k from user where id='$user_id'");
		$set->next();
		$k_amount=$set->getString('user_k');
                $error="nezadal si pocet K ktore chces prispevku pridelit.dnes ti ostava $k_amount K";
                return false;
        }


	$q="select sum(k_amount) as amount from k_logs where donor_id='$user_id' and node_id='$submission_id' and node_type='submission'";
	$set=$kyberia->query($q);
	$set->next();
	$amount=$set->getInt('amount');

	if (abs($amount)>=1) {
		$error="tomuto prispevku uz si pridelil maximalny mozny pocet 1 K!";
		return false;
	}

	$set2=$kyberia->query("select submission_owner from submissions where submission_id='$submission_id'");
	$set2->next();
	$acceptor_id=$set2->getString('submission_owner');

	if ($acceptor_id == $user_id) {
		$error="egotrip?";
		return false;
	}

	$set3=$kyberia->query("select user_k from user where id='$user_id'");
	$set3->next();
	if ($set3->getInt('user_k') < abs($k_amount)) {
		$error="bohuzial dnes uz ti zostava ".$set3->getString('user_k')." K. zadel menej alebo pockaj do polnoci";
		return false;
	}

	$kyberia->query("update user set user_k=user_k-".abs($k_amount)." where id='$user_id'");
	$kyberia->query("update user set user_karma=user_karma+$k_amount where id='$acceptor_id'");
	$kyberia->query("update submissions set submission_k=submission_k+$k_amount where submission_id='$submission_id'");
	$kyberia->query("insert into k_logs set donor_id='$user_id',acceptor_id='$acceptor_id',k_amount='$k_amount',node_id='$submission_id',node_type='submission'");
	return true;


}


function nahlad() {
	global $user_name;
	global $user_mode_message;

	$submission_text=$_POST['submission_text'];
	$submission_text = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank' href=\"\\6\\7\">\\6\\7</a>",$submission_text);
	$submission_text=strip_tags($submission_text,'<a><b><i><u><img><br><p><font>');
	$submission_text=str_replace("\n","<br>",$submission_text);

	$nohtml=$_POST['nohtml'];
	if (!empty($nohtml)) {
                $submission_text=htmlspecialchars($submission_text);
        }


	if (empty($submission_text)) {
		global $error;
		$error="Nahlizet na NIC? take metafyzicke triky neskusaj";
		return false;
	}
	if (!htmlparse::htmlparse($submission_text)) {
		global $htmlparse;
		global $error;
		$error=$htmlparse;
		return false;
	}


	//adding mode message
	if (!empty($user_mode_message)) $submission_text.="<br><br>-->$user_mode_message<--";

	global $preview;
	$preview="<table class='bigitem'><tr><td class='icon'>";
        $preview.= "<img alt='".$user_name."' src='/images/users/".strtolower($user_name).".gif'>";
        $preview.= "</td><td class='item'>";
        $preview.= "<table class='item'>";
       $preview.="<td class='header'>".$user_name;
        $preview.="</td>";
        $preview.="</tr>";
        $preview.="<tr class='content'><td class='content'>".StripSlashes($submission_text)."</td></tr>";
        $preview.="</table>";
        $preview.="</td></tr></table>";
}

function add() {

	$submission_text=$_POST['submission_text'];
	global $forum;
	global $kyberia;
	global $user_id;
	global $node_id;
	global $user_status;
	global $user_mode_message;

	$nohtml=$_POST['nohtml'];
	if (!empty($nohtml)) {
                $submission_text=htmlspecialchars($submission_text);
        }


	$submission_text = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank' href=\"\\6\\7\">\\6\\7</a>",$submission_text);
	$submission_text=strip_tags($submission_text,'<a><b><i><u><img><br><p><font>');
	$submission_text=str_replace("\n","<br>",$submission_text);
	$submission_text=addslashes($submission_text);
	if (empty($submission_text)) {
		global $error;
		$error="Nic nenapises a predsa chces pridat prispevok? hovno hovno zlata rybka";
		return false;
	}

	if (!htmlparse::htmlparse($submission_text)) {
		global $htmlparse;
		global $error;
		$error=$htmlparse;
		return false;
	}

	//adding mode message
	if (!empty($user_mode_message)) $submission_text.="<br><br>-->$user_mode_message<--";


	$result=$kyberia->query("insert into submissions set forum_id='$node_id',submission_text='$submission_text',submission_owner='$user_id',submission_thread=submission_id,submission_timestamp=NOW()");
	$id=$kyberia->getLastInsertId();

	if ($forum['forum_public']!='private') {
		$result=$kyberia->query("insert into last_submissions set forum_id='$node_id',submission_text='$submission_text',submission_owner='$user_id',submission_id='$id',submission_thread=submission_id");
		$kyberia->query("update submissions set submission_thread=concat('$id','.') where submission_id='$id'");
	}

	$result=$kyberia->query("update forum set last_submission=NOW(), forum_submissions=forum_submissions+1 where forum_id='$node_id'");
	$q="update user_forum set submission_count=submission_count+1 where forum_id='$node_id'";
	$result=$kyberia->update($q);
//	$kyberia->substanceIt($user_name,$submission_text,$forumset['forum_name']);
	return true;
}

function answer() {

	$submission_text=$_POST['submission_text'];
	$submission_thread=$_POST['delete_name'][0];


	$nohtml=$_POST['nohtml'];
	if (!empty($nohtml)) {
                $submission_text=htmlspecialchars($submission_text);
        }

	global $kyberia;
	global $user_id;
	global $node_id;
	global $user_status;

	$submission_text = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank' href=\"\\6\\7\">\\6\\7</a>",$submission_text);
	$submission_text=strip_tags($submission_text,'<a><b><i><u><img><br><p><font>');
	$submission_text=str_replace("\n","<br>",$submission_text);

	//adding mode message
	if (!empty($user_mode_message)) $submission_text.="<br><br>-->$user_mode_message<--";

	$submission_text=addslashes($submission_text);

	$result=$kyberia->query("select submission_thread from submissions where submission_id='$submission_thread'");
	$result->next();
	$submission_thread=$result->getString('submission_thread');
	$result=$kyberia->query("insert into submissions set forum_id='$node_id',submission_text='$submission_text',submission_owner='$user_id',submission_thread='$submission_thread'");
	$id=$kyberia->getLastInsertId();
	$kyberia->query("update submissions set submission_thread=concat(submission_thread,'.','$id') where submission_id='$id'");
//	echo "insert into submissions set forum_id='$node_id',submission_text='$submission_text',submission_owner='$user_id',submission_thread=concat('$submission_thread','.')";
	$result=$kyberia->query("update forum set last_submission=NOW(),forum_submissions=forum_submissions+1 where forum_id='$node_id'");
$q="update user_forum set submission_count=submission_count+1 where forum_id='$node_id'";
	$result=$kyberia->update($q);
//	$kyberia->substanceIt($user_name,$submission_text,$forumset['forum_name']);
	return true;
}

function delete() {
	global $error;
	global $kyberia;
	global $delete_name;
	$delete_time=$_POST['delete_time'];
	global $user_id;
	global $node_id;
	global $forumset;
	global $access_type;
	$forum_owner=$forumset->getInt('forum_owner');
	$delbetween=$_POST['delbetween'];

	$q = "select user_id, access_type from node_access where node_id = '$node_id'";
	$access = $kyberia->query($q);
	if($access->getNumRows() > 0)
	{
		$master_id = 0;
		$op_id = 0;
		while($access->next())
		{
			if($access->getString('access_type') == 'master')
			{
				$master_list[$master_id] = $access->getString('user_id');
				$master_id++;
			}
			if($access->getString('access_type') == 'op')
			{
				$op_list[$op_id] = $access->getString('user_id');
				$op_id++;
			}
		}
	}

	foreach ($delete_name as $submissiondel) {
		$sub = $kyberia->query("select * from submissions where submission_id='$submissiondel'");
		$sub->next();

		if ($user_id == $forum_owner || $user_id == $sub->getInt("submission_owner") || $access_type == 'master' || $access_type == 'op') {
			if($user_id == $sub->getInt("submission_owner")) define("DELETE", true);
			elseif($user_id == $forum_owner) define("DELETE", true);
			elseif($access_type == 'master' && !in_array($sub->getString("submission_owner"), $master_list) && $sub->getString("submission_owner") != $forum_owner) define("DELETE", true);
			elseif($access_type == 'op' && !in_array($sub->getString("submission_owner"), $master_list) && !in_array($sub->getString("submission_owner"), $op_list) && ($sub->getString("submission_owner") != $forum_owner)) define("DELETE", true);
			else define("DELETE", false);
			if (DELETE)
			{
				$kyberia->update("delete from submissions where submission_id='$submissiondel'");
				$kyberia->update("delete from last_submissions where submission_id='$submissiondel'");
				$kyberia->update("update forum set forum_submissions=forum_submissions-1 where forum_id='$node_id'");
				$kyberia->update("update user_forum set submission_count=submission_count-1 where forum_id='$node_id' and last_visit<'".$delete_time[$submissiondel]."'");
			}

		}

		/* old one
		$result=false;
		$q="delete from submissions where submission_id='$submissiondel' and submission_owner='$user_id'";
		$result=$kyberia->update($q);
		$q="delete from last_submissions where submission_id='$submissiondel' and submission_owner='$user_id'";

		$result=$kyberia->update($q);

		if (!$result and $user_id==38) {
			$q="delete from submissions where submission_id='$submissiondel'";
			$result=$kyberia->update($q);
			$q="delete from last_submissions where submission_id='$submissiondel'";
			$result=$kyberia->update($q);

		}
		elseif (!$result) {
			$set=$kyberia->query("select forum.forum_owner from submissions left join forum on forum.forum_id=submissions.forum_id where submission_id='$submissiondel'");
			if ($set->getString('forum_owner')==$forum_owner) {
				$result=$kyberia->update("delete from submissions where submission_id='$submissiondel'");
				$result=$kyberia->update("delete from last_submissions where submission_id='$submissiondel'");
			}
		}

		if ($result) {
			$kyberia->query("update forum set forum_submissions=forum_submissions-1 where forum_id='$node_id'");
			$q="update user_forum set submission_count=submission_count-1 where forum_id='$node_id' and last_visit<'".$delete_time[$submissiondel]."'";
			$kyberia->query($q);

		}

		else { global $error; $error.="spravu id:$submissiondel sa nepodarilo zmazat.nemas na to pravo, kravo!<br>"; }
		*/
	}
	return true;
}

function forum_book() {
	global $error;
	global $kyberia;
	global $delete_name;
	global $delete_time;
	global $user_id;
	global $node_id;
	$q="update user_forum set user_bookmark='yes' where user_id='$user_id' and forum_id='$node_id'";

	$kyberia->query($q);
	return true;

}

function forum_unbook() {
	global $error;
	global $kyberia;
	global $delete_name;
	global $delete_time;
	global $user_id;
	global $node_id;
	$q="update user_forum set user_bookmark='no' where user_id='$user_id' and forum_id='$node_id'";

	$kyberia->query($q);
	return true;
}

function forum_delete() {
	global $error;
	global $kyberia;
	global $delete_name;
	global $delete_time;
	global $user_id;
	global $forum;
	$forumdel=$_POST['node_id'];

	// prec s nim, h4ck3r0m
	if ($user_id != 38 && $forum['forum_owner'] != $user_id)
		return;

	if ($user_id==38) $kyberia->query("delete from forum where forum_id='$forumdel'");
	$kyberia->query("delete from forum where forum_id='$forumdel' and (forum_owner='$user_id')");
	$kyberia->query("delete from submissions where forum_id='$forumdel'");
	$kyberia->query("update category set category_forums=category_forums-1 where category_id='".$forum['forum_category']."'");
}

function forum_change() {
	global $error;
	global $kyberia;
	global $user_id;
	global $node_id;
	global $user_name;
	global $forum;
	global $access_type;

	$forum_name=$_POST['forum_name'];
	$forum_icon_name=$_FILES['forum_icon']['name'];
	$forum_icon=$_FILES['forum_icon']['tmp_name'];
	$forum_info=$_POST['forum_info'];
	$forum_public=$_POST['forum_public'];
	$forum_owner=$_POST['forum_owner'];
	$forum_category=$_POST['forum_category'];

	// taky voblud tu nema co robit
	if ($user_id != $forum['forum_owner'] && $access_type != 'master' && $access_type != 'op')
		return true;

	if ($forum_owner==$user_name) $owner_id=$user_id;
	else {
		$userset=$kyberia->query("select id from user where login='$forum_owner'");
		if (!$userset->getNumRows()) {
			$error="Neexistuje uzivatel $forum_owner ";
			return false;
		}
		else {
			$userset->next();
			$owner_id=$userset->getString('id');
		}
	}

	// toto moze iba owner
	if ($user_id == $forum['forum_owner']) {
		$q="UPDATE forum set forum_public='$forum_public' , forum_category='$forum_category',forum_name='$forum_name',forum_owner='$owner_id' where forum_id='$node_id' and forum_owner='$user_id'";
		$kyberia->query($q);
	}

	// zmena popisu fora
	$forum_info=strip_tags($forum_info,'<font><a><b><i><u><img><br><p><h1><h2><h3><center>');
	if ($forum_info) {
		$kyberia->query("update forum_info set forum_info='$forum_info' where forum_id='$node_id'");
	}
//	elseif ($forum_info and !$forum['forum_info']) $kyberia->query("insert into forum_info set forum_info='$forum_info',forum_id='$node_id'");
	$icondir="/home/hromi1/kyberia/images/forums/";
	$cmd=0;
	if (strstr($forum_icon_name,".jpg") || strstr($forum_icon_name,".jpeg") ){
		$cmd="/home/utils/netpbm/bin/jpegtopnm $forum_icon | /home/utils/netpbm/bin/pnmscale -width=123 | /home/utils/netpbm/bin/ppmquant 256 | /home/utils/netpbm/bin/ppmtogif > ".ICONDIR_FORUM.strtolower($node_id).".gif";

	}
	elseif (strstr($forum_icon_name,".gif")) {
		$cmd="/home/hromi1/kyberia/gifsicle --resize 123x_ $forum_icon > ".ICONDIR_FORUM.strtolower($node_id).".gif";
	}

	if ($cmd) shell_exec($cmd);

	// toto by mohlo ist do paze, nie?
	$set=$kyberia->query("SELECT forum_info.forum_info as forum_info,user.id as user_id,user.login as login,forum.*,category.category_name as category_name from forum left join category on category.category_id=forum.forum_category left join user on forum_owner=user.id left join forum_info on forum_info.forum_id=forum.forum_id where forum.forum_id='$node_id'");
	$set->next();
	$forum=$set->getRecord();

	return true;
}

function forum_addpoll() {
	global $access_type;
	global $forum;
	global $user_id;

	// ee
	if (($forum['forum_owner'] != $user_id) && ($access_type != "op") &&
($access_type != "master"))
		return;

	$question=$_POST['question'];
	$response=$_POST['response'];
	$node_id=$_POST['node_id'];
	global $kyberia;

	$question = strip_tags($question);
	$kyberia->query("insert into polls set question='$question',forum_id='$node_id'");
	$id=$kyberia->getLastInsertId();

	foreach ($response as $value) {

		if (empty($value)) break;
		$kyberia->query("insert into poll_options set text='$value',id_poll='$id',number='0'");
	}


}

function addMaster() {
	global $error;
	global $kyberia;
	global $user_id;
	global $forum;

	if ($forum['forum_owner'] != $user_id)
		return false;

	$admins=$_POST['masterlist'];
	$node_id=$_POST['node_id'];
	$array=explode(";",$admins);
        if (!Is_array($array)) {
                $error="nezadal si ziadne mena";
        }

	$kyberia->query("delete from node_access where node_id='$node_id' and node_type='forum' and access_type='master'");

	foreach($array as $owner) {
			if (!trim($owner))
				continue;

			$q="select id from user where login='$owner'";
			$set=$kyberia->query($q);
			$set->next();
			$access_id=$set->getString('id');
			if ($access_id) {
				$q="insert into node_access set user_id='$access_id',node_id='$node_id',node_type='forum',access_type='master'";
				$kyberia->query($q);
			}

			else $error.="Neexistuje uzivatel $owner.<br>";
	}

	if (!empty($error)) return false;
	else return true;
}



function addAccess() {
	global $error;
	global $kyberia;
	global $user_id;
	global $forum;

	// ee
	if ($forum['forum_owner'] != $user_id)
		return;

	$admins=$_POST['accesslist'];
	$node_id=$_POST['node_id'];
	$array=explode(";",$admins);
        if (!Is_array($array)) {
                $error="nezadal si ziadne mena";
        }

	$kyberia->query("delete from node_access where node_id='$node_id' and node_type='forum' and access_type='access'");

	foreach($array as $owner) {
			if (!trim($owner))
				continue;

			$q="select id from user where login='$owner'";
			$set=$kyberia->query($q);
			$set->next();
			$access_id=$set->getString('id');
			if ($access_id) {
				$q="insert into node_access set user_id='$access_id',node_id='$node_id',node_type='forum',access_type='access'";
				$kyberia->query($q);
			}

			else $error.="Neexistuje uzivatel $owner.<br>";
	}

	if (!empty($error)) return false;
	else return true;
}



function addOperator() {
	global $error;
	global $kyberia;
	global $user_id;
	global $forum;
	global $access_type;

	if ($forum['forum_owner'] != $user_id && $access_type != 'master')
		return;

	$admins=$_POST['oplist'];
	$node_id=$_POST['node_id'];
	$array=explode(";",$admins);
        if (!Is_array($array)) {
                $error="nezadal si ziadne mena";
        }

	$kyberia->query("delete from node_access where node_id='$node_id' and node_type='forum' and access_type='op'");

	foreach($array as $owner) {
			if (!trim($owner))
				continue;

			$q="select id from user where login='$owner'";

			$set=$kyberia->query($q);
			$set->next();
			$access_id=$set->getString('id');
			if ($access_id) {
				$q="insert into node_access set user_id='$access_id',node_id='$node_id',node_type='forum',access_type='op'";

				$kyberia->query($q);
			}

			else $error.="Neexistuje uzivatel $owner.<br>";
	}

	if (!empty($error)) return false;
	else return true;
}


function banUser() {
	global $error;
	global $kyberia;
	global $forum;
	global $user_id;
	global $access_type;

	// ee
	if ($forum['forum_owner'] != $user_id && $access_type != 'master' && $access_type != 'op')
		return false;

	$admins=$_POST['banlist'];
        if (empty($admins)) {
                $error="nezadal si ziadne mena";
        }

	$node_id=$_POST['node_id'];
	$array=explode(";",$admins);

	$kyberia->query("delete from node_access where node_id='$node_id' and node_type='forum' and access_type='ban'");

	foreach($array as $owner) {
			if (!trim($owner))
				continue;

			$q="select id from user where login='$owner'";
			$set=$kyberia->query($q);
			$set->next();
			$access_id=$set->getString('id');
			if ($access_id) {
				$q="insert into node_access set user_id='$access_id',node_id='$node_id',node_type='forum',access_type='ban'";
				$kyberia->query($q);
			}

			else $error.="Neexistuje uzivatel $owner.<br>";
	}

	if (!empty($error)) return false;
	else return true;
}



}

