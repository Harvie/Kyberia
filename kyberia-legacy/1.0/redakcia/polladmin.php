<?
require "../header_db.php";

Header ("Pragma: no-cache");
Header ("Cache-Control: no-cache");
Header ("Expires: ".GMDate("D, d M Y H:i:s")." GMT");

if ($insert=="yes") {
echo "<form action=$PHP_SELF>";
echo "Otazka: <input type=text name=question>";
echo "id rubriky: <input type=text name=id_rubrika>";
echo "<br>Aktivni:&nbsp;&nbsp;ano:<input type=radio name=active value=yes>ne:<input type=radio name=active value=no><br>";
echo "Odpoved 1 <input type=text name=option1><br>";
echo "Odpoved 2 <input type=text name=option2><br>";
echo "Odpoved 3 <input type=text name=option3><br>";
echo "Odpoved 4 <input type=text name=option4><br>";
echo "Odpoved 5<input type=text name=option5><br>";
echo "<input type=submit name=insert value=Pridej>";
}

elseif (IsSet($info)) {
$sqlcmd = "Select * from polls where id_poll='$info'";	
$result =mysql_query($sqlcmd);
$riadok=mysql_fetch_array($result);
echo "<center><h3>Anketa: $riadok[question]</h3>";
echo "odpovedalo $riadok[responses] lidi";
$sqlcmd = "Select * from poll_options where id_poll='$info'";	
$result =mysql_query($sqlcmd);
echo "<table>";
while ($riadok=mysql_fetch_array($result)) {
	echo "<tr><Td>$riadok[text]</td><td>$riadok[number] lidi </td></tr>";
}
echo "</centeR>";
}


elseif ($insert=="Pridej") {
	 $sqlcmd = "insert into polls set responses=0,question='$question', active='$active',id_rubrika='$id_rubrika'";
	$result =mysql_query($sqlcmd);
	$id_poll=mysql_insert_id();
	if (IsSet($option1)) {
 	 $sqlcmd = "insert into poll_options set text='$option1', id_poll='$id_poll' ,number='0'";
	mysql_query($sqlcmd);		
	}
	if (IsSet($option2) AND $option2!="") {
 	 $sqlcmd = "insert into poll_options set text='$option2', id_poll='$id_poll' ,number='0'";
	mysql_query($sqlcmd);		
	}
	
	if (IsSet($option3) AND $option3!="") {
 	 $sqlcmd = "insert into poll_options set text='$option3', id_poll='$id_poll' ,number='0'";
	mysql_query($sqlcmd);		
	}
	
	if (IsSet($option4) AND $option4!="") {
 	 $sqlcmd = "insert into poll_options set text='$option4', id_poll='$id_poll' ,number='0'";
	mysql_query($sqlcmd);		
	}
	
	if (IsSet($option5) AND $option5!="") {
 	 $sqlcmd = "insert into poll_options set text='$option5', id_poll='$id_poll' ,number='0'";
	mysql_query($sqlcmd);		
	}
}
 

else {
if ($up=="Uloz" AND IsSet($update)) {


$sqlcmd="update polls set active='$$update' where id_poll='$update'";
mysql_query($sqlcmd);
}
$sqlcmd = "Select active,id_poll,question from polls order by time desc";
$result= mysql_query($sqlcmd);
echo "<table><tr><th>ID</th><th>Otazka</th><th>Aktivni?</th></tr>";
while ($record = mysql_fetch_array($result)) {
	echo "<form action=$PHP_SELF method=post>";
	echo "<td>",$record["id_poll"],"</td>";
	echo "<td><a href=/~hromi/activa/admin2/polladmin.php?info=",$record["id_poll"],">",$record["question"],"</td>";
	echo "<td>Ano:<input type=radio name=active$record[id_poll] value=yes";
	if  ($record["active"]=="yes") echo " checked";
	echo ">";
	echo "&nbsp;Ne:<input type=radio name=active$record[id_poll] value=no";
	if  ($record["active"]=="no") echo " checked";
	echo "><input name=up type=submit value=Uloz><input type=hidden name=update value=$record[id_poll]</form></td></tr>";
}
echo "</table>";
echo "<br><a href=$PHP_SELF?insert=yes>Pridat novu anketu.</a>";
}
?>