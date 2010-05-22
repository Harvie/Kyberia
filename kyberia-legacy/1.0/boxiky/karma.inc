<?php
echo "<br><center><b>najohodnotenejsie prispevky za poslednych 24 hodin</b></center><br>";

echo "Kazdy den o polnoci bude kazdemu userovi pridane 3 K. Tieto K moze uzivatel pridelovat jednotlivym prispevkom (zaklikne
\"mazaci\" stvorcek pri prispevku) a stlaci K!. Jednemu
prispevku moze kazdy uzivatel celkovo pridelit maximalne 1 K. Cely system sluzi na \"zvecnovanie\" kvalitnejsich prispevkov
v kope balastu.<br><br>";

if ($_GET['offset']) $offset=$_GET['offset'];
else $offset=0;
if ($_GET['karma']) $karma=$_GET['karma'];
else $karma='good';

if($karma=='good') {
	$q="select submissions.*,user.login as user_name,forum.forum_name as forum_name from submissions left join forum on submissions.forum_id=forum.forum_id  left join user on submissions.submission_owner=user.id where unix_timestamp(submissions.submission_timestamp)>(unix_timestamp(NOW())-84400) and submissions.submission_k>0";
	$q.=" ORDER BY submission_k DESC LIMIT $offset,23";
}

//do not discriminate bad guys with evil karma ;)
elseif($karma=='bad') {
	$q="select submissions.*,user.login as user_name,forum.forum_name as forum_name from submissions left join forum on submissions.forum_id=forum.forum_id  left join user on submissions.submission_owner=user.id where unix_timestamp(submissions.submission_timestamp)>(unix_timestamp(NOW())-84400) and submissions.submission_k>0";
	$q.=" ORDER BY submission_k asc LIMIT $offset,23";
}
$set=$kyberia->query($q);

$next_offset=$offset+23;
$prev_offset=$offset-23;

echo "<center><b>";
if ($offset) echo "<a href='?action=karma&karma=$karma&offset=$prev_offset'><< predchádzajúúuuuuuuui&nbsp;&nbsp;&nbsp;&nbsp;</a>";
echo "<a href='?action=karma&karma=$karma&offset=$next_offset'>ïalšie >></a>";
echo "</center></b><br><br>";

while ($set->next()) {
	$submissions=$set->getRecord();
	if (($submissions['submission_k'])>'1'){
		echo "<table class='bigitem'><tr><td class='icon'>";
	//	$submissions['submission_text'] = preg_replace ("/<img src=(.*?)>/","obrazok: <a href=\\1>\\1</a>",	$submissions['submission_text']);
		echo "<img alt='",$submissions['user_name'],"' src='/images/users/",strtolower($submissions['user_name']),".gif'>";
		echo "<center><font color='red'>",$submissions['submission_k']," K</font></center>";
		echo "</td><td class='item'>";
		echo "<table class='item'>";
		echo "<td class='header'>";
		echo "forum:&nbsp;&nbsp;<a href='?action=forum&node_id=",$submissions['forum_id'],"'>",$submissions['forum_name'],"</a>	<br>";
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



?>
