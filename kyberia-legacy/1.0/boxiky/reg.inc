
function showForm($login='',$email='',$web='',$info='') {
	include("./inc/form.inc");
	$form=new HTML_Form($PHP_SELF,"POST","","multipart/form-data",true);
	$form->addText("login","Prihlasovacie meno:",$login);
	$form->addPassword("password1","Heslo:","",10);
	$form->addPassword("password2","Heslo pre overenie:","",10);
	$form->addText("email:","Emailova adresa",$email);
	$form->addText("web","Stranka:",$web);
	$form->addSelect("skin","Skin:",$kyberia->listSkinArray());
	$form->addFile("image","Obrazok:");
	$form->addTextarea("info","Dodatocne informacie",$info);
	$form->addSubmit("submit","Zaregistruj sa!","");
	$form->addHidden("sent","ok");
	$form->display();

}

