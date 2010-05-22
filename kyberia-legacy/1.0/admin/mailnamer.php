<?
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$q="select mail_to as user_id,count(*) as pocet from mail where mail_new='yes' group by mail_to";
$set=$database->query($q);
while($set->next()) {
	$q="update user set user_mail='".$set->getString('pocet')."' where id='".$set->getString('user_id')."'";
	$set2=$database->query($q);
}
?>
