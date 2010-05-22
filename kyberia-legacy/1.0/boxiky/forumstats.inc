<br>
<?php
$set2=$kyberia->query("select user_id from session group by session.user_id");
while ($set2->next()){
	$onl[$set2->getString('user_id')]=$set2->getString('user_id');
}
$set=$kyberia->query("select DATE_FORMAT(user_forum.last_visit,'%k:%i:%s') AS datetime,user_forum.*,user.login,user.id as user_id from user_forum left join user on user.id=user_forum.user_id where (forum_id='$node_id' and user_bookmark='yes') ORDER by user_forum.submission_count asc ");
echo "<table><tr><td colspan='2' align='center' style='color: red'>booked</td><tr><td>user</td><td>not read</td>";
while ($set->next()) {
	if ($onl[$set->getString('user_id')]) {$onlflag="@";} else {$onlflag="";}
  if ($friend_array[$set->getString('user_id')]){
    echo "<tr><td><b>",$set->getString('login'),"<b> $onlflag</td><td align=center>",$set->getString('submission_count'),"</td></tr>";
  }else{
    echo "<tr><td>",$set->getString('login')," $onlflag</td><td align=center>",$set->getString('submission_count'),"</td></tr>";
  }
}
echo "</table>";