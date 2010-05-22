<?

ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/:/home/hromi1/kyberia/config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$q="select acceptor_id,sum(k_amount) as pocet from k_logs group by acceptor_id";

$set=$database->query($q);
while($set->next()) {
	$q="update user set user_karma='".$set->getString('pocet')."' where id='".$set->getString('acceptor_id')."'";
	echo $q."<br>";
	$database->query($q);
}
?>
