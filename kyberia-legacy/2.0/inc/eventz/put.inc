<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


function put() {
	global $db,$node;
	$user_id=$_SESSION['user_id'];
	$nodeshell_id=$_POST['nodeshell_id'];
        $nodeshell=nodes::getNodeById($nodeshell_id,$_SESSION['user_id']);
        $nodeshell_permissions=permissions::checkPermissions($nodeshell);

        if (!$nodeshell_permissions['w']) {
                $error="you don't have permissions for writing into node $nodeshell_id";
                return false;
        }

        if (is_array($_POST['node_chosen'])) {
                $put_array=$_POST['node_chosen'];
        }
        else $put_array[]=$node['node_id'];


	foreach ($put_array as $chosen) {
	        $dst_vector=$nodeshell['node_vector'].str_pad($chosen,VECTOR_CHARS,"0",STR_PAD_LEFT);
		$q="update neurons set dst_vector='$dst_vector',synapse_created=NOW(),link='hard',synapse=synapse+1 where src='$chosen' and dst='$nodeshell_id'";
		echo $q;
                $result=$db->update($q);
                if (!$result) {
			$db->query("insert into neurons set dst_vector='$dst_vector',synapse_creator='$user_id',synapse_created=NOW(),src='$chosen',dst='$nodeshell_id',link='hard',synapse=1");			
		}
		$db->query("update nodes set lastdescendant_created=NOW() where node_id='$nodeshell_id'");
	}
}
?>