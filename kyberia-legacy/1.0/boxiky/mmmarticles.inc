<table class=box><tr><td>
<center>clanky</center>
<table>
<?php
global $kyberia;
if ($kat>0) $set=$kyberia->putMostRead($kat);
else $set=$kyberia->putMostRead("",69);
$i=0;
while ($set->next()) {
	$i++;
	echo "<tr><td>$i</td><td><a href=?action=article&id=",$set->getString("id_article"),">",$set->getString("nazov"),"</a>&nbsp;(",$set->getString("hits"),")<br></td></tr>";
}
?>
</table></td></tr></table>	