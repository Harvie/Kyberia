<?

ini_set("include_path","./inc:./boxiky/:./config:../inc:../boxiky/:../config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();

$q="select * from session";
$set=$database->query($q);

while($set->next()) {
    $user_id=$set->getString('user_id');
    $q2="select friend_id from friends where user_id=$user_id";
    $set2=$database->query($q2);
    $friends_serial="";
    while ($set2->next()){
      $friends_serial.=($set2->getString('friend_id')).";";
    }
		$database->query("update session set friends_serial='$friends_serial' where user_id=$user_id");

  echo $set->getString('user_name')."   :   ".$set->getString('friends_serial')."<br>";
}
?>




