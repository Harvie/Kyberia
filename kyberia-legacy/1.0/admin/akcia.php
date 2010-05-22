<html><head><title>mindfuck v0.23</title>

</head>
<body>
<?
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$set=$database->executeQuery("select mindfuck.meno as meno ,user.login as registrator from mindfuck left join user on user.id=mindfuck.user_id order by meno asc");

echo "<table border=1>";
while ($set->next()) {
	echo "<tr style='border-width: 1pt; border-color: black;'><td>".$set->getString('meno')."<td>".$set->getString('registrator')."<td style='border-width: 1pt; border-color: black;' width=300 ></tr>";
}

echo "</table>";
	
?>
</body></html>