<?php
include("./inc/redakce.inc");
$redakce=new CLASS_REDAKCE();
include("./inc/form.inc");

$LocalImageDir="/testwebs/kyberia/images/";
$LocalTitleImageDir="/testwebs/kyberia/title_images/";
if($submit=="update") {

 	Copy($title_image,$LocalTitleImageDir.$title_image_name);	
 	Copy($image,$LocaImageDir.$image_name);	
	$redakce->updateArticle($HTTP_POST_VARS,$title_image_name,$image_name);
}

$set=$redakce->getArticle($id);
$set->next();
echo "<html><head><link rel=stylesheet type=\"text/css\" href=\"./kyberia.css\"></head>";
$form=new HTML_Form($PHP_SELF,"POST","","multipart/form-data");
	echo "<html><head><title>Pridanie clanku</title></head><body>\n";
	$redakce->listArticles();
	echo "<body><table><tr>\n";
	$form->addText("nazov","Nazov:",$set->getString('nazov'));
	$form->addText("autor","Autor:",$set->getString('nazov'));
	$form->addSelect("id_rubrika","Rubrika",$redakce->listRubrikyArray());		
	$form->addSelect("id_rubrika_secondary","Sekundarna rubrika",$redakce->listRubrikyArray());
	$form->addText("id_forum","ID forum:",$set->getString('id_forum'));
	$form->addText("id_forum_secondary","ID forum sekundarne:",$set->getString('id_forum_secondary'));
	$form->addTextarea("short_desc","Kratky popis",$set->getString('short_desc'),40,6);
	$form->addTextarea("text","Text:",$set->getString('text'),40,6);
	$form->addSubmit("submit","update","");
	$form->display();
	echo "</body></html>";


?>
