23. FEBRUÁRA BUDE V DUNE KYBERIA PARTY. VSTUP LEN PRE KYBERIA MEMBERS and FRIENDS. 
PREDBEZNY LINE UP: <br>
21.00 L*RRY + RICKY FITZ<br> 
22.30 MINKZ <br>
00.00 IM CYBER + MINARIK <br>
02.00 C-PHONE (DVOIKA.TROIKA) 04.00 WENIA (ex-dust) 2nd floor: STAB ECOM SMART <br>
????? <br><br>

VJs: Zden/Satori, Hromi <br><br>

- BOOKOVANIE LISTKOV ÈOSKORO <br>
- MO®NÉ PREKVAPENIA <br>
- BOROVIÈKA 23,- SK <br>
- Exeho Street Art Project 23 <br>
- Kyberia futbal cup <br>
<?php
$set=$kyberia->query("select count(*) as pocet from mindfuck");	
$set->next();
$pocet=$set->getString('pocet');
$set=$kyberia->query("select * from mindfuck where user_id='$user_id' limit 3 ");
if (!$set->getNumRows()) {
	echo "<center><form method='post' action='".SCRIPT."?action=session'><input type='submit' value='Prihlas sa na session'><input type=hidden name='event' value='register'></form></center>";
}

else  {
	if ($set->getNumRows()<3) echo "<center><form method='post' action='".SCRIPT."?action=session'>zadaj meno: <input class=longtext type=text name=meno><input type='submit' value='Prihlas na session dalsieho cloveka'><input type=hidden name='event' value='adduser'></form></center><br><br>";
	echo "<table align='center' class=box><tr><td align='center'>id</td><td align='center'><font color=red><b>mindfuck participant</b></td><td></tr>";
	while ($set->next()) {
		echo "<form method='post' action='".SCRIPT."?action=session'><tr><td align='center' valign='middle'>$user_name</td><td align='center' valign='middle'><input type='text' value='".$set->getString('meno')."' name='meno'></td><td><input name='event' type='submit' value='zmen meno'><input name='event' type='submit' value='delete'><input type=hidden name=mindfuck_id value='".$set->getString('mindfuck_id')."'></td></form></tr>";
	}
	echo "</table>";
}



echo "<br><table border=1 class=box align='center'><tr><td align='center'><font color=white><b>clovek</b></font></td><td align='center'><font color=white><b>pocet zaregistrovanych</b></font></td><td align='center'><font color=red><b>$$$ cashe $$$</b></font></td></tr>";
$set=$kyberia->query("select count(mindfuck_id) as pocet,user.login as login from mindfuck left join user on mindfuck.user_id=user.id group by mindfuck.user_id order by login asc");
if (!$set->getNumRows()) {
	echo "<center>Nikto nieje zaregistrovany dopicee!</center>";
}
else {
	while ($set->next()) {
		echo "<tr><td align='center'>".$set->getString('login')."</td><td align='center'>".$set->getString('pocet')." x Bytost</td><td align='center'>".($set->getString('pocet')*100)." Sk-</td></tr>";
	}
	echo "<tr><td><font color=red><b>SPOLU</b></font><td align='center'><font color=red><b>$pocet x Bytost</b></font></td><td align='center'><font color=red><b>".($pocet * 100)." Sk,-</b></font></td></tr>";

echo "</table>";
}
/*
echo "<center>Financial status: ".(($pocet*100)-6200)." Sk,-</center><br>";
echo "<center>Places left: ".(193-$pocet)." ludi.</center><br>";
*/
include_once("forum.inc");
?>