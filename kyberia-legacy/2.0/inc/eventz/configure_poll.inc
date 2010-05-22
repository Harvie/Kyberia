<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


function configure_poll() {
	//poll is special node with serialized option.text and option.number array in node_content

	global $db,$node;
	$user_id=$_SESSION['user_id'];
	if ($node['node_creator']==$user_id || $node['node_permission']=='master') {
	
              $options=explode(";",$_POST['options']);
	      if (!Is_array($options)) {
			$error="ain't any optionz for da poll h3r3 mista'";
			return false;
	      }
	      foreach ($options as $option) {
		$optionz[]=array("text"=>nodes::processContent($option),"number"=>"0");
		}

	      $optionz=serialize($optionz);

		$q="insert into nodes set
node_name='".$_POST['question']."',node_parent='".$node['node_id']."',
node_vector='".$node['node_vector'].";".$node['node_id']."'
,node_system_access='public',node_external_access='".$node['node_external_access']."',
node_creator='$user_id',node_type=11,node_views=0";

		$db->query($q);
		$id=$db->getLastInsertId();
		$db->query("insert into node_content set node_id='$id',node_content='$optionz'");
		log::log('add poll',$node['node_id'],'ok',$id);


	}

	else {
		log::log('add poll',$node['node_id'],'failed','permissions');
	}
	
}

?>