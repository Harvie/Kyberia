<?

ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$q="select meno from larry";

$set=$database->query($q);
while($set->next()) {
	$rand="+421".rand(903123456,905876543);
	$q="update larry set phone='$rand' where meno='".$set->getString('meno')."'";
	echo $q."<br>";
	$database->query($q);
}
?>
