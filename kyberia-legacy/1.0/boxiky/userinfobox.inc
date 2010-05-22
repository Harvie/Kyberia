<?php 
//zoznam clankov
	if ($action=='article') {
		
		$set=$kyberia->query("select autor from articles where id_article='".$_GET['node_id']."'");
		$set->next();
		$autor_id=$set->getString('autor');


			$record=$kyberia->query("select * from user where id='$autor_id'"); 
			$record->next();
			$userinfo=$record->getRecord();
		
		
	}

	$q = "select user_name from session where user_id = '".$userinfo['id']."'";
	$result=$kyberia->query($q);
	if($result->getNumRows() > 0) define('ACTIVE', true);
	else define('ACTIVE', false);


	echo "<table width=100% class=box><tr><td colspan=2>";
	echo "<br><center> <img src='http://kyberia.sk/images/users/",$userinfo["login"],".gif' border=0></center>";
	echo "<br>id: <a href='".SCRIPT."?action=posta&mail_name=",$userinfo["login"],"'>",$userinfo["login"],"</a>";
	echo "<br>email:<a href=mailto:",$userinfo["email"],">",$userinfo["email"],"</a>";
	echo "<br>www:<a href=http://",$userinfo["user_www"],">",$userinfo["user_www"],"</a>";
	echo "<br>icq:".$userinfo["user_icq"];
	echo "<br>charisma:".$userinfo["charisma"];
	echo "<br>k!arma:".$userinfo["user_karma"];

	if($userinfo['id'] == '1') echo "<br><br><center>Ubik je Ubik</center><br>";
	elseif(ACTIVE) echo "<br><br>Uzivatel je on-line";
	else {
		if($userinfo['user_active'] != 'yes') echo "<center><br>Uzivatel caka na registraciu</center>";
		else
		{
			echo "<br><br>Uzivatel je off-line<br>";
			$u = $userinfo['last_click'];
			echo substr($u, 0, -3);
		}
	}
	echo "<br><br><center><a href='".SCRIPT."?action=journaux&dennik_user=$node_id'>denniky</a></center>";
	echo "<center><a href='".SCRIPT."?action=userinfo&node_id=$node_id&show=bookmarks'>bookmarky</a>";
	echo "<br><center><a href='".SCRIPT."?action=userinfo&node_id=$node_id&show=friends'>priatelia</a>";	
	echo "<br><center><a href='".SCRIPT."?action=userinfo&node_id=$node_id&show=karma'>karma</a>";
	echo "<br><center><a href='".SCRIPT."?action=userinfo&node_id=$node_id&show=submissions'>prispevky</a>";
		

?>
<br><br>
<?
if (!$autor_id) $autor_id=$node_id;
$kyberia->putAutorList($autor_id);
?>
<br><br>
<?

$kyberia->putDennikAutorList($autor_id);
?>
</td></tr></table>
