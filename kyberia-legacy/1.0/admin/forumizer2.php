<?
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/:/home/hromi1/kyberia/config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$q="select * from forum";
$set=$database->query($q);
while($set->next()) {
	$q="select count(*) as pocet from submissions where  forum_id='".$set->getString('forum_id')."'";
	$set2=$database->query($q);
	$set2->next();
    $q="select submission_timestamp from submissions where forum_id='".$set->getString('forum_id')."' order by submission_timestamp desc limit 1";
    $set3=$database->query($q);
    $set3->next();
    $q="update forum set last_submission='".$set3->getString('submission_timestamp')."', forum_submissions='".$set2->getString('pocet')."' where forum_id='".$set->getString('forum_id')."'";
	echo $q."<br>";
	$database->query($q);
}
?>