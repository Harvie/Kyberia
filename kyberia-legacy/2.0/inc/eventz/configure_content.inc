<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	function configure_content() {

		global $db,$error,$node;
		$node_id=$node['node_id'];

                if ($node['node_permission']!=('owner' OR 'master' OR 'op')) {
                        $error=$error_messages['EVENT_PERMISSION_ERROR'];
                        return false;
                }



		//warning - not forget!!! - if self-presentation of content (template form) than save as file into OWN_TEMPLATE folder
		if ($node['template_id']==$node['node_id']) {
		        $node_content=stripslashes($_POST['node_content']);
		        $template_id=$node['template_id'];
		        $fp = fopen (OWN_TEMPLATE_DIR.$template_id.".tpl", "w+");
		        fwrite($fp,$node_content);
		        fclose($fp);
			$external_link=OWN_TEMPLATE_DIR.$template_id.".tpl";
		        chown(OWN_TEMPLATE_DIR.$template_id.".tpl","www");
			$q="update nodes set external_link='$external_link' where node_id='".$node['node_id']."'";
			$db->query($q);
		}

		$node_content=nodes::processContent($_POST['node_content']);
		
		if (!$node_content) {
			return false;
		}
		$db->update("update nodes set node_updated=NOW() where node_id='$node_id'");

		$result=$db->update("update node_content set node_content='$node_content' where node_id='$node_id'");
		if (!$result) {
			$result=$db->query("insert into node_content set node_content='$node_content',node_id='$node_id'");
			return true;			
		}
		else return true;
	}
?>