<?php
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/:/home/hromi1/kyberia/config/");
include("redakce.inc");
$redakce=new CLASS_REDAKCE();
include("form.inc");
include("configdb.inc");
if($action=="delete") {
	$redakce->deleteArticle($id);
	Header("Location:",$PHP_SELF);
}
?>

<html><head><title>Zoznam clankov</title>
<link rel=stylesheet type="text/css" href="./kyberia.css">
</head>
<body>
<?
$set=$redakce->listArticles();
echo "<table class=box>";
while ($set->next()) {
	echo "<tr><td><a href=/redakcia/update.php?id=".$set->getString("id_article").">\n";
	echo $set->getString('nazov'),"</a>\n";
	echo "&nbsp;&nbsp;(",$redakce->getRubrikaById($set->getString("id_rubrika")),",\n";
	echo $redakce->getRubrikaById($set->getString("id_rubrika_secondary")),")\n";
	echo "</td>\n";
	echo "<td><a href=",$PHP_SELF,"?action=delete&id=",$set->getString(id_article),">Delete</a>";
	echo "</tr>\n";

}
echo "</table>";
echo "<br><a href=\"addarticle.php\">Pridaj novy clanok</a>";
echo "</body></html>";
?>
