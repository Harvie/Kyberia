<?php
include("../inc/redakce.inc");
$redakce=new CLASS_REDAKCE();
include("../inc/form.inc");
$ltid="/home/webs/www.kyberia.sk/images/rubriky/";
echo $submit;
if($submit=="pridajrubriku") {
        echo $ltid;
	if (IsSet($obrazok)) Copy($obrazok,$ltid.$obrazok_name);
	$redakce->addRubrika($HTTP_POST_VARS,$obrazok_name,$obrazok_articles_name);
}
if($submit=="pridajtitle") {
	$redakce->addTitle($HTTP_POST_VARS);
}
if($submit=="pridajintro") {
	$redakce->addIntro($HTTP_POST_VARS);
}
if($submit=="pridajskin") {
	$redakce->addSkin($nazov,$address);
}

	$form=new HTML_Form($PHP_SELF,"POST","","multipart/form-data");
	echo "<html><head><title>Pridanie rubriky</title></head><body>\n";
	$form->addText("nazov","Nazov:","");
	$form->addFile("obrazok","Obrazok:","");
	$form->addSelect("id_parent","Rodicovska  rubrika",$redakce->listRubrikyArray());		
	$form->addSubmit("submit","pridajrubriku","");
	$form->display();
	echo "<br>";

	$form2=new HTML_Form($PHP_SELF,"POST","","multipart/form-data");
	$form2->addText("title","Titulok:","");
	$form2->addSubmit("submit","pridajtitle","");
	$form2->display();
	echo "<br>";

	$form3=new HTML_Form($PHP_SELF,"POST","","multipart/form-data");
	$form3->addTextarea("text","Text uvodniku:","",60,60);
	$form3->addText("id_autor","ID Autora:","");
	$form3->addSubmit("submit","pridajintro","");
	$form3->display();
	echo "<BR>";
	
	$form4=new HTML_Form($PHP_SELF,"POST","","multipart/form-data");
	$form4->addText("nazov","Nazov:","");
	$form4->addText("address","Adresa:","");
	$form4->addSubmit("submit","pridajskin","");
	$form4->display();
	echo "<br>";

	echo "</body></html>";



?>
