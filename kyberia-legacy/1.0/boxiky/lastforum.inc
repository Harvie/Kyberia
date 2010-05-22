<br><center><b>najnovsie kluby</b></center>
<?php

$q="SELECT user_forum.submission_count,user.login,forum.* from forum left join user on forum.forum_owner=user.id left join user_forum on (forum.forum_id=user_forum.forum_id and user_forum.user_id='$user_id')";
$q.=" where forum_public='public' or forum_public='moderated'";
$q.=" order by forum_id desc limit ";
if ($_GET['forum_offset']) $q.=$_GET['forum_offset'].",";
$q.="10 ";
$forumset=$kyberia->query($q);
while ($forumset->next()) {
	echo "<br><a href='?action=forum&node_id=",$forumset->getString('forum_id'),"'>",$forumset->getString('forum_name'),"</a><br>(".$forumset->getString('login')."&nbsp;&nbsp;::&nbsp;&nbsp;".$forumset->getString('forum_submissions')."&nbsp;submissionz ";
	if ($forumset->getString('submission_count'))  echo "- <font color='red'>".$forumset->getString('submission_count')." NEW</font>";
	echo ")<br>";
}
echo "<br><center><b>";
if ($_GET['forum_offset']>9) echo "<a href='".SCRIPT."?action=posledne&forum_offset=".($_GET['forum_offset']-10)."'><< previous &nbsp;&nbsp;</a>";
echo "<a href='".SCRIPT."?action=posledne&forum_offset=".($_GET['forum_offset']+10)."'>next >></a>";
echo "</b></center>";
?>
<br><br><center><b>najnovsie ankety</b></center>
<?php

$q="SELECT distinct polls.question,polls.forum_id from polls left join forum on forum.forum_id = polls.forum_id ";
$q.=" where forum.forum_public = 'public' order by id_poll desc limit 10 ";
$forumset=$kyberia->query($q);
while ($forumset->next()) {
	$question = strip_tags($forumset->getString('question'));
	echo "<br><a href='?action=forum&node_id=",$forumset->getString('forum_id'),"'>",$question,"</a><br>";
}

?>