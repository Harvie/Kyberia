<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	function upload_own_template() {

		global $db,$error,$node;
		$node_id=$node['node_id'];
		$node_template=$_POST['node_template'];

		if (Is_Array($_FILES['template_file'])) {
			copy($_FILES['template_file']['tmp_name'],OWN_TEMPLATE_DIR.'/'.$node['node_id'].".tpl");
		}
		$db->query("update nodes set node_template='$node_template' where node_id='$node_id'");
	}		

?>