<?

ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/:/home/hromi1/kyberia/config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$set=$database->query("update user set login = 'gudmud' where id = '2031'");


?>
