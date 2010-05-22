<?
include_once("./inc/kyberia.inc");
$set=$kyberia->query("SELECT forum_id from forum");
$icondir="/home/hromi1/kyberia/images/forums/";
$cmd=0;
while ($set->next()) {
	$id=$set->getString("forum_id");
	$icon=$icondir.$id.".gif";	
	if (strstr(,".jpg")){
		$cmd="/usr/local/netpbm/bin/jpegtopnm $forum_icon | /usr/local/netpbm/bin/pnmscale -width=123 | /usr/local/netpbm/bin/ppmquant 256 | /usr/local/netpbm/bin/ppmtogif > ".$icondir.strtolower($lastid).".gif";

	}
	elseif (strstr($forum_icon_name,".gif")) {
		$cmd="/home/hromi1/kyberia/gifsicle --resize 123x_ $forum_icon > ".$icondir.strtolower($lastid).".gif";
	}
	if ($cmd) shell_exec($cmd);


}
?>
