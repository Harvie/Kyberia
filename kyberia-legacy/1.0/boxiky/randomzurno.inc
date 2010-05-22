<a href='?action=journaux'><img border=0 src=http://kyberia.sk/images/zurno.jpg border=0></a>
<table width=100% class=box><tr><td>
<?
$set=$kyberia->getRandomDennik(10);
$set->next();
$string= new String;
echo "<br><center><img src='http://kyberia.sk/images/users/",strtolower($set->getString("autorname")),".gif' border=0></center>";
echo "<center><font color=white><b>",$set->getString("nadpis"),"</b></font></center><br>";
echo $string->cutString($set->getString("zapis"),250);
echo "<br><center>(<a href=http://kyberia.sk/?action=journaux&dennik_user=",$set->getString("autor"),">",$set->getString("autorname"),"</a>--><a href='?action=journaux&node_id=",$set->getString("idarticle"),"'>viac..</a>)</center>";
?>
</td></tr></table>
