<table width=100% class=box><tr><td>
<?
$set=$kyberia->query("SELECT articles.id_rubrika,rubriky.nazov as rubrnazov from articles left join rubriky on rubriky.id_rubriky=articles.id_rubrika where id_article='".$_GET['node_id']."'");
$set->next();
echo "<center>kategoria: &nbsp;<b><a href=".SCRIPT."?action=rubrika&kat=",$set->getString("id_rubrika"),">",$set->getString("rubrnazov"),"</a></center></b><br>";
$rubrika=$set->getString("id_rubrika");
$set=$kyberia->query("SELECT id_article,nazov, hits from articles where id_rubrika=$rubrika ORDER by id_article DESC");
$i=0;
while ($set->next()) {
	++$i;
	echo $i,".&nbsp;<a href=".SCRIPT."?action=$action&node_id=",$set->getString("id_article"),">",$set->getString("nazov"),"</a><br>";
}

?>
</td></tr></table>
