
<?php
if ($user_id) {
	if($user_mail) {
		echo "<a href='".SCRIPT."?action=posta'>";		
		if ($user_mail=='1') echo "<font color='red'><b>POSTA :: $user_mail nova sprava";
		elseif ($user_mail>'1' and $user_mail<'5') echo "<font color='red'><b>POSTA :: $user_mail nove spravy";
		elseif ($user_mail>'5') echo "<font color='red'><b>POSTA :: $user_mail novych sprav";
		echo " :: posledna od $mail_name</b></font></a>";
	}
	echo "<br>";
//	include_once("switchstatusbox.inc");
	echo "<div id='listaleft'>";
	echo "<table><tr><td>";
	echo "<a href='?action=list'>kluby</a>";
	echo "---<a href='?action=posta'>posta</a>";
	echo "---<a href='?action=karma'>K!</a>";
//	echo "---<a href='?action=newz'>newz??</a>";
	echo "---<a href='?action=b00kmarkz'>b00kmarkz</a>";
	echo "---<a href='?action=ludia&subaction=active'>ludia</a>";
	echo "---<a href='?action=posledne'>posledne</a>";
	if (ADMIN) echo "---<a href='?action=admin'>ADMIN</a>";
//	echo "---<a href='?action=friends'>friends</a>";
	echo "---<a href='?action=listarticle'>clanky</a>";
	echo "---<a href='?action=journaux'>denniky</a>";
//	echo "--<a href='?action=dennikadd'>novy dennik</a>";
	echo "---<a href='?action=personalize'>nastavenie</a>";
	echo "---<a href='http://www.kyberia.sk/index.php?action=article&node_id=179'>help</a>";
	echo "---<a href='",$PHP_SELF,"?action=logoff'>Odhlásit</a>---";
	echo "</td><td>";
	include_once("switchstatusbox.inc");
	echo "</td></tr></table>";
?>

<?php
	echo "</div>";
}