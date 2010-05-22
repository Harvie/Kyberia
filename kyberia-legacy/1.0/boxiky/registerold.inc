<script language="JavaScript"><!--
function validate(formular) {
	if (formular.login.value=="")
	{
		alert("Prihlasovacie meno musite vyplnit!");
		formular.login.focus();
		return false;
	}
	else if (formular.email.value=="")
	{
		alert("Emailovu adresu musite vyplnit!");
		formular.email.focus();
		return false;
	}
	else if (window.RegExp) {
		re= new RegExp("^[^@]+@[^.]+\..+$");
		if (!re.test(formular.email.value)) {
			alert("Zadany email nieje spravna adresa elektronickej posty!");
			formular.email.focus;
			return false;
		}
	}
	else if (formular.password1.value!=formular.password2.value)
	{
		alert("Vase hesla niesu rovnake, prosim napiste ich znovu!");
		formular.password1.focus();
		return false;
	}	
	else return true;
}
//-->
</script>

<?php
include("./inc/form.inc");
$form=new HTML_Form($PHP_SELF,"POST","","multipart/form-data",true);

if (!$kyberia) {
	include("./inc/kyberia.inc");
	$kyberia=new CLASS_KYBERIA();
}


if (!$sent) $form->showForm('','','','',$kyberia->listSkinArray());

if ($sent=="ok") {
	if (($password1==$password2) AND ($kyberia->isLogin($login))) {
		if ($image=='') echo "Nezadali ste ziadny obrazok a preto budete vystupovat na diskusnych forach bez svojej ikonky. Mozete to pravdaze zmenit v uzivatelskych nastaveniach.<br>";
		else if ($image_size>=4096) echo "Vas obrazok je privelky. V zaujme rychleho nacitania stranok pre vsetkych uzivatelov fora si ho zmente pod 4 kb a nasledne uploadnite v zmene nastavenia.<br>"; 
		else Copy($image,$kyberia->UserImages.$login.$image_name);
		if ($kyberia->registerUser($login,$password1,$email,$web,$skin+1,$image_name,$info)) {
			echo "Boli ste uspesne zaregistrovany do systemu kyberia!";
			}
	}
	
	elseif ($password1!=$password2) {
		echo "<h2>Vase hesla niesu rovnake</h2>"; 
		 $form->showForm($login,$email,$web,$info,$kyberia->listSkinArray());
	}
	
	elseif (!$kyberia->isLogin($login)) {
		echo "<h2>Bohuzial uz je uzivatel s danym menom v nasom systeme zaregistrovany, prosim potrapte si fantaziu.</h2><br>"; 
		$form->showForm($login,$email,$web,$info,$kyberia->listSkinArray());
	}
}



?>
