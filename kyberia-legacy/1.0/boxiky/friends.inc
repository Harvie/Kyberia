<br>
<form method='post' action='?action=friends'>
meno: <input type='text' name='friend_name'><br>
<textarea name='friend_text'></textarea><br>
<input type='submit' name='event' value='pridaj priatela'><input type='submit' name='event' value='zmaz priatela'>
<br><br>Nastavenie pre vsetkych priatelov:<br>
<input type='submit' name='event' value='denniky'>
<input type='checkbox' name='journauxall' value='1' style='border : 0;width : 14;height : 14;'><br>
<input type='submit' name='event' value='kluby'>
<input type='checkbox' name='forumall' value='1' style='border : 0;width : 14;height : 14;'>
<br><br><br><input type='submit' name='event' value='zmen nastavenie'>
<?php
$result=mysql_query("select session.user_action,session.user_action_id,session.user_action_name,friends.*,user.login as friend_name from friends left join user on user.id=friends.friend_id left join session on session.user_id=friends.friend_id where friends.user_id='$user_id'");
$i=0;
while ($row=mysql_fetch_array($result)) {
	$send_bin=$row['send_mail'];
	$s_forum=floor($send_bin/2);
	$pp=$send_bin%2;
	$s_jornaux=floor($pp/1);
	$s_j=$s_jornaux=='1'?'checked':'';
	$s_f=$s_forum=='1'?'checked':'';

	echo "\n<table class='bigitem'><tr><td class='icon'>";
	echo "\n<img alt='",$row['friend_name'],"' src='/images/users/",strtolower($row['friend_name']),".gif'>";
	echo "</td><td class='item'>";
	echo "\n<table class='item'>";
	echo "\n<td class='header'><a href='?action=userinfo&node_id=",$row['friend_id'],"'>",$row['friend_name'],"</a>";
	if ($row['user_action']) {
		echo "&nbsp;[lokacia:<a class='location' href='?action=",$row['user_action'];
		if ($row['user_action']=="forum") echo "&node_id=".$row['user_action_id']."'>",$row['user_action_name'];
		else echo "'>".$row['user_action'];
		echo "</a>]&nbsp;";
	}
	echo "</td>";
	echo "</tr>";
	echo "\n<tr class='content'><td class='content'>",Stripslashes($row['friend_text']),"</td></tr>";
	echo "<tr><td>";
	echo "\n<table width='100%' bgcolor='#222222'><tr>";
	echo "\n<td><font size='-2'>Oznám nový denník:</font> <input type='checkbox' name='jornaux[]' value='".$i."_".$row['friend_id']."' style='border : 0;width : 14;height : 14;' ".$s_j."> </td>";
	echo "\n<td><font size='-2'>Oznám nové fórum:</font> <input type='checkbox' name='forum[]' value='".$i."_".$row['friend_id']."' style='border : 0;width : 14;height : 14;' ".$s_f."> </td>";
	echo "\n</tr></table>";
	echo "</td></tr>";
	echo "</table>";
	echo "</td></tr></table><br><br>";
	$i++;
}


?>
</form>