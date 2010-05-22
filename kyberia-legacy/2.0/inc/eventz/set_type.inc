<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


function set_type() {
	global $node,$db;
	$node_type=$_POST['node_type'];
	$node_id=$node['node_id'];
	$q="update nodes set node_type='$node_type' where node_id='$node_id'";
	echo $q;
	$db->query($q);

}

?>