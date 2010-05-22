<?

ini_set("include_path","./inc:./boxiky/:./config:../inc:../boxiky/:../config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();

//toto je povodne stanovenie dK podla charizmy
$q="select count(*) as pocet,friend_id from friends group by friend_id ";
$q2="select count(*) as psubm,u.login as ulogin, u.id as uid, u.user_karma as ukarma, u.user_k as uk from submissions as s inner join user as u on 
u.id = s.submission_owner group by s.submission_owner";
$q3="select count(*) as psubmall,sum(s.submission_k) as allkarma from submissions as s, user as u where s.submission_owner=u.id";

//vynulovanie povodnych kariem
//co ak niekto zacne prispievat hrozne nahovno
$q4="update user set user_k='0'";
//$database->query($q4);

$set=$database->query($q);
$set3=$database->query($q3);

$set3->next();
$pomerall= ($set3->getString('allkarma')) /($set3->getString('psubmall'));
//Vsetka karma v systeme
	echo "allkarma:  ".$set3->getString('allkarma')."<br>";
//celkovy pocet prispevkov
	echo "psubmall:  ".$set3->getString('psubmall')."<br>";
//pomer karmy na prispevok celek kyberky
	echo "pomerall:  ".$pomerall."<br>";

//najprv sa stanovi dkarma podla charizmy
while($set->next()) {
	$q0="update user set charisma='".$set->getString('pocet')."' where id='".$set->getString('friend_id')."'";
	echo $q0."<br>";
//	$database->query($q0);
	$q0="update user set user_k='".$set->getString('pocet')."' where id='".$set->getString('friend_id')."'";
	echo $q0."<br>";
//	$database->query($q0);
}                                
	echo "<br><br>";

//potom vyberiem z db rozne kraviny
$set2=$database->query($q2);

//a potom to cele rozdrbem neprehladnym vzorcom
while($set2->next()) {
$psubm=$set2->getString('psubm');
if ($psubm>100){
	echo "ulogin:  ".$set2->getString('ulogin')."<br>";
//userova dkarma podla charismy
	echo "uk:  ".$set2->getString('uk')."<br>";
//userovi pridelena karma celkovo
	echo "ukarma:  ".$set2->getString('ukarma')."<br>";
//pocet userovych prispevkov
	echo "psubm:  ".$set2->getString('psubm')."<br>";
$pomeruser=( $set2->getString('ukarma'))/($set2->getString('psubm'));
$from_average=($pomeruser/$pomerall);
$newuk=floor($from_average*23);
//pomer karmy na prispevok celek kyberky
	echo "pomeruser:  ".$pomeruser."<br>";
//pomer kvality prispevkov usera a celej kyberky
	echo "from_average:  ".$from_average."<br>";
//nova dkarma bez upravy nulovania podpriemeru
	echo "newuk:  ".$newuk."<br>";
//aby dostali K+ len nadpriemerny prispievatelia
if ($newuk>23) {$newuk=$newuk-23;}
else {$newuk=0;}
if ($newuk>46) {$newuk=46;}
$newuk+=($set2->getString('uk'));
	$q0="update user set user_k='".$newuk."' where id='".$set2->getString('uid')."'";
	echo $q0."   ".$set2->getString('ulogin')."<br><br>";
//	$database->query($q0);
}
}
//malo by z toho byt nieco taketo
//dk= (((userk/usersubm)/(allk/allsubm))) *23 , ?dk>23:$dk-23!$dk=0
?>


