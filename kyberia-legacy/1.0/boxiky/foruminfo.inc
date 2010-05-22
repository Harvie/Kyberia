<?php
$forum_owner_id=$forum['forum_owner'];
$set2=$kyberia->query("select user_id from session where user_id='$forum_owner_id' group by session.user_id");
while ($set2->next()){
	$onl[$set2->getString('user_id')]=$set2->getString('user_id');
}
if ($onl[$forum_owner_id]) {$onlflag="@";} else {$onlflag="";}


echo "<table><tr>";
echo "<td valign='top' align='center' colspan='2'><img src='/images/forums/".$node_id.".gif' border='0'></td></tr>";
echo "<tr><td valign='top' align='left'>forum:</td>";
echo "<td valign='top' align='left'><a href='".SCRIPT."?action=forum&node_id=$node_id'>".$forum['forum_name']."</a></td>";
echo "</tr><tr>";
echo "<tr><td valign='top' align='left'>type:</td>";
echo "<td valign='top' align='left'>".$forum['forum_type']."</td>";
echo "<tr><td valign='top' align='left'>access:</td>";
echo "<td valign='top' align='left'>".$forum['forum_public']."</td>";
echo "<tr><td valign='top' align='left'>ctgry:</td>";
echo "<td valign='top' align='left'><a href='?action=list".$forum['forum_category_param']."'>".$forum['category']."</a></td>";
echo "<tr><td valign='top' align='left'>owner:</td>";
echo "<td valign='top' align='left'><a href='".SCRIPT."?action=userinfo&node_id=".$forum['forum_owner']."'>".$forum['owner_name']." $onlflag</a></td>";
echo "</tr>";
echo "<tr><td align='center' colspan='2'>";
?>
<form method='post' action='/index.php'>
<input type='hidden' name='action' value='forum'>
<input type='hidden' name='node_id' value='<?=$node_id?>'>
<?php

if($forum['forum_owner'] != $user_id)
{
	if ($forum['bookmark']=='yes') echo "<input type='submit' value='unbook' name='event'>";
	else echo "<input type='submit' value='book' name='event'>";
}

$q = "select access_type from node_access where node_type = 'forum' and node_id = '$node_id' and user_id = '$user_id'";
$result = $kyberia->query($q);


if($result->getNumRows() > 0)
{
	$result->next();
	if($forum['forum_owner'] == $user_id || ($result->getString("access_type") == 'master') || ($result->getString("access_type") == 'op')) define('EDIT', true);
	else define('EDIT', false);
}
elseif ($forum['forum_owner'] == $user_id) define("EDIT", true);
else define('EDIT', false);


//if(($result->getNumRows() > 0) or ($forum['forum_owner']==$user_id)) define('EDIT', true);
//else define('EDIT', false);

if (EDIT) {
	echo "<br><a href='".SCRIPT."?action=forum&node_id=$node_id&update=1'>zmen nastavenie</a>";
}
echo "<br><a href='".SCRIPT."?action=forum&node_id=$node_id&stats=1'>statistiky</a>";
echo "<br><a href='".SCRIPT."?action=forum&node_id=$node_id&karma=1'>karma</a>";
?>

</form>
<?php
echo "</table>";



?>