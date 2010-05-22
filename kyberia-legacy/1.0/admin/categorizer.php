<?
include_once("../inc/kyberia.inc");
$database=new CLASS_KYBERIA();
function getParent($category) {
	global $pole;
	global $database;
//	echo "select category_parent from category where category_id='$category' and category_parent!=0";
	$set=$database->query("select category_parent from category where category_id='$category' and category_parent!=0");
	if ($set->next()) {
//		$set->next();
		$pole[]=$set->getString('category_parent');
		getParent($set->getString('category_parent'));
	}
}
	
	
include_once("../inc/kyberia.inc");
$database=new CLASS_KYBERIA();
$q="select forum_id,forum_category from forum";
$set=$database->query($q);
//getParent(67);
//print_r($pole);

while($set->next()) {
	$pole[]=$set->getString('forum_category');
	getParent($set->getString('forum_category'));
	$pole=array_reverse($pole);
	echo "<br>".$set->getString('forum_id');
	foreach($pole as $key => $value) {
		$param.="&kat[$key]=$value";
	}
	echo "::$param";
	//$param=addslashes($param);
	$database->update("update forum set forum_category_param='$param' where forum_id='".$set->getString('forum_id')."'");
	unset ($param);
	unset($pole);

	
}	

?>
