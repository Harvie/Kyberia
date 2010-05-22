<?php 
$dd=new DiskuseDesign();
//zoznam clankov
global $clanky;

	if ($clanky->getString("id_article")==4) {
		echo "<font color=white><CENTER>TENTO CLANOK NECHCE NIKOHO NABADAT NA VYROBU DROG. JE TO INFORMACNY ABSTRAKT VOLNE DOSTUPNY V CHEMICKEJ LITERATURE. VEDZTE ZE VYROOBOU LSD PORUSUJETE ZAKON SVETA DO KTOREHO STE SA (BOHUZIAL?) NARODILI </CENTER></FONT>";
	}

	if ($clanky->getString("id_rubrika")==4) {
			echo "<table cellpadding=0 width=100% class=box>";
		echo "<tr><td><img src='";
		if ($clanky->getString('title_image')=="") echo "/images/rubriky/",$kyberia->putTitleImage($clanky->getInt("id_rubrika"));	
		else echo $kyberia->TitleImageDir.$clanky->getString('title_image');
		echo "' hspace=5 vspace=5 align=left>";
		echo "<a class=nazev href=/article.php?node_id=",$clanky->getString("id_article"),">",$clanky->getString('nazov'),"</a><br>";
		echo $clanky->getString('short_desc');
		$dd->printdiskuse($clanky->getString('id_diskuse'));
		echo "</td></tr></table><br>";
	}

	
	elseif ($diskuse=="only") {
		echo "<table cellpadding=0 width=100% class=box><tr><td>";
		$dd->printdiskuse($clanky->getString('id_diskuse'));
		echo "</td></tr></table>";
	}


	else {
	echo "<table width=100% cellpadding=0 class=box>";
	echo "<tr><td>";
	if(strlen($clanky->getString('$image1'))>3) echo "<img border=0 src='/images/clanky/".$clanky->getString('$image1')."'>\n";
	echo Stripslashes($clanky->getString('text1'));
	if(strlen($clanky->getString('$image2'))>3) echo "<img border=0 src='/images/clanky/".$clanky->getString('$image2')."'>\n";
	echo Stripslashes($clanky->getString('text2'));
	if(strlen($clanky->getString('$image3'))>3) echo "<img border=0 src='/images/clanky/".$clanky->getString('$image3')."'>\n";
	echo Stripslashes($clanky->getString('text3'));
	$dd->printdiskuse($clanky->getString('id_diskuse'));
	echo "</td></tr></table><br>";
	}

?>



