<?php
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/");
include("redakce.inc");
$redakce=new CLASS_REDAKCE();
include("form.inc");
$LocalImageDir="/home/hromi1/images/clanky/";

if ($id) {
$article=$redakce->getArticleData($id);
$article->next();
echo "<html><head><link rel=stylesheet type=\"text/css\" href=\"./kyberia.css\"></head>";
$form=new HTML_Form($PHP_SELF,"POST","","multipart/form-data");
	echo "<html><head><title>Pridanie clanku</title></head><body>\n";
	$redakce->listArticles();
	echo "<body><table><tr>\n";
	$form->addText("nazov","Nazov:",$article->getString("nazov"));
	$form->addText("autor","Autor:",$article->getString("autor"));
	$form->addfile("title_image","Titulni Obrazok:");
	$form->addfile("image1","Obrazok:");
	$form->addfile("image2","Obrazok:");
	$form->addhidden("id",$id);
	$form->addfile("image3","Obrazok:");
	$form->addSelect("id_rubrika","Rubrika",$redakce->listRubrikyArray());		
	$form->addSelect("id_rubrika_secondary","Sekundarna rubrika",$redakce->listRubrikyArray());
	$form->addTextarea("short_desc","Kraktky popis",$article->getString("short_desc"),40,6);
	$form->addTextarea("text1","Text:",stripslashes($article->getString("text1")),80,23);
	$form->addTextarea("text2","Text:",stripslashes($article->getString("text2")),40,6);
	$form->addTextarea("text3","Text:",stripslashes($article->getString("text3")),40,6);
	$form->addTextarea("keywords","Keywords:",stripslashes($article->getString("keywords")),40,6);
	$form->addSubmit("submit","pridaj","");
	$form->display();
	echo "</body></html>";
}



if ($submit=="pridaj") {

if (IsSet($title_image)) {
 	Copy($title_image,$LocalImageDir.$title_image_name);	
}

if (IsSet($image1)) {
 	Copy($image1,$LocaImageDir.$image1_name);	
}
if ($image2!="") {
 	Copy($image2,$LocaImageDir.$image2_name);	
}
if ($image3!="") {
 	Copy($image3,$LocaImageDir.$image3_name);	
}



	$redakce->updateArticle($HTTP_POST_VARS);
}



?>
