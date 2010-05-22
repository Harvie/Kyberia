<?php
/*
if (!$channel) $channel="kyberia";
$channel_name=$channel;
$channel="#".$channel;
mysql_connect("node.kyberia.sk","kyberia","cyb3ry");
mysql_selectdb("kyberia");
if ($irc_query and $channel) {
	$message_text= "$user_name : $irc_query\r\n";
	$fp = fsockopen ("node.kyberia.sk", 2323, $errno, $errstr,30);
	if (!$fp) {
	    echo "$errstr ($errno)<br>\n";
	} else {
	    fgets($fp,2);
	    fputs ($fp, "hromi\r\n");
	    fputs ($fp,"ub1k23\r\n.say $channel $message_text");
	    fclose ($fp);
	    mysql_query("insert into irc_messages set nick='$user_name',message_text='$irc_query',channel='$channel'");
	}

}
*/
?>
<form method='post' action='?action=irc&channel=<?=$channel_name?>'><input type='text' name='irc_query'><input type='submit' value='napis'></form>