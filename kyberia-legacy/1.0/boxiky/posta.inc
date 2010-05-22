<?php
        // navigacia! sofistikovana bitch

        if ($limit) $limit=$limit;
	else $limit=$user_amount;

         if (empty($offset)) $offset=0;
        if ($event=='>') $offset+=$limit;
        if ($event=='<') $offset-=$limit;
        if ($event=='<<') $offset='0';
        if ($event=='>>') $offset=$count-$limit;
        if ($offset<0) $offset=0;
        if ($offset+$limit>$count AND $limit<$count) $offset=$count-$limit;
       elseif ($offset+$limit>$count AND $limit>$count) $offset=0;
        // koniec sofistikovanej bitch


if ($user_mail>0) {
	$kyberia->query("update user set user_mail='0' where id=$user_id");
 	$set=$kyberia->query("select * from mail2 where mail_to='$user_id' and mail_read='no'");
    while($set->next()) {
    	$kyberia->query("update mail2 set mail_read='yes' where mail_id='".$set->getString('mail_duplicate_id')."'");
	}
}

$q="select date_format(mail2.mail_timestamp,\"%e.%c. %k:%i:%s\") as cas ,locationfrom.user_action as locationfrom_action,locationfrom.user_action_name
as locationfrom_action_name,locationfrom.user_action_id as locationfrom_action_id,locationto.user_action
as locationto_action,locationto.user_action_name as locationto_action_name,locationto.user_action_id
as locationto_action_id,userto.login as mail_to_name,userfrom.login as mail_from_name,locationfrom.user_name,mail2.* from mail2 left join user as userfrom on mail_from=userfrom.id left join user as userto on mail_to=userto.id left join session as locationto on mail_to=locationto.user_id left join session as locationfrom on mail_from=locationfrom.user_id ";
$q.="where mail_user='$user_id' ";

if ($event=="hladat") $q.=" and (mail_text like '%$mail_text%') ";

if (is_numeric($_GET['from'])) {
	$q .= " and (mail_from={$_GET[from]} || mail_to={$_GET[from]}) ";
}

$q.="order by mail_id desc limit $offset,$limit";
$result=$kyberia->query($q);

if ($_GET['mail_name']) $mail_name=$_GET['mail_name'];
?>
<form name='posta' action='' method='post'>
<table><tr>
<td valign='top'>
<img src="/images/users/<?=$mail_name;?>.gif" name="fricon" border='0'><br>
<input type="text" class='textinput' value="<?=$mail_name?>" name="mail_to" size="8" onmouseout="vymena()">
<br>
</td>
<td valign='top'><textarea style="width:510pt; height: 50pt;" name='mail_text' cols='66' rows='8'><?=$mail_text?></textarea>
<br clear='all'>
<?php Showz::showNav(); ?>
<br>
Zobrazit iba od: <input type="text" size="15" name="mail_from"> <input type="submit" value="filtrovat" name="event"><br>
<input type="submit" name="event" value="vymaz vsetko" style="width: 100px" onClick="return confirm('Chces si naozaj vymazat celu post?')">
</td>

</tr>
<?php
/* showing mail */

while ($result->next()) {
	$mail=$result->getRecord();
	echo "<table class='bigitem'>";
	echo "<tr><td class='icon'>";
	echo "<img alt='",$mail['mail_from_name'],"' src='/images/users/",strtolower($mail['mail_from_name']),".gif'>";
	echo "</td>";
	echo "<td class='item'><table class='item'><tr class='header'>";
	echo "<td class='header'><a href=\"javascript:chngto('",$mail['mail_from_name'],"')\">",$mail['mail_from_name'],"</a>";
	//if (!empty($mail['locationfrom_action']) && $mail['mail_from']!=$user_id) Showz::showLocation($mail['locationfrom_action'],$mail['locationfrom_action_id'],$mail['locationfrom_action_name']);
    if ($mail['mail_from']!=$user_id AND ($mail['locationfrom_action'])) {
			echo "&nbsp;[lokacia:<a class='location' href='?action=",$mail['locationfrom_action'];
			if ($mail['locationfrom_action']=="forum" OR $mail['locationfrom_action']=="journaux" OR $mail['locationfrom_action']=="article") echo "&node_id=".$mail['locationfrom_action_id']."'>",$mail['locationfrom_action_name'];
			else echo "'>".$mail['locationfrom_action'];
			echo "</a>]&nbsp;";
	}
    echo "&nbsp;&nbsp;-->&nbsp;&nbsp;<a href=\"javascript:chngto('",$mail['mail_to_name'],"')\">",$mail['mail_to_name'],"</a>";

	//if (!empty($mail['locationto_action']) && $mail['mail_to']!=$user_id) Showz::showLocation($mail['locationto_action'],$mail['locationto_action_id'],$mail['locationto_action_name']);
    if ($mail['mail_to']!=$user_id AND ($mail['locationto_action'])) {
		echo "&nbsp;[lokacia:<a class='location' href='?action=",$mail['locationto_action'];
		if ($mail['locationto_action']=="forum" OR $mail['locationto_action']=="journaux" OR $mail['locationto_action']=="article") echo "&node_id=".$mail['locationto_action_id']."'>",$mail['locationto_action_name'];
		else echo "'>".$mail['locationto_action'];
		echo "</a>]&nbsp;";
	}
    echo "&nbsp;--&nbsp;&nbsp;<input class='delete' type='checkbox' name='delete[]' value='",$mail['mail_id'],"'>";
	echo $mail['cas'];
	if ($mail['mail_read']=='no') {
    	echo "&nbsp;&nbsp;<font class='alert'>";
        if ($mail['mail_to']==$user_id) echo "NEW";
        elseif ($mail['mail_from']==$user_id) echo "UNDELIVERED";
    }

	echo "</td></tr><tr class='content'><td class='content'>";
	echo StripSlashes($mail['mail_text']);
	echo "</tr></td>";
	echo "</table></tr></td></table>";

}

if ($user_mail>0) {
	$kyberia->query("update mail2 set mail_read='yes' where mail_to='$user_id' and mail_read='no'");
}

?>
</table>
<form>