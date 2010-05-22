<html><head><title>user administration</title>
<link rel=stylesheet type="text/css" href="../css/gr.css">
</head>
<body>
<?
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/:/home/hromi1/kyberia/config/");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();

$event=$_POST['event'];
if ($event=='accept') {
	$email=$_POST['email'];
	$mailbody="zdravim ta clovece\ndocela rad ti oznamujem ze si bol(a) zaregistrovany(a) do diskusneho systemu kyberia.sk s loginom ".$_POST['login']."..takze ked chces, zaloguj sa dnu & uzivaj si kyberpriestor..help k systemu najdes tu: http://www.kyberia.sk/index.php?action=article&node_id=179.....ako prve by som ti asi poradil nastavit si ikonku v sekcii \"nastavenie\"...tot vse..\n\ns pozdravom\nhromi@kyberia.sk\n\n";
	if (!empty($_POST['message'])) $mailbody.="poznamka od registratora> ".$_POST['message'];	
//	mail("hromi@kyberia.sk",'registracia na kyberia.sk',$mailbody,"From: hromi@kyberia.sk\nReturn-path: kyberia@kyberia.sk");
	mail($email,'registracia na kyberia.sk',$mailbody,"From: kyberia@kyberia.sk\nReturn-path: kyberia@kyberia.sk");

	$id=$_POST['id'];
	$database->query("update user set user_active='yes' where id='$id'");
}

elseif ($event=='refuse') {
	$email=$_POST['email'];
	$mailbody="zdravim ta clovece\nbohuzial ti musim oznamit ze si nebol zaregistrovany do systemu kyberia.sk....pokial mas este stale zaujem o to stat sa clenom kyberie, pokus sa znova, mozno budes mat tentokrat stastie,alebo budem mat empatickejsiu naladu ;-)\n\ns pozdravom hromi@kyberia.sk";
	if (!empty($_POST['message'])) $mailbody.="P.S> ".$_POST['message'];	
	mail($email,'registracia na kyberia.sk',$mailbody,"From: kyberia@kyberia.sk\nReturn-path: kyberia@kyberia.sk");
	echo $mailbody;

	$id=$_POST['id'];
	$database->query("delete from user where id='$id'");

}


elseif ($event=='delete') {
	$database->query("delete from user where id='$id'");	
}


echo "<table  border=1><tr><td>id</td><td>login</td><td>web</td><td>info</td><td>change status</td></tr>";
$q="select * from user where user_active!='yes' order by id desc";
$set=$database->query($q);
while($set->next()) {
	echo "<tr><td>".$set->getString('id')."</td><Td><a href='mailto:".$set->getString('email')."'>".$set->getString('login')."</a></td><td>".$set->getString('user_www')."</td><td>".$set->getString('user_info')."</td><td><form action='/admin/user_admin.php' method='post'><input type=hidden name='id' value='".$set->getString('id')."'><textarea name=message rows=10 cols=10 style='width: 100pt;'></textarea><br><input type=hidden name=email value='".$set->getString('email')."'><input type='hidden' name='login' value='".$set->getString('login')."'><input type=submit name=event value=accept><input type=submit name=event value=refuse><input type=submit name=event value=delete></form></tr>";
}

echo "</table>";
	
?>
</body></html>