<table width=100% class=box><tr><td>
<?

$set=$kyberia->query("SELECT id_rubrika, title_image,short_desc,autor FROM articles where id_article='".$_GET['node_id']."'");
$set->next();
if ($set->getString("id_rubrika")==4) $kyberia->putRubrikaDesc(4);
else {
	if ($set->getString("title_image")!="") echo "<center><br><img src=",$kyberia->TitleImageDir.$set->getString('title_image'),"></center><br>";
	else echo "<br><center><img src=/images/rubriky/",$kyberia->putTitleImage($set->getInt("id_rubrika")),"></center><br>";
	echo $set->getString("short_desc");
	if (!Is_Int($set->getInt('autor'))) echo "<br><br><Center>(&nbsp;",$set->getString("autor"),"&nbsp;)</center>";
}

?>
<br><br><center><a href='/print.php?id=<?=$_GET['node_id']?>'>pripravit clanok pre tlac</a></center><br>
</td></tr></table>
