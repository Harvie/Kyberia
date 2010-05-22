<?php

if ($access_type=="ban" and $forum['forum_owner']!=$user_id) return;
elseif (!empty($access_type)) {
	echo "<center><b>si $access_type tohto klubu</b></center>";
}

if ($forum['forum_public']=='private' and !($forum['forum_owner']==$user_id OR $access_type=='access')) {
	echo "toto forum je privatne. sorry";
	return;
}

if($forum['forum_owner'] == $user_id) $access_type = 'owner';

$stats=$_GET['stats'];
$update=$_GET['update'];
$alone=$_GET['alone'];

//statistiky
if ($stats) {
	$set=$kyberia->query("select count(*) as pocet from user_forum where forum_id='$node_id'");
	$set->next();$pocet=$set->getString('pocet');
	echo "pocet ludi: $pocet";
	echo "<table align='center' class='box'>";
	$set=$kyberia->query("select user_forum.*,user.login as login,user.id as user_id from user_forum left join user on user.id=user_forum.user_id where forum_id='$node_id' order by submission_count");
	while ($set->next()) {
		if ($set->getString('user_bookmark')==1) {
			echo "<tr style='font-color: red;'>";
		}
		else echo "<tr>";
  if ($friend_array[$set->getString('user_id')]){
		echo "<td><b>",$set->getString('login'),"</b></td><td>",$set->getString('submission_count'),"</td><td>",$set->getString('last_visit'),"</td>";
  }else{
		echo "<td>",$set->getString('login'),"</td><td>",$set->getString('submission_count'),"</td><td>",$set->getString('last_visit'),"</td>";
  }
		echo "</tr>";
	}
	echo "</table>";
}

//admin update mode
elseif($update || $_GET['status']) {
	$set=$kyberia->query("select user.login,node_access.* from node_access left join user on user.id=user_id where node_type='forum' and node_id='$node_id'");
	while ($set->next()) {
		if ($set->getString('access_type')=="ban") $banlist.=$set->getString('login').";";
		elseif ($set->getString('access_type')=="master") $masterlist.=$set->getString('login').";";
		elseif ($set->getString('access_type')=="op") $oplist.=$set->getString('login').";";
		elseif ($set->getString('access_type')=="access" && $forum['forum_public']!='public') $accesslist.=$set->getString('login').";";
}
?>
	<form  enctype='multipart/form-data' method='post' action='<?=SCRIPT?>'>
	<table class='box' width='100%'>
	<tr><td valign='top'><img src='/images/forums/<?=$node_id?>.gif' border='0'></td>
	<td>
	<table align='center' width='100%'>
<?php if ($forum['forum_public']=='public') {?>
	<tr><td><textarea name='banlist' cols='230' rows='3'><?=$banlist?></textarea></td><td><input type='submit' value='ban list' name='event'> </td></tr>
	<tr><td><textarea name='oplist' cols='230' rows='3'><?=$oplist?></textarea></td><td> <?php if(($access_type == 'owner') or ($access_type == 'master')) echo "<input type='submit' value='op list' name='event'>"; ?> </td></tr>
	<tr><td><textarea name='masterlist' cols='230' rows='3'><?=$masterlist?></textarea></td><td> <?php if($access_type == 'owner') echo "<input type='submit' value='master list' name='event'>"; ?> </td></tr>
<?php } elseif ($forum['forum_public']=='private') { ?>
	<tr><td><textarea name='accesslist' cols='230' rows='3'><?=$accesslist?></textarea></td><td><input type='submit' value='access list' name='event'> </td></tr>
<?php } else { ?>
	<tr><td><textarea name='banlist' cols='230' rows='3'><?=$banlist?></textarea></td><td><input type='submit' value='ban list' name='event'> </td></tr>
	<tr><td><textarea name='oplist' cols='230' rows='3'><?=$oplist?></textarea></td><td> <?php if(($access_type == 'owner') or ($access_type == 'master')) echo "<input type='submit' value='op list' name='event'>"; ?> </td></tr>
	<tr><td><textarea name='masterlist' cols='230' rows='3'><?=$masterlist?></textarea></td><td> <?php if($access_type == 'owner') echo "<input type='submit' value='master list' name='event'>"; ?>
</td></tr>
	<tr><td><textarea name='accesslist' cols='230' rows='3'><?=$accesslist?></textarea></td><td><input type='submit' value='access list' name='event'> </td></tr>
<?php } ?>
	</table>
	</td></tr>
	</table><br>
<?php
$set=$kyberia->query("select * from category order by category_tree");
$selectstring="<select name='forum_category'>";
while ($set->next()) {
	$count=substr_count($set->getString('category_tree'),";");
	$selectstring.="<option value='".$set->getString('category_id')."'";
	if ($forum['forum_category']==$set->getString('category_id')) $selectstring.= " selected ";
	$selectstring.= ">";
	if ($count) {
		$selectstring.="|";
		for ($i=0;$i<$count;$i++) $selectstring.="----";
	}
	$selectstring.=$set->getString('category_name')."</option>";
}
$selectstring.="</select>";

?>

	<input type='hidden' name='action' value='forum'>
	<input type='hidden' name='node_id' value='<?=$node_id?>'>
	<table class='box'>
	<tr><td>info:&nbsp;<br><textarea class='long' name='forum_info' cols='230' rows='23'><?=$forum['forum_info']?></textarea></td><td>
	nazov:&nbsp;<input type='text' class='longtext' name='forum_name' value='<?=$forum['forum_name']?>'><br>
	owner:&nbsp;<input type='text' class='longtext' name='forum_owner' value='<?=$forum['owner_name']?>'><br>
	public?<input type=radio name='forum_public' value='public' <?php if ($forum['forum_public']=='public') {?> checked <?php } ?>>&nbsp;&nbsp;moderated?<input type=radio name='forum_public' value='moderated' <?php if ($forum['forum_public']=='moderated') {?> checked <?php } ?>>&nbsp;&nbsp;private?<input type=radio name=forum_public value='private' <?php if ($forum['forum_public']=='private') {?> checked <?php } ?>><br>
	picture:&nbsp;<input type='file' class='bigtextinput' name='forum_icon'><br>
	<?=$selectstring?><br><br>
<?php
// to je v poho, kazdy aj tak moze menit iba to, co je dovolene
if($access_type == 'owner' || $access_type == 'master' || $access_type == 'op') echo "
	<input type='submit' name='event' value='zmen nastavenie'>
	<input type='submit' value='zmaz forum' name='event' onClick=\"return confirm('Bravco, chces zmazat svoje forum???')\">"; ?>
	</td></tr></table>
	<br>
	<?php
	include("polladmin.inc");
}





else {

$new=$forum['submission_count'];
$count=$forum['forum_submissions'];


echo $forum['forum_info']."<br><br>";


$old_submission_text=StripSlashes($_POST['submission_text']);

        // navigacia! sofistikovana bitch

        if (empty($limit)) $limit=$user_amount;
	else $limit=$limit;
	if ($new > $limit) $limit=$new;
        if (empty($offset)) $offset=0;
        if ($event=='>') $offset+=$limit;
        if ($event=='<') $offset-=$limit;
        if ($event=='<<') $offset='0';
        if ($event=='>>') $offset=$count-$limit;
        if ($offset<0) $offset=0;
        if ($offset+$limit>$count AND $limit<$count) $offset=$count-$limit;
        elseif ($offset+$limit>$count AND $limit>$count) $offset=0;
        // koniec sofistikovanej bitch


if ($user_id=='38') echo "POCET:$count OFFSET: $offset LIMIT: $limit NEW : $new";
include_once("active.inc");
?>
<form action='<?=$PHP_SELF?>?node_id=<?=$node_id?>&action=forum' method='post'>
<?php if(!($forum['forum_public'] == 'moderated' AND empty($access_type))) { ?> <textarea style="width: 510pt; height: 50pt;" name='submission_text'><?php if($event=='nahlad') echo $old_submission_text; ?></textarea> <?php } ?>
<br>

<?php 
	if($forum['forum_public']=='moderated' AND empty($access_type)) { Showz::showNav(false); } 
	else Showz::showNav();
?>

<?php

if ($_GET['karma']) {
	$q="SELECT submissions.*,user.login as user_name,user.id as user_id ,session.user_action_name as user_action_name,user_action_id as user_action_id,session.user_action as user_action,user.user_mode as user_mode  FROM submissions left join user on submissions.submission_owner=user.id left join session on user.id=session.user_id where forum_id='$node_id' and submission_k>0";
	$q.=" ORDER BY submission_k DESC LIMIT $offset,$limit";
}

else {
	$q="SELECT submissions.*,user.login as user_name,user.id as user_id ,session.user_action_name as user_action_name,user_action_id as user_action_id,session.user_action as user_action,user.user_mode as user_mode  FROM submissions left join user on submissions.submission_owner=user.id left join session on user.id=session.user_id where forum_id='$node_id' ";
	if ($event=="hladat") $q.=" and submission_text like '%$submission_text%' or user.login like '%submission_text%'";
	if (IsSet($alone)) $q.=" and submission_id=$alone";
	if ($forum['forum_type']=='threaded') $q.=" group by submission_id order by concat(submission_thread,submission_timestamp) desc limit $offset,$limit";
	else $q.=" ORDER BY submission_id DESC LIMIT $offset,$limit"; 
}

$set=$kyberia->query($q);

if ($preview) echo $preview;

while ($set->next()) {
	$submissions=$set->getRecord();
	if ($forum['forum_type']=='threaded') {
		$zub=substr_count($submissions['submission_thread'],".");
		$width=$zub*50;
 		echo "<table width='100%'><tr width='100%'><td width='$width'></td><td align='left'>";
		echo "<table class='bigitem'><tr><td class='icon'>";
		if ($user_icons_in_forum == 'yes')
			echo "<img alt='",$submissions['user_name'],"' src='/images/users/",strtolower($submissions['user_name']),".gif'>";
		else
			echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		echo "</td><td class='item'>";
		echo "<table class='item'>";
		echo "<td class='header'><a href='?action=userinfo&node_id=",$submissions['user_id'],"'>",$submissions['user_name'],"</a>";
		if ($submissions['user_mode']=="normal" AND ($submissions['user_action'])) {
			echo "&nbsp;[lokacia:<a class='location' href='?action=",$submissions['user_action'];
			if ($submissions['user_action']=="forum") echo "&node_id=".$submissions['user_action_id']."'>",$submissions['user_action_name'];
			else echo "'>".$submissions['user_action'];
			echo "</a>]&nbsp;";
		}
		Showz::showDate($submissions['submission_timestamp']);
//		echo "<input class='delete' type=hidden name=delete_time[".$submissions['submission_id']."] value='".$submissions['submission_timestamp']."'>";
			echo "&nbsp;&nbsp;&nbsp;&nbsp;<input class='delete' type=checkbox name=delete_name[] value='".$submissions['submission_id']."'>";
		if ($user_id==$submissions['submission_owner'] or $forum['forum_owner']==$user_id) {
		echo "<input class='delete' type=hidden name=delete_time[".$submissions['submission_id']."] value='".$submissions['submission_timestamp']."'>";

		}
		if ($new>0) echo "<font color='red'><b> :: NEW :: </b></font>";

		echo "</td>";
		echo "</tr>";
		echo "<tr class='content'><td class='content'>",Stripslashes($submissions['submission_text']),"</td></tr>";
		echo "</table>";
		echo "</table>";
		echo "</table>";

	} else {
		echo "<table class='bigitem'><tr><td class='icon' nowrap>";
		if ($user_icons_in_forum == 'yes')
			echo "<img alt='",$submissions['user_name'],"' src='/images/users/",strtolower($submissions['user_name']),".gif'>";	
		else
			echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		if ($submissions['submission_k']) echo "<center><font color='red'>".$submissions['submission_k']." K</font></center>";
		echo "</td><td class='item'>";
		echo "<table class='item'>";
		echo "<td class='header'><a href='?action=userinfo&node_id=",$submissions['user_id'],"'>",$submissions['user_name'],"</a>";
		if ($submissions['user_mode']=="normal" AND ($submissions['user_action'])) {
			echo "&nbsp;[lokacia:<a class='location' href='?action=",$submissions['user_action'];
			if ($submissions['user_action']=="forum") echo "&node_id=".$submissions['user_action_id']."'>",$submissions['user_action_name'];
			else echo "'>".$submissions['user_action'];
			echo "</a>]&nbsp;";
		}
		Showz::showDate($submissions['submission_timestamp']);
//		if ($user_id==$submissions['submission_owner'] or $forum['forum_owner']==$user_id) {
			echo "&nbsp;&nbsp;&nbsp;&nbsp;<input class='delete' type=checkbox name=delete_name[] value='".$submissions['submission_id']."'><input class='delete' type=hidden name=delete_time[".$submissions['submission_id']."] value='".$submissions['submission_timestamp']."'>";
//		}
		if ($new>0) echo "<font color='red'><b> :: NEW :: </b></font>";
		echo "<div align='right' valign='top'><a href='?action=forum&node_id=".$node_id."&alone=".$submissions['submission_id']."'>link alone ".$submissions['submission_id']."</a></div>";
		echo "</td>";
		echo "</tr>";
		echo "<tr class='content'><td class='content'>",Stripslashes($submissions['submission_text']),"</td></tr>";
		echo "</table>";
		echo "</td></tr></table>";
		$new--;
	}
}
?>

<?php if (!($limit>$count)) {
	echo "<center>";
	Showz::showNav(false);
	echo "</center>";
}

}
?>

</form>