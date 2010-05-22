<?
switch ($_POST['event']) {
        case 'pridaj.forum':
                $status=eventz::addForum();
		if ($status) {
			Header("Location:".ACTION_SCRIPT."forum");
		}
                else echo $error;
		break;

}

class eventz {

	function addForum() {
		$forum_public=$_POST['forum_public'];
		$forum_type=$_POST['forum_type'];
		$forum_info=$_POST['forum_info'];

		if (empty($forum_name)) {
			$error="nazov fora je prilis kratky!!!!";
			return false;
		}

		$set=$kyberia->query("INSERT INTO forum set forum_name='$forum_name',forum_category='$forum_category',forum_owner='$user_id',forum_public='$forum_public',forum_type='$forum_type'");
		$lastid=$kyberia->getLastInsertId();
		$kyberia->query("insert into forum_info set forum_id='$lastid',forum_info='$forum_info'");
		$kyberia->query("update category set category_forums=category_forums+1 where category_id='$forum_category'");
		$icondir="/home/hromi1/kyberia/images/forums/";
		$cmd=0;
		if (strstr($forum_icon_name,".jp")){
			$cmd=NETPBM."/jpegtopnm $forum_icon | ".NETPBM."/pnmscale -width=123 | ".NETPBM."/ppmquant 256 | ".NETPBM."/ppmtogif > ".FORUM_IMAGE_DIR.strtolower($lastid).".gif";

		}
		elseif (strstr($forum_icon_name,".gif")) {
			$cmd="/home/hromi1/kyberia/gifsicle --resize 123x_ $forum_icon > ".FORUM_IMAGE_DIR.strtolower($lastid).".gif";
		}
		if ($cmd) shell_exec($cmd);
		$forum_id=$lastid;

		$q="select friends.* from friends where friend_id='$user_id'";
		$set=$kyberia->query($q);
		while($set->next()){
			$send_bin=$set->getString('send_mail');
			$u_id=$set->getString('user_id');
			$s_forum=floor($send_bin/2);
			echo $send_bin."<br>";
			echo $s_forum."<br>";

			if ($s_forum){
				$sprava="<b>".$user_name."</b> vytvoril novy klub s nazvom <br>\"<a href='?action=forum&node_id=$forum_id' target='_blank'>".$nadpis."</a>\"";
				$kyberia->ubikMail($u_id,$sprava);
			}
		}

	}
}

?>