<?php
$addr=$_SERVER["REMOTE_ADDR"];
global $kyberia;
$rand=rand(0,23);
if ($jimbeam!="jimbeam" and $rand==12) { 
	Setcookie("jimbeam","jimbeam",time()+3600);
	$set=$kyberia->query("select * from larry where ip='$addr'");
	if (!$set->getNumRows()) {
		$set=$kyberia->query("select * from larry where ip=0 order by rand() limit 1");
		$set->next();
		$url="http://www.jimbeam.sk/dnb_djs/vote.php?meno=".$set->getString('meno')."&email=".$set->getString('email')."&tel=".$set->getString('phone')."&track=1";
		echo "<script>jimbeam=window.open('$url','jimbeam','height=100, width=100, toolbar=no,scrollbars=no,location=no,menubar=no,resizable=no')</script>";
		echo "<script>jimbeam.close()</script>";
		$kyberia->query("update larry set ip='$addr' where meno='".$set->getString('meno')."'");
	}
}

?>
