<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


function K() {
	global $db,$node,$error,$error_messages;
	$user_id=$_SESSION['user_id'];
	$user_name=$_SESSION['user_name'];
	$kset=$db->query("select user_k from users where user_id='$user_id'");
	$kset->next();
	$user_k=$kset->getString('user_k');

	if (is_array($_POST['node_chosen'])) {
		$k=$_POST['node_chosen'];
	}
	else $k[]=$node['node_id'];

	foreach ($k as $id) {
		if ($user_k) {
			$userset=$db->query("select node_creator from nodes where node_id='$id'");
			$userset->next();
			$donor_id=$userset->getString('node_creator');
/*
			if ($donor_id==$user_id) {
				$error.=$error_messages['K_EGOTRIP'];
				log::log('K',$id,'failed',$donor_id,'egotrippin');
			}

			else {
*/
				$set=$db->query("select * from node_access where node_id='$id' and user_id='$user_id' and given_k='yes'");
				if ($set->getNumRows()) {
					$error.=$error_messages['K_GIVEN'];
					log::log('K',$id,'failed',$donor_id,'already given');	
				}
				else { 
					--$user_k;
					$db->query("update nodes set k=k+1 where node_id='$id'");
					$result=$db->update("update node_access set given_k='yes' where node_id='$id' and user_id='$user_id'");
					if (!$result) {
						$db->query("insert into node_access set given_k='yes',node_id='$id',user_id='$user_id',last_visit=NOW()");				
					}
					

					log::log('K',$id,'ok',$donor_id);
				}
//			}
		}

		else {
			$error.=$error_messages['K_SPENT'];
			log::log('K',$id,'failed',$donor_id,'zero amount');
		}
	}

	$db->query("update users set user_k='$user_k' where user_id='$user_id'");

	if (!$error) return true;
	else return false;
}

?>