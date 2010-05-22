<?php
$id_page=1;
include("./inc/kyberia.inc");
$kyberia=new CLASS_KYBERIA();
if (!$offset) $offset=0;
Header("Cache-control: no-cache");
?>
<html><head>
<title>
<?php
echo "kyberia.sk - ",$kyberia->getTitle();
?>
</title>
<link rel=stylesheet type="text/css" href="http://localhost/kyberia/css/griga.css">
</head>
<body>
<table cellspacing=10>
<tr>

<td valign=top width=150> 
<?php include("navbox.inc"); ?>
<br>
<?php include("introbox.inc"); ?>
<br>
<?php include("haluskabox.inc")?>
</td>

<td valign=top width=500>
<?php include("register.inc"); ?>
</td>

<td valign=top width=125> 
<?php include("select_rubrika_box.inc");?>
<br>
<?php include("mame_radi_box.inc");?>

</td></tr></table>

<?php
include("tiraz.inc");
?>
