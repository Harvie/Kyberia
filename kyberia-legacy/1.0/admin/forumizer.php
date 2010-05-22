<?
include_once("../inc/kyberia.inc");
$database=new CLASS_KYBERIA();
$q="select forum_id from category";
$set=$database->query($q);
while($set->next()) {
	$q="select count(*) as pocet from forum where forum_category='".$set->getString('category_id')."'";
	$set2=$database->query($q);
	$set2->next();
	$q="select count(*) as pocet from category where category_parent='".$set->getString('category_id')."'";
	$set3=$database->query($q);
	$set3->next();
	$q="update category set category_subcats='".$set3->getString('pocet')."',category_forums='".$set2->getString('pocet')."' where category_id='".$set->getString('category_id')."'";
	echo $q."<br>";
	$database->query($q);
}
?>
