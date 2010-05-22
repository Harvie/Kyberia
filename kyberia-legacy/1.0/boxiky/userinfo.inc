<?php
if ($show=="karma") {

	$q="select submissions.*,user.login as user_name,forum.forum_name as forum_name from submissions left join forum on submissions.forum_id=forum.forum_id  left join user on submissions.submission_owner=user.id where submission_owner='".$node_id."' and submission_k>0";
	$q.=" ORDER BY submission_k desc";
	$set=$kyberia->query($q);

	while ($set->next()) {
		$submissions=$set->getRecord();
		echo "<table class='bigitem'><tr><td class='icon'>";
	//	$submissions['submission_text'] = preg_replace ("/<img src=(.*?)>/","obrazok: <a href=\\1>\\1</a>",$submissions['submission_text']); 
		echo "<img alt='",$submissions['user_name'],"' src='/images/users/",strtolower($submissions['user_name']),".gif'>";	
		echo "<center><font color='red'>",$submissions['submission_k']," K</font></center>";
		echo "</td><td class='item'>";
		echo "<table class='item'>";
		echo "<td class='header'>";
		echo "forum:&nbsp;&nbsp;<a href='?action=forum&node_id=",$submissions['forum_id'],"'>",$submissions['forum_name'],"</a><br>";
		echo $submissions['user_name'];
		if ($submissions['user_mode']=="normal" AND ($submissions['user_action'])) {
		 Showz::showLocation($submissions['user_action'],$submissions['user_action_id'],$submissions['user_action_name']);
		}
		Showz::showDate($submissions['submission_timestamp']);
	
		echo "</td>";
		echo "</tr>";
		echo "<tr class='content'><td class='content'>",Stripslashes($submissions['submission_text']),"</td></tr>";
		echo "</table>";
		echo "</td></tr></table>";
	}

	
}
elseif ($show=="submissions") {
	if (!$_GET['offset']) $offset=0;
	else $offset=$_GET['offset'];
	echo "<br><br><center><b>uzivatelove prispevky</b></center>";
	echo "<br><Br><center>";
	if ($offset) echo "<a href='".SCRIPT."?action=userinfo&node_id=$node_id&show=submissions&offset=".($offset-23)."'><<predchadzajuce</a>&nbsp;&nbsp;&nbsp;";
	echo "<a href='".SCRIPT."?action=userinfo&node_id=$node_id&show=submissions&offset=".($offset+23)."'>dalsi >></a>";
	echo "</center><br><br>";
	$q="select submissions.*,user.login as user_name,forum.forum_name as forum_name,forum.forum_public as forum_public from submissions left join forum on submissions.forum_id=forum.forum_id  left join user on submissions.submission_owner=user.id where forum_public='public' and submission_owner='".$node_id."' ";
	$q.=" ORDER BY submission_timestamp desc limit $offset,23";
	$set=$kyberia->query($q);

	while ($set->next()) {
		$submissions=$set->getRecord();
		echo "<table class='bigitem'><tr><td class='icon'>";
	//	$submissions['submission_text'] = preg_replace ("/<img src=(.*?)>/","obrazok: <a href=\\1>\\1</a>",$submissions['submission_text']); 
		echo "<img alt='",$submissions['user_name'],"' src='/images/users/",strtolower($submissions['user_name']),".gif'>";	
		echo "<center><font color='red'>",$submissions['submission_k']," K</font></center>";
		echo "</td><td class='item'>";
		echo "<table class='item'>";
		echo "<td class='header'>";
		echo "forum:&nbsp;&nbsp;<a href='?action=forum&node_id=",$submissions['forum_id'],"'>",$submissions['forum_name'],"</a><br>";
		echo $submissions['user_name'];
		if ($submissions['user_mode']=="normal" AND ($submissions['user_action'])) {
		 Showz::showLocation($submissions['user_action'],$submissions['user_action_id'],$submissions['user_action_name']);
		}
		Showz::showDate($submissions['submission_timestamp']);
	
		echo "</td>";
		echo "</tr>";
		echo "<tr class='content'><td class='content'>",Stripslashes($submissions['submission_text']),"</td></tr>";
		echo "</table>";
		echo "</td></tr></table>";
	}

	
}	
	

elseif ($show=="bookmarks") {
	echo "<br><br><center><b>uzivatelove kluby</b></center>";
	$q="SELECT * from forum WHERE forum.forum_owner='$node_id'";
	$q.=" order by forum_name ";
	$forumset=$kyberia->query($q);
	while ($forumset->next()) {
		echo "<br>&nbsp;&nbsp;&nbsp;&nbsp;<a href='?action=forum&node_id=",$forumset->getString('forum_id'),"'>",$forumset->getString('forum_name'),"</a>&nbsp;&nbsp;(".$forumset->getString('forum_submissions')."&nbsp;submissionz ";
		if ($forumset->getString('submission_count'))  echo "- <font color='red'>".$forumset->getString('submission_count')." NEW</font>";
		echo ")";
	}
	?>
	<br><br><center><b>uzivatelove bookmarknute kluby</b></center>
	<?php
	$q="SELECT user_forum.submission_count,user.login,forum.* from forum left join user on forum.forum_owner=user.id left join user_forum on (forum.forum_id=user_forum.forum_id and user_forum.user_id='$node_id')";
	$q.=" WHERE user_forum.user_bookmark='yes' and forum.forum_owner != '$node_id'";
	$q.=" order by forum_name ";
	$forumset=$kyberia->query($q);
	while ($forumset->next()) {
		echo "<br>&nbsp;&nbsp;&nbsp;&nbsp;<a href='?action=forum&node_id=",$forumset->getString('forum_id'),"'>",$forumset->getString('forum_name'),"</a>&nbsp;&nbsp;(".$forumset->getString('login')."&nbsp;&nbsp;::&nbsp;&nbsp;".$forumset->getString('forum_submissions')."&nbsp;submissionz ";
		if ($forumset->getString('submission_count'))  echo "- <font color='red'>".$forumset->getString('submission_count')." NEW</font>";
		echo ")";
	}
}


elseif($show=="friends") {
	$result=mysql_query("select session.user_action,session.user_action_id,session.user_action_name,friends.*,user.login as friend_name from friends left join user on user.id=friends.friend_id left join session on session.user_id=friends.friend_id where friends.user_id='$node_id'");

	while ($row=mysql_fetch_array($result)) {
		echo "<table class='bigitem'><tr><td class='icon'>";
		echo "<img alt='",$row['friend_name'],"' src='/images/users/",strtolower($row['friend_name']),".gif'>";	
		echo "</td><td class='item'>";
		echo "<table class='item'>";
		echo "<td class='header'><a href='?action=userinfo&node_id=",$row['friend_id'],"'>",$row['friend_name'],"</a>";
		if ($row['user_action']) {
			echo "&nbsp;[lokacia:<a class='location' href='?action=",$row['user_action'];
			if ($row['user_action']=="forum") echo "&node_id=".$row['user_action_id']."'>",$row['user_action_name'];
			else echo "'>".$row['user_action'];
			echo "</a>]&nbsp;";
		}
		echo "</td>";
		echo "</tr>";
		echo "<tr class='content'><td class='content'>",Stripslashes($row['friend_text']),"</td></tr>";
		echo "</table>";
		echo "</td></tr></table>";

	}

}
else {
	echo "<table width='100%' class='box'><tr><td>".$userinfo['user_info']."</td></tr></table><br>";
	$result=mysql_query("select session.user_action,session.user_action_id,session.user_action_name,friends.*,user.login as friend_name from friends left join user on user.id=friends.user_id left join session on session.user_id=friends.user_id where friend_id='$node_id'");
	
	while ($row=mysql_fetch_array($result)) {
		echo "<table class='bigitem'><tr><td class='icon'>";
		echo "<img alt='",$row['friend_name'],"' src='/images/users/",strtolower($row['friend_name']),".gif'>";	
		echo "</td><td class='item'>";
		echo "<table class='item'>";
		echo "<td class='header'><a href='?action=userinfo&node_id=",$row['user_id'],"'>",$row['friend_name'],"</a>";
		if ($row['user_action']) {
			echo "&nbsp;[lokacia:<a class='location' href='?action=",$row['user_action'];
			if ($row['user_action']=="forum") echo "&node_id=".$row['user_action_id']."'>",$row['user_action_name'];
			else echo "'>".$row['user_action'];
			echo "</a>]&nbsp;";
		}
		echo "</td>";
		echo "</tr>";
		echo "<tr class='content'><td class='content'>",Stripslashes($row['friend_text']),"</td></tr>";
		echo "</table>";
		echo "</td></tr></table>";

	}
}

?>
