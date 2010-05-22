<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	function configure_node_name() {
		global $db,$error,$node;
		$node_id=$node['node_id'];
		$user_id=$_SESSION['user_id'];

		if ($node['node_permission']=='owner') {			

			$node_name=addslashes($_POST['node_name']);

			if ($_POST['apply_on_vector']) {
				$vector=$node['node_vector'];
				if (empty($vector))  {
					$error=$error_messages['INCORRECT_VECTOR'];
					return false;
				}
				$q="update nodes set node_name='$node_name' where node_vector like '$vector%'";
				$db->query($q);
			}	
			
			elseif (!empty($node_id)) {
				$q="update nodes set node_name='$node_name' where node_id='$node_id'";
				$db->query($q);
				if ($node['external_link']=='db://user') {
					$q="update users set login='$node_name' where user_id='$node_id'";
					$db->query($q);
				}
			}
		}
		return true;
		
	}
?>