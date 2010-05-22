<?php
global $user_id;
include("book_func.inc");
$openswich=$_GET['openswich'];
$swichto=$_GET['swichto'];
if ($openswich) {
	$q="update user_bookcat set is_open='$swichto' where user_id='$user_id' and bookcat_id='$openswich'";
//	echo $q;
	$kyberia->query($q);
}

$book=$_GET['book'];
if ($book) {
	$q="update user_forum set user_bookmark='no' where user_id='$user_id' and forum_id='$node_id'";	$kyberia->query($q);
}

readbookdb();

listbookcat2('0');
echo "<br>Nezaradene kluby:<br>";
listbookforum2('0');


?>