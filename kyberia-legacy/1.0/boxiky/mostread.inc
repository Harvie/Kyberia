<table class=box><tr><td>
<center>top10</center>
<table>
<?php
global $kyberia;
if ($kat>0) $set=$kyberia->putMostRead($kat);
else $set=$kyberia->putMostRead();
$i=0;
while ($set->next()) {
	$i++;
	echo "<tr><td>$i</td><td><a href=?action=article&id=",$set->getString("id_article"),">",$set->getString("nazov"),"</a>&nbsp;(",$set->getString("hits"),")<br></td></tr>";
}
?>
</table></td></tr></table>	
