<?

ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/:/home/hromi1/kyberia/config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$set=$database->query("alter table forum modify forum_public enum('private', 'public', 'moderated') default 'public'");
$set=$database->query("update user set admin = 'yes' where id = '840'");

?>
