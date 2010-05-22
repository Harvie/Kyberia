<?php

	function smarty_function_get_alik_image($params,&$smarty) {
		$id=$params['id'];
		echo "/data/alik/icons/".substr($id,0,2).".gif";
	}
?>