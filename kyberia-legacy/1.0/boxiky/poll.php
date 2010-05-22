<?php include("../header_db.php"); ?>

<?php
if (IsSet($poll) AND IsSet($option)) {
$sqlcmd="update polls set responses=responses+1 where id_poll=$poll";
$result=mysql_query($sqlcmd);
$sqlcmd="update poll_options set number=number+1 where id_option=$option";
$result=mysql_query($sqlcmd);
}

else {
echo "<table><tr><td colspan=3 align=center>";
$sqlcmd="select * from polls where active='yes' order by id_poll desc limit 1";
$result=mysql_query($sqlcmd);
$riadok=mysql_fetch_array($result);
echo $riadok[question];
$percent=$riadok[responses]/100;
if (!$percent) $percent=1;
echo "</td></tr>";
$sqlcmd="select * from poll_options where id_poll='$riadok[id_poll]'";

$result=mysql_query($sqlcmd);
while ($riadok2=mysql_fetch_array($result)) {
	(int) $count = (int) ($riadok2[number]/$percent);
	echo "<tr><td><a href=$PHP_SELF?poll=$riadok[id_poll]&option=$riadok2[id_option]>$riadok2[text]</a></td><td><table width=$count bgcolor=green height=5><tr height=5><td height=5></tr></td></table></td><td>".$count."% </td></tr>";
}
echo "</table>";
}
mysql_close();
?>
