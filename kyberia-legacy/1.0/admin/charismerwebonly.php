<?

ini_set("include_path","./inc:./boxiky/:./config:../inc:../boxiky/:../config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();

//toto je povodne stanovenie dK podla charizmy
$q="select count(*) as pocet,friend_id from friends group by friend_id ";

$set=$database->query($q);

//najprv sa stanovi dkarma podla charizmy
while($set->next()) {
	$q0="update user set charisma='".$set->getString('pocet')."' where id='".$set->getString('friend_id')."'";
	$database->query($q0);
}                                
	echo "<br><br>";
?>

