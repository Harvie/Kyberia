<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */



	function delete_mail($node_id) {
		global $node,$db,$error;
		$user_id=$_SESSION['user_id'];
		foreach ($_POST['message'] as $chosen =>$value) {
			$db->query("delete from mail where mail_id='$chosen' and mail_user='$user_id'");
		}
	}

?>