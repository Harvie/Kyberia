<?php 
//zoznam clankov
global $last_login;
global $offset;
global $user_id;
$jump = 15;

if ($_SERVER["DOCUMENT_ROOT"] =="/home/hromi1/kyberia/mmm") {
	$_GET['node_id']=31;
}

if (!empty($_GET['node_id'])) {
	$clanky=$kyberia->getRubrikaArticles($_GET['node_id'],$offset);
	$katlink="&node_id=".$_GET['node_id'];
}
else {
	
	if (!$user_id) $clanky=$kyberia->getArticles($offset,11);
	else $clanky=$kyberia->getArticles($offset,20);
	$katlink="";
}

if ($clanky->_numRows==0) echo "<br><br>Tato sekcia momentalne neobsahuje ziadny clanok! Ale bude! Pytas sa preco je link na nu v navigacnom boxe ked tu este nic nieje? Pytam sa preco klikas na ten link ked tu este nic nieje!! A mas to. <br><br>";
$i=0;
echo "<br>";
while ($clanky->next()) { 

	if ($i==2) { ?>

<?php		
	}
	$i++;
	echo "<table ";
	if ($i<2) {
		echo "class=redbox";
	}
	else echo "class=box";
	echo " cellpadding=5 width=100%>";
	if ($clanky->getString("id_article")==126) echo "<tr><td><a class=nazev href=http://kyberia.sk/gallery/view_album.php?set_albumName=mmm02><img";
	else echo "<tr><td><a class=nazev href=?action=article&node_id=",$clanky->getString("id_article"),"><img";
	if ($clanky->getString('id_rubrika')==30) echo " width=75 ";
	echo " border=0 src='";
	if ($clanky->getString('title_image')=="") echo "/images/rubriky/",$kyberia->putTitleImage($clanky->getInt("id_rubrika"));	
	else echo $kyberia->TitleImageDir.$clanky->getString('title_image');
	echo "' hspace=5 vspace=5 align=left></a>";
	if ($clanky->getString("id_article")==126) echo "<a class=nazev href=http://kyberia.sk/gallery/view_album.php?set_albumName=mmm02>",$clanky->getString('nazov'),"</a>";
	else echo "<a class=nazev href=?action=article&node_id=",$clanky->getString("id_article"),">",$clanky->getString('nazov'),"</a>";
	$autor=$clanky->getVariable('autor');
	if ($autor) echo "&nbsp;(&nbsp;<a href=?action=journaux&dennik_user=$autor>",$kyberia->getNameById($autor),"</a>&nbsp;)<br>";
	else echo "&nbsp;(&nbsp;",$clanky->getString('autor'),"&nbsp;)<br>";
	echo $clanky->getString('short_desc');
//	echo $clanky->getString('id');
	if ($clanky->getString("id_article")!=126) {
		echo "<table width=100%><tr>";
		$new=$kyberia->getNewSubmissions($clanky->getString('id_diskuse'),$last_login);
		echo "<td align=left><a href=?action=article&node_id=",$clanky->getString('id_article'),"&diskuse=only>".$clanky->getString('prispevky'); 
		echo " submissionz </a> ";
		if ($new) echo "<font color=red>($new new) </font>";
		echo "<-- <font color=white>".$clanky->getString('hits')."</font> hitz";
	
		echo "</td>";
		if (!$kat) {
		echo "<td align=right><a href='?action=rubrika&node_id=";
		echo $clanky->getString('id_parent'),"'>";
//		echo $kyberia->getRubrikaByID($clanky->getString('id_parent'));
		echo "</a>&nbsp;-->&nbsp;<a href='?action=rubrika&node_id=";
		echo $clanky->getString('id_rubrika'),"'>",$clanky->getString('nazr'),"</a>&nbsp;&nbsp;";
		}
		echo "</td></tr></table>";
	}
	echo "</td></tr></table>";
	if ($i<$clanky->_numRows) echo "<br>";
	

}

if($user_id) {
	echo "<table width=100%><tr>";
	if ($offset) echo "<td align=left><a href=$PHP_SELF","?action=listarticle&offset=",$offset-$jump,$katlink,"><-- Predchadzajuce clanky</a></td>";
	if ($clanky->_numRows>$jump) echo "<td align=right><a href=$PHP_SELF","?action=listarticle&offset=",$offset+$jump,$katlink," >Dalsie clanky --></a></td>";
	echo "</tr></table><br>";

}
?>
