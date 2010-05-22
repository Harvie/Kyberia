<?php

class Showz {

function showDel($action,$id) {

}

function showNav($start=true) {
$action=$_GET['action'];
global $kyberia;
global $offset;
global $limit;
global $user_id;
if ($start) echo "<input type='submit' name='event' value='poslat'>";
if ($start && $action=='forum') echo "<input type='submit' name='event' value='odpovedat'>";
echo "<input type='submit' value='<' name='event' class='textinput'>
<input type='submit' value='<<' name='event' class='textinput'>";
if ($start) echo "<input type='submit' name='event' value='zmazat'>";
if ($start) echo "<input type='text' value='$limit' name='limit' class='textinput'>";
echo "<input type='submit' value='>>' name='event' class='textinput'>
<input type='submit' name='event' value='>' class='textinput'>";
echo "<input type='hidden' name='offset' value='$offset'>";
if ($start) echo "<input type='submit' name='event' value='nahlad'>";
if ($start) echo "<input type='submit' name='event' value='hladat'>";


if ($start && $action=='forum') {
	$set3=$kyberia->query("select user_k from user where id='$user_id'");
	$set3->next();
	$kamount="Este mas ".$set3->getString('user_k')." K.";
	echo "<br><center>";
	echo "<table><tr><td valign='middle'>".$kamount."</td><td valign='middle'><input type='hidden' name='k_amount' value='1'><input type='submit' value='K!' name='event' class='smalltextinput'>&nbsp;&nbsp;&nbsp;&nbsp;</td>";
	echo "<td valign='middle'><input value='delbetween' class='delete' type='checkbox' name='delbetween'>&nbsp;zmaz mezi&nbsp;&nbsp;<input type='checkbox' value='NO-HTML' name='nohtml' value='nohtml' class='delete'>&nbsp;NO-HTML</td></tr></table>";
	echo "</center>";
}

}

function showDate($date) {
echo "&nbsp;&nbsp;".$date;
}

function showLocation($action,$id,$name) {
	if ($name) echo "&nbsp;[lokacia::<a class='location' href='".SCRIPT."?action=$action&node_id=$id'>$name</a>]&nbsp;";
	else echo "&nbsp;[lokacia:<a class='location' href='".SCRIPT."?action=$action'>$action</a>]&nbsp;";
}

}