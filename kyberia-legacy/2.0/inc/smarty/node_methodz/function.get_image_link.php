<?php

	function smarty_function_get_image_link($params,&$smarty) {
		$id=$params['id'];
		echo "/images/nodes/".substr($id,0,1)."/".substr($id,1,1)."/$id.gif";
	}
?>