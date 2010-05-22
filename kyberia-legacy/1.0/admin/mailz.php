<?

ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();

$set=$database->query("select distinct email, login,password from user where user_active='yes'");
while ($set->next()) {
	echo "<BR>".$set->getString('login')." :: ".$set->getString('email')." :: ".$set->getString('password');
}
?>
