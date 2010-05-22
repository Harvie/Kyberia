<?php
define("stastie","UIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
define("LASKA","mam vas rad.majte ma radi");
define("vykaleny","som na kasu, serte na mna");
define("nasrany","23 stoporenych volskych kokotov do riti a kotvu do chrbta. vam vsetkym!");
define("depresia","ZABITE MAAAAAAAAAAAAAAAAAA");

switch ($_GET['get_event']) {
        case 'switchstatus':
                $status=eventz::switchstatus();
		if ($status) {
			if ($_GET['node_id']) $args="&node_id=".$_GET['node_id'];
			Header("Location:".SCRIPT."?action=$action$args");		
		}
                else echo $error;
	break;

}

class eventz {

function switchstatus() {
	$statuses['nasrany']="user_agressive";
	$statuses['vykaleny']="user_drugged";
	$statuses['LASKA']="user_love";
	$statuses['stastie']="user_happy";
	$statuses['depresia']="user_sad";

	global $kyberia;
	global $user_id;
	global $user_name;
	$user_status=$_GET['user_status'];

	if (($user_status!="normal") and ($user_status!="invisible")) {	
		$set=$kyberia->query("select ".$statuses[$user_status]." from user where id='$user_id'");
		$set->next();
		$message=$set->getString($statuses[$user_status]);
		if (empty($message)) $message=constant($user_status);
	
	}
	$kyberia->query("update session set user_mode='$user_status',user_id='$user_id',user_mode_message='$message' where user_id='$user_id'");
	return true;
	
}
}
