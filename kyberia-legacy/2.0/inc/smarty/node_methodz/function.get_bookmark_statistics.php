<?php
        function smarty_function_get_bookmark_statistics($brawco,&$smarty) {
		global $db, $error, $node;
		$node_handle=$node['node_id'];

		$q="select node_access.*,users.login,users.user_action from node_access left join users on node_access.user_id=users.user_id where node_id='$node_handle' and node_bookmark='yes' order by node_user_subchild_count";

		$result=$db->query($q);

		while ($result->next()) {
			$bs_array[]=$result->getRecord();
		}

		$smarty->assign('get_bookmark_statistics',$bs_array);
        }

?>