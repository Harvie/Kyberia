<?php 
//zoznam clankov
global $query;
if ($query=="") echo "<center><br>Nezadali ste ziadne slovo na vyhladavanie!!<br><br><br></center>"; 
else { $clanky=$kyberia->Search($query);
	if ($clanky->_numRows==0) echo "<br><center><br>Zadane slovo $query sa nevyskytuje v ziadnom clanku!</center><br>";
	else {
	echo "<br><center><br>Slovo $query sa vyskytuje v ",$clanky->_numRows,". clankoch!<br><br></center>";
	while ($clanky->next()) { 
	echo "<table cellpadding=5 width=100% class=box>";
	echo "<tr><td><img src='";
	if ($clanky->getString('title_image')=="") echo "/images/rubriky/",$kyberia->putTitleImage($clanky->getInt("id_rubrika"));	
	else echo $kyberia->TitleImageDir.$clanky->getString('title_image');
	echo "' hspace=5 vspace=5 align=left>";
	echo "<a class=nazev href=/article.php?id=",$clanky->getString("id_article"),">",$clanky->getString('nazov'),"</a><br>";
	echo $clanky->getString('short_desc');
	echo "</td></tr></table><br>";
	}
	}
}

?>


