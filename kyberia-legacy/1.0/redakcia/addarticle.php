<?php
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/:/home/hromi1/kyberia/config/");
include("redakce.inc");
$redakce=new CLASS_REDAKCE();
include("form.inc");

$LocalImageDir="/home/hromi1/kyberia/images/clanky/";


if (IsSet($title_image)) {
if (strstr($title_image_name,".jpg"))
	$cmd="/usr/local/netpbm/bin/jpegtopnm $title_image | /usr/local/netpbm/bin/pnmscale -width=75 | /usr/local/netpbm/bin/pnmtojpeg >".$LocalImageDir.$title_image_name;
elseif (strstr($title_image_name,".gif"))
			$cmd="/home/hromi1/kyberia/balast/gifsicle --resize 50x_ ".$title_image." > ".$LocalImageDir.$title_image_name;
echo $cmd;
if ($cmd) exec($cmd);
}


if($submit=="save") {
	if (IsSet($title_image_name)) $redakce->addArticle($HTTP_POST_VARS,$title_image_name);
	else $redakce->addArticle($HTTP_POST_VARS);
}

print_r($HTTP_POST_VARS);
echo "<html><head><link rel=stylesheet type=\"text/css\" href=\"./kyberia.css\"></head>";
$form=new HTML_Form($PHP_SELF,"POST","","multipart/form-data");
	echo "<html><head><title>Pridanie clanku</title></head><body>\n";
	$redakce->listArticles();
	echo "<body><table><tr>\n";
	$form->addText("nazov","Nazov:","");
	$form->addText("autor","Autor:","");
	$form->addfile("title_image","Titulni Obrazok:");
	$form->addSelect("id_rubrika","Rubrika",$redakce->listRubrikyArray());		
	$form->addSelect("gallery","Gallery",$redakce->listGalleryArray());		
	$form->addSelect("id_rubrika_secondary","Sekundarna rubrika",$redakce->listRubrikyArray());
	$form->addTextarea("short_desc","Kraktky popis","",40,6);
	$form->addTextarea("text1","Text:","",40,6);
	$form->addTextarea("text2","Text:","",40,6);
	$form->addTextarea("text3","Text:","",40,6);
	$form->addSubmit("submit","save","");
	$form->addSubmit("submit","preview","");
	$form->display();
	echo "</body></html>";


?>
