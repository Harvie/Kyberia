<?php
if ($_POST['type']=='forum') {
echo "<br><center><b>na.na.na.siel[siel{siel}] som tieto fora</b></center>";
$q="SELECT forum_info.forum_info,user_forum.submission_count,user.login,forum.* from forum left join forum_info on forum_info.forum_id=forum.forum_id left join user on forum.forum_owner=user.id left join user_forum on (forum.forum_id=user_forum.forum_id and user_forum.user_id='$user_id')";
$q.=" where (forum_name like '%$query%' or forum_info like '%$query%')";
$q.=" order by forum_id desc ";
$forumset=$kyberia->query($q);
while ($forumset->next()) {
	echo "<br><a href='?action=forum&node_id=",$forumset->getString('forum_id'),"'>",$forumset->getString('forum_name'),"</a><br>(".$forumset->getString('login')."&nbsp;&nbsp;::&nbsp;&nbsp;".$forumset->getString('forum_submissions')."&nbsp;submissionz ";
	if ($forumset->getString('submission_count'))  echo "- <font color='red'>".$forumset->getString('submission_count')." NEW</font>";
	echo ")<br>";
}
}

elseif ($_POST['type']=='user') {
$q="SELECT * from user";
$q.=" where login like '%$query%'";
$q.=" order by login";
$forumset=$kyberia->query($q);
echo "<br><center><b>na.na.na.siel[siel{siel}] som tychto u.u.uzivatelov</b></center>";
while ($forumset->next()) {
	echo "<br><a href='?action=userinfo&node_id=",$forumset->getString('id'),"'>",$forumset->getString('login'),"</a>";
}
}

elseif ($_POST['type']=='journaux') {
$q="SELECT dennik.*,user.login from dennik left join user on user.id=dennik.autor";
$q.=" where nadpis like '%$query%'";
$q.=" order by id desc";
$dennikset1=$kyberia->query($q);
if ($dennikset1->getNumRows()) {
	echo "<br><center><b>\"$query\" sa vyskytuje v nadpisoch tychto dennikov</b></center>";
	while ($dennikset1->next()) {
		echo "<br><a href='?action=journaux&node_id=",$dennikset1->getString('id'),"'>",$dennikset1->getString('nadpis'),"</a> (",$dennikset1->getString('login')," :: ",$dennikset1->getString('hits')," hitz )";
	}
}

$q="SELECT dennik.*,user.login from dennik left join user on user.id=dennik.autor";
$q.=" where zapis like '%$query%'";
$q.=" order by id desc";

$dennikset2=$kyberia->query($q);
if ($dennikset2->getNumRows()) {
	echo "<br><center><b>\"$query\" sa vyskytuje v texte tychto dennikov</b></center>";
	while ($dennikset2->next()) {
		echo "<br><a href='?action=journaux&node_id=",$dennikset2->getString('id'),"'>",$dennikset2->getString('nadpis'),"</a> (",$dennikset2->getString('login')," :: ",$dennikset2->getString('hits')," hitz )";
	}
}

}

if ($_POST['type']=='article') {
if ($query=="") echo "<center><br>Nezadali ste ziadne slovo na vyhladavanie!!<br><br><br></center>"; 
else { $clanky=$kyberia->Search($query);
	if ($clanky->_numRows==0) echo "<br><center><br>Zadane slovo $query sa nevyskytuje v ziadnom clanku!</center><br>";
	else {
	echo "<br><center><br>Slovo $query sa vyskytuje v ",$clanky->_numRows,". clankoch!<br><br></center>";
	while ($clanky->next()) { 
	echo "<table cellpadding=5 width=100% class=box>";
	echo "<tr><td><img src='";
	if ($clanky->getString('title_image')=="") echo "/images/rubriky/",$kyberia->putTitleImage($clanky->getInt("id_rubrika"));	
	else echo $kyberia->TitleImageDir.$clanky->getString('title_image');
	echo "' hspace=5 vspace=5 align=left>";
	echo "<a class=nazev href='".SCRIPT."?action=article&id=",$clanky->getString("id_article"),"'>",$clanky->getString('nazov'),"</a><br>";
	echo $clanky->getString('short_desc');
	echo "</td></tr></table><br>";
	}
	}
}
}
?>