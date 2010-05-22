<br><br>
<table class='box'><tr><td>
<form action='/' method='POST'>
<table class='box'>
<tr><td colspan='2' class='title'>Pridaj anketu</td></tr>
<tr><td>Otazka:</td><td><input class='longtext' type='text' name='question'></td></tr>
<?php
for ($i=0;$i<5;$i++) {
	echo "<tr><td>$i. moznost:</td><td><input class='long' type='text' name='response[$i]'></td></tr>";
}
?>
<tr><td colspan='2' align='center'><input type='submit' name='event' value='addPoll'>
</td></tr>
</table>
</form>
</td>
<td valign='top'>
<?php
$set=$kyberia->query("select * from polls where forum_id='$forum_id'");
echo "<table><tr><td class='title'>Otazka</td><td class='title'>Odpovedi</td>";
while ($set->next()) {
	echo "<tr><td>",$set->getString('question'),"</td><td>",$set->getString('responses'),"</td></tr>";
}
echo "</table>";
?>
</td></tr></table>




