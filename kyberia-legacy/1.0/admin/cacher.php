<?
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$q="select autor,nadpis,zapis from dennik order by id desc limit 25";
$set=$database->query($q);
while($set->next()) {
	$pole[]=$set->getRecord();
}

$data=serialize($pole);
$file=fopen("/home/hromi1/kyberia/cache/1.php","a");
fwrite($file,$data);
fclose($file);

	
?>
