<?
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/:/home/hromi1/kyberia/config/");
include_once("kyberia.inc");
include_once("configdb.inc");
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
	
	

$database=new CLASS_KYBERIA();
$q="select * from category";
$set=$database->query($q);
//getParent(67);
//print_r($pole);

while($set->next()) {
	$pole[]=$set->getString('category_id');
	getParent($set->getString('category_id'));
	print_r($pole);
	$pole=array_reverse($pole);
	echo "<br>".$set->getString('category_id');
	foreach($pole as $key => $value) {
		$param.="$value;";
	}
	echo "::$param";
	$param=addslashes($param);
	$database->update("update category set category_tree='$param' where category_id='".$set->getString('category_id')."'");
	unset ($param);
	unset($pole);

	
}	

?>
