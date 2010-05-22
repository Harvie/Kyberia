<?php

//echo "<br><br><br><br><b><center>some create same steel some are having wonderful anal sex in their beds with their pets.<br><br><br>\"posledne\" section stopped for temporary maintenance.</b></center>";



echo "<br><center><b>posledne pridane prispevky</b></center><br>";

$q="select last_submissions.*,user.login as user_name,forum.forum_name as forum_name from last_submissions left join forum on last_submissions.forum_id=forum.forum_id  left join user on last_submissions.submission_owner=user.id  ";
$q.=" ORDER BY submission_id DESC LIMIT 15"; 

$set=$kyberia->query($q);

while ($set->next()) {
	$submissions=$set->getRecord();
	echo "<table class='bigitem'><tr><td class='icon'>";
	$submissions['submission_text'] = preg_replace ("/<img src=(.*?)>/","obrazok: <a href=\\1>\\1</a>",$submissions['submission_text']); 
	echo "<img alt='",$submissions['user_name'],"' src='/images/users/",strtolower($submissions['user_name']),".gif'>";	
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



?>


