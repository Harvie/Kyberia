<html><head>
<?

ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$set=$database->query("select user.login as login,forum.* from forum left join user on user.id=forum.forum_owner order by forum_id");
echo "<form method='post'><table>";
while ($set->next()) {
	echo "<tr>";

	echo "<td>",$set->getString('forum_id'),"</td>";
	echo "<td>",$set->getString('forum_name'),"</td>";
	echo "<td>",$set->getString('login'),"</td>";
	echo "</tr>";
}

echo "</table>";

?>
