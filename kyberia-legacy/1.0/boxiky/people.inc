<?php

//$subaction=_GET['subaction'];

function show_user($user_id, $user_name, $user_action, $user_action_id, $user_action_name, $user_mode, $user_idle)
{
	echo "<table align=center><tr><td colspan=2 align=center><b>$user_name</b></td></tr>";
	echo "<tr><td><a href='?action=userinfo&node_id=$user_id'><img width='50' height='50' src='/images/users/".strtolower($user_name).".gif' border='0' alt='$user_name'></a></td>";
	if ($user_action == "forum") echo "<td valign=top width=100>[<a href='?action=forum&node_id=$user_action_id'>$user_action_name</a>";
	elseif ($user_action == "journaux" && $user_action_name != "") echo "<td valign=top width=100>[<a href='?action=journaux&node_id=$user_action_id'>$user_action_name</a>";
	elseif ($user_action == "article" && $user_action_name != "") echo "<td valign=top width=100>[<a href='?action=article&node_id=$user_action_id'>$user_action_name</a>";
	elseif ($user_action == "userinfo" && $user_action_name != "") echo "<td valign=top width=100>[<a href='?action=userinfo&node_id=$user_action_id'>$user_action_name</a>";
	else echo "<td width=100 valign=top align=left>[<a href='?action=$user_action'>$user_action</a>";
	echo "]<br>";
	$time=$user_idle;
	if ($time<0) $time+=(60*1440);
	echo floor($time/60)," min,",($time%60)," sec<br>";
	if ($user_mode != 'normal') echo "$user_mode<br>";
	echo "</td></tr></table>";
}


if($subaction == 'active')
	$query = "select (time_to_sec(NOW())-time_to_sec(user_idle)) as idle,user_id,session.* from session group by user_name";
elseif($subaction == 'activefriends')
	$query = "select (time_to_sec(NOW())-time_to_sec(user_idle)) as idle, friends.*, session.* from friends left join session on friends.friend_id=session.user_id where friends.friend_id=session.user_id and friends.user_id=$user_id";



if($subaction == 'friends') include("friends.inc");

else
{
	
	echo "<table>";
	$set=$kyberia->query($query);
	while ($set->next()) {

		echo "<tr><td>";
		show_user($set->getString('user_id'), $set->getString('user_name'), $set->getString('user_action'), $set->getString('user_action_id'), $set->getString('user_action_name'), $set->getString('user_mode'), $set->getString('idle'));
		echo "</td>";

		if ($set->next()) {
			echo "<td>";
			show_user($set->getString('user_id'), $set->getString('user_name'), $set->getString('user_action'), $set->getString('user_action_id'), $set->getString('user_action_name'), $set->getString('user_mode'), $set->getString('idle'));
			echo "</td>";
		}

		if ($set->next()) {
			echo "<td>";
			show_user($set->getString('user_id'), $set->getString('user_name'), $set->getString('user_action'), $set->getString('user_action_id'), $set->getString('user_action_name'), $set->getString('user_mode'), $set->getString('idle'));
			echo "</td>";
		}

	echo "</tr>";

	}
}

echo "</table>";
