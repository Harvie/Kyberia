<?php

if(!IsSet($poll))
{
	$q = "select id_poll from polls where forum_id = '$node_id' order by id_poll desc limit 1";
	$reslt = $kyberia->query($q);
	if($reslt->getNumRows() > 0) $reslt->next();
	$poll = $reslt->getString('id_poll');
}

$query = "select * from user_poll where user_id='$user_id' and poll_id='$poll'";
$result = $kyberia->query($query);
if($result->getNumRows()==0) define ('VOTE', true);
else define ('VOTE', false);

if(IsSet($option))
{
	$sqlcmd="select * from user_poll where user_id='$user_id' and poll_id='$poll'";
	$result=$kyberia->query($sqlcmd);
	if ($result->getNumRows()==0) {	
		$sqlcmd="update polls set responses=responses+1 where id_poll=$poll";
		$result=$kyberia->query($sqlcmd);
		$sqlcmd="update poll_options set number=number+1 where id_option=$option";
		$result=$kyberia->query($sqlcmd);
		$kyberia->query("insert into user_poll set user_id='$user_id',poll_id='$poll'");
	}
	else echo "<br><center><font color='red'><b>brawco,v  ankete uz si hlasoval!</b></font></center>";
}

$sqlcmd="select * from polls where forum_id='$node_id' order by id_poll desc
limit 1";
$result=$kyberia->query($sqlcmd);
if ($result->getNumRows()>0)  {
	$result->next();
	echo "<table class=box><tr><td colspan=3 align=center>";
	echo $result->getString('question');
	$percent=$result->getString('responses')/100;
	if (!$percent) $percent=1;
	echo "</td></tr>";

	$sqlcmd="select * from poll_options where id_poll='".$result->getString('id_poll')."'";
	$result2=$kyberia->query($sqlcmd);
	while ($result2->next()) {
		(int) $count = (int) ($result2->getString('number')/$percent);
		$count2 =$count/2;
		if(VOTE && !IsSet($option))
			echo "<tr><td><a href=$PHP_SELF?action=forum&node_id=$node_id&poll=",$result->getString('id_poll'),"&option=",$result2->getString('id_option'),">",$result2->getString('text'),"</a></td><td><table width=$count2 bgcolor=#6dae42 height=5><tr height=5><td height=5></tr></td></table></td><td>".$count."% </td></tr>";
		else
			echo "<tr><td>".$result2->getString('text')."</td><td><table width=$count2 bgcolor=#6dae42 height=5><tr height=5><td height=5></tr></td></table></td><td>".$count."% </td></tr>";
	}
	echo "<tr><td colspan=3 align=center><br>Spolu hlasovalo<br><b>".$result->getString('responses')."</b><br>ludi</td></tr>";
	echo "</table>";
}

?>