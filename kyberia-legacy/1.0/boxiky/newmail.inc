<?php
$session_count=msession_count();
$user_id=$user['user_id'];
echo "<table class='userinfo'>";
echo "<tr><td><img src='/images/users/",$user['user_login'],".gif' border='0' alt='",$user['user_login'],"'><br>",$user['user_login'],"</td>";
/* showing mail */
$q="SELECT mail.mail_text,mail.mail_from,user.user_login as user_name  FROM mail left join user on mail.mail_from=user.user_id where mail_new='yes' and mail_to='$user_id'";
$q.=" ORDER BY mail_id DESC";
echo "<td valign='top'>";

$result=mysql_query($q);
while ($mail=mysql_fetch_array($result)) {
        $year=substr($mail['mail_timestamp'],0,4);
        $month=substr($mail['mail_timestamp'],4,2);
        $day=substr($mail['mail_timestamp'],6,2);
        $hour=substr($mail['mail_timestamp'],8,2);
        $min=substr($mail['mail_timestamp'],10,2);
        $sec=substr($mail['mail_timestamp'],12,2);
        echo "<a href='?action=posta'>";
	echo "<b>",$mail['user_name'],":</b>";
	echo $mail['mail_text'],"<br></a>";;

}
echo "</td></tr></table>";
?>
