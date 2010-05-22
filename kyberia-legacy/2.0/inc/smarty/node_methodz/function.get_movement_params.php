<?php

	function smarty_function_get_movement_params($params,&$smarty) {
		$children_count=$params['children_count'];

		if (is_numeric($_POST['listing_amount'])) $listing_amount=$_POST['listing_amount'];
		elseif (!empty($_SESSION['listing_amount'])) $listing_amount=$_SESSION['listing_amount'];
		else $listing_amount=DEFAULT_LISTING_AMOUNT;

		$smarty->assign('listing_amount',$listing_amount);

		if (is_numeric($_POST['get_children_offset'])) {
			$offset=$_POST['get_children_offset'];

			//movement forward and backward
			if ($_POST['get_children_move']=='<') {
				$offset=$offset-$listing_amount;
				if ($offset<0) $offset=0;
			}
			elseif ($_POST['get_children_move']=='>') {

				$offset=$offset+$listing_amount;
			}

			elseif ($_POST['get_children_move']=='>>') {
				$offset=$children_count-$listing_amount;
				if ($offset<0) $offset=0;
			}

			elseif ($_POST['get_children_move']=='<<') {
				$offset=0;
			}
	

		}

		else $offset=0;
		$smarty->assign('offset',$offset);

	}
?>