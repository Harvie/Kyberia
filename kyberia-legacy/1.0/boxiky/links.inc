<br><center><b>linky</b></center><br>
<?php
$q="SELECT distinct links.link_text as link_text,forum.forum_name as forum_name,user.login as user_name,user.id as user_id ,user.user_action_param_name as user_action_param_name,user_action_param_id as user_action_param_id,user.user_action as user_action,user.user_mode as user_mode  FROM links left join user on links.link_owner=user.id left join forum on links.link_forum=forum.forum_id";
$q.=" GROUP BY link_text ORDER BY link_id DESC LIMIT 50"; 

$set=$kyberia->query($q);

while ($set->next()) {
	$submissions=$set->getRecord();
	echo "<table class='bigitem'><tr><td class='icon'>";
	echo "<img alt='",$submissions['user_name'],"' src='/images/users/",strtolower($submissions['user_name']),".gif'>";	
	echo "</td><td class='item'>";
	echo "<table class='item'>";
	echo "<td class='header'>";
	echo "forum:&nbsp;&nbsp;<a href='?action=forum&forum_id=",$submissions['forum_id'],"'>",$submissions['forum_name'],"</a><br>";
	echo $submissions['user_name'];
	if ($submissions['user_mode']=="normal" AND ($submissions['user_action'])) {
		echo "&nbsp;[lokacia:<a class='location' href='?action=",$submissions['user_action'];
		if ($submissions['user_action']=="forum") echo "&forum_id=".$submissions['user_action_param_id']."'>",$submissions['user_action_param_name'];
		else echo "'>".$submissions['user_action'];
		echo "</a>]&nbsp;";
	}
	if ($user_id==$submissions['submission_owner'] or $forumset['forum_owner']==$user_id) {
		echo "&nbsp;&nbsp;&nbsp;&nbsp;<input class='delete' type=checkbox name=delete[] value='".$submissions['submission_id']."'>";
	}
	echo "</td>";
	echo "</tr>";
	echo "<tr class='content'><td class='content'><a href='",Stripslashes($submissions['link_text']),"'>",Stripslashes($submissions['link_text']),"</a></td></tr>";
	echo "</table>";
	echo "</td></tr></table>";
}

?>
