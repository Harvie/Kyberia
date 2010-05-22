<table class=box><tr><td>
<center>top 10 <a href=http://kyberia.sk/gallery>galleries</a></center>
<table>
<?php
global $kyberia;
$set=$kyberia->getTopGalleries();
$i=0;
while ($set->next()) {
	$i++;
	echo "<tr><td>$i</td><td><a href=http://kyberia.sk/gallery/view_album.php?set_albumName=",$set->getString("name"),">",$set->getString("title"),"</a>&nbsp;(",$set->getString("hits"),")<br></td></tr>";
}
?>
</table></td></tr></table>	