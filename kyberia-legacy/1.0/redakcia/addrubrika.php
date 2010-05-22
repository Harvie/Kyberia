<?php
include("../inc/redakce.inc");
$redakce=new CLASS_REDAKCE();
include("../inc/form.inc");

if($submit=="pridaj") {
	$redakce->addRubrika($HTTP_POST_VARS);
}

$form=new HTML_Form($PHP_SELF,"POST","","multipart/form-data");
	echo "<html><head><title>Pridanie rubriky</title></head><body>\n";
	$form->addText("nazov","Nazov:","");
	$form->addText("description","Popis:","");
	$form->addSelect("id_parent","Rodicovska rubrika",$redakce->listRubrikyArray());		
	$form->addSubmit("submit","pridaj","");
	$form->display();
	echo "</body></html>";


?>
