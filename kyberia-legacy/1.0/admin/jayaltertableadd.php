<?

ini_set("include_path","./inc:./boxiky/:./config:../inc:../boxiky/:../config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();

$q="alter table session add friends_serial text";
	echo $q."<br>";
$set=$database->query($q);
	echo "alternute<br>";


	echo "OK";
?>

