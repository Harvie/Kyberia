<?
include_once("htmlparse.inc");
switch ($_POST['event']) {

	case 'pridaj.forum' :
		$status=eventz::addForum();
        	if ($status) {
            	    Header("Location:".SCRIPT."?action=forum&node_id=$status&nocache=".time());
                }
	break;
}

class eventz {

	function addForum() {
		global $kyberia;
		global $user_id;
		global $user_name;
		global $forum_icon_name;
		global $forum_icon;
		$forum_public=$_POST['forum_public'];

		$forum_category=$_POST['forum_category'];
		$forum_type=$_POST['forum_type'];
		$forum_info=$_POST['forum_info'];
		$forum_name=$_POST['forum_name'];

		if (empty($forum_name)) {
			$error="nazov fora je prilis kratky!!!!";
			return false;
		}

	        if (!htmlparse::htmlparse($forum_name)) {
        	        global $htmlparse;
	                global $error;
	                $error=$htmlparse;
	                return false;
	        }


	        if (!htmlparse::htmlparse($forum_info)) {
        	        global $htmlparse;
	                global $error;
	                $error=$htmlparse;
	                return false;
	        }




		$set=$kyberia->query("INSERT INTO forum set forum_name='$forum_name',forum_category='$forum_category',forum_owner='$user_id',forum_public='$forum_public',forum_type='$forum_type'");
		$lastid=$kyberia->getLastInsertId();
		$kyberia->query("insert into forum_info set forum_id='$lastid',forum_info='$forum_info'");
		$kyberia->query("update category set category_forums=category_forums+1 where category_id='$forum_category'");

		$q="select friends.* from friends where friend_id='$user_id'";
		$set=$kyberia->query($q);
		while($set->next()){
			$send_bin=$set->getString('send_mail');
			$u_id=$set->getString('user_id');
			$s_forum=floor($send_bin/2);

			if (($s_forum)&&(!$check)){
			$check[$u_id]=1;
				$sprava="<b>".$user_name."</b> vytvoril novy klub s nazvom <br>\"<a href='?action=forum&node_id=$lastid' target='_blank'>".$forum_name."</a>\"";
				$kyberia->ubikMail($u_id,$sprava);
			}
		}

		$cmd=0;
		if (strstr($forum_icon_name,".jp")){
			$cmd=NETPBM."/jpegtopnm $forum_icon | ".NETPBM."/pnmscale -width=123 | ".NETPBM."/ppmquant 256 | ".NETPBM."/ppmtogif > ".ICONDIR_FORUM.strtolower($lastid).".gif";

		}
		elseif (strstr($forum_icon_name,".gif")) {
			$cmd=GIFSICLE." --resize 123x_ $forum_icon > ".ICONDIR_FORUM.strtolower($lastid).".gif";
		}

		if ($cmd) shell_exec($cmd);
		return $lastid;
	}
}

?>