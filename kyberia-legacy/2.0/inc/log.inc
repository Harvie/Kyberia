<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

class log {

	function log($action,$node_id,$result,$parameter1='',$parameter2='') {

		global $db,$node;
		$user_id=$_SESSION['user_id'];
//		$db->query("insert delayed into logs set event='$action',node_id='$node_id',user_id='$user_id',result='$result',parameter1='$parameter1',parameter2='$parameter2'");

	}

}
?>