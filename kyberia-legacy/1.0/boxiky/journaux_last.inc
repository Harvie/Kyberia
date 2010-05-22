<br><br><center><b>najnovsie denniky</b></center>
<?php
$q="SELECT user_discussion.submission_count as new,dennik.id as id,dennik.nadpis as nadpis,dennik.hits,dennik.prispevky,user.login from dennik left join user on dennik.autor=user.id left join user_discussion on user_discussion.discussion_id=dennik.id_diskuse";
$q.=" order by dennik.id  desc limit 10 ";
$forumset=$kyberia->query($q);
while ($forumset->next()) {
	echo "<center><a href='?action=journaux&dennik_id=",$forumset->getString('id'),"'>",$forumset->getString('nadpis'),"</a></center>::>".$forumset->getString('login')."<br>::".$forumset->getString('hits')."&nbsp;hitz ";
	echo "<br>::",$forumset->getString('prispevky'),"submissions";
	if ($forumset->getString('new')) echo "<br>::><font color='red'>".$forumset->getString('new')." NEW</font>";
	echo "<br><br>";
}
?>