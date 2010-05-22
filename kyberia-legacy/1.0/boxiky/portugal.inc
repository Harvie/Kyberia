<a href='/portugal.php'><img border=0 src=http://kyberia.sk/images/triptoportugal.gif border=0></a><table width=100% style='border-top: 0pt;' class=box><tr><td>
<?
$set=$kyberia->query("select dennik.id as id,user.login as login,dayofmonth(datum) as den,month(datum) as month,nadpis from dennik left join user on user.id=dennik.autor where dennik_type='portugal' order by id desc");
echo "<table>";
while ($set->next()) {
	echo "<tr><td valign='top'>",$set->getString("den"),".",$set->getString('month'),".</td><td valign='top'><a href='?action=journaux&dennik_id=",$set->getString('id'),"'>",$set->getString('login'),"::<br>",$set->getString('nadpis'),"</a></td></tr>";


}
echo "</table>";
?>
</td></tr></table>
