<?

ini_set("include_path","./inc:./boxiky/:./config:../inc:../boxiky/:../config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();

$q="select * from session";
$set=$database->query($q);

while($set->next()) {
  echo $set->getString('user_name')."   :   ".$set->getString('friends_serial')."<br>";
}
?>
