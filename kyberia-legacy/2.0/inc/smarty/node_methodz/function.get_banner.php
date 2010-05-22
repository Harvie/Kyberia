<?
	function smarty_function_get_banner(&$smarty) {
		$banners_directory = $_SERVER['DOCUMENT_ROOT']."/banners/";
		
		$handle = opendir($banners_directory);
		while (false !== ($target = readdir($handle))) {
			if ($target != "." && $target != "..") {
				list($name, $ext) = explode(".", $target);
				if($ext == "swf") {
					$banners_array[] =  $target;
				}
			}
		}

		$rand = rand(0, count($banners_array) - 1);

		$smarty->assign('get_banner', $banners_array[$rand]);
	}
?>
