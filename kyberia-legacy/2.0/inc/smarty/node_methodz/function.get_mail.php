<?
	function smarty_function_get_mail($params, &$smarty) {
		global $db, $node;
		$user_id=$_SESSION['user_id'];
               if (is_numeric($params['listing_amount'])) $listing_amount=$params['listing_amount'];
                else $listing_amount=23;
                if (is_numeric($params['offset'])) $offset=$params['offset'];
                else $offset=0;

                if (!empty($params['search'])) {
			if ($params['search_type']=='mail_text') $sql_type.=" and mail_text like '%".addslashes($params['search'])."%' ";
			else {
				$q2="select user_id from users where login='".addslashes($params['search'])."'";
				$userset=$db->query($q2);
				$userset->next();
				$id=$userset->getString('user_id');
				$sql_type=" and ".$params['search_type']."='$id'";
			}
		}	

		$query = "select date_format(mail.mail_timestamp,\"%e.%c. %k:%i:%s\") as cas,
userfrom.user_action as locationfrom_action,
userfrom.user_action_id as locationfrom_action_id, 
userto.user_action as locationto_action, 
userto.user_action_id as locationto_action_id,
userto.login as mail_to_name, userfrom.login as mail_from_name,
mail.* from mail left join users as userfrom on
mail_from=userfrom.user_id left join users as userto on mail_to=userto.user_id
where mail_user='$user_id' ";
		if ($sql_type) $query.=$sql_type;
		$query.=" order by mail_id desc limit $offset,$listing_amount";

		$set = $db->query($query);
		
		while($set->next()) {
			$get_mail[] = $set->getRecord();
		}

		$smarty->assign('get_mail', $get_mail);
	
	}

?>
