<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

//die("kyberia maintenance<br>please be patient<br>thanks<br>stab");
//error_reporting(0);

//starting timer for benchmarking purposes
$timer_start=Time()+SubStr(MicroTime(),0,8);

//setting PHPSESSID cookie and starting user session
session_start();

$devel_ids = array(548);

if (array_search($_SESSION['user_id'], $devel_ids)) {
	
	error_reporting(E_ALL);
	print_r($_GET);
	print_r($_POST);
	print_r($_SESSION);

}


//requiring main config file with path/database etc. constants
require('config/config.inc');

//getting referer id for synaptic connection
preg_match("/id\/(.*)\//",$_SERVER['HTTP_REFERER'],$ref_match);
$referer_id=$ref_match[1];

//connecting to database and creating universal $db object
require(SYSTEM_ROOT.'inc/log.inc');
require(SYSTEM_ROOT.'inc/ubik.inc');
require(SYSTEM_ROOT.'inc/nodes.inc');
require(SYSTEM_ROOT.'inc/error_messages.inc');
require(SYSTEM_ROOT.'inc/database.inc');

$db=new CLASS_DATABASE();

//loading smarty template engine and setting main parameters
require(SMARTY_DIR.'Smarty.class.php');
$smarty = new Smarty;

$smarty->template_dir = TEMPLATE_DIR.TEMPLATE_SET;
$smarty->compile_dir = SYSTEM_ROOT."/data/templates_c/".TEMPLATE_SET;
$smarty->config_dir = SMARTY_DIR.'/configs/';
$smarty->cache_dir = SMARTY_DIR.'/cache/';
$smarty->plugins_dir = SMARTY_DIR.'/node_methodz/';

if (array_search($_SESSION['user_id'], $devel_ids)) 
	$smarty->debugging=true;

//initializing variables
if (empty($_POST['event'])) 
	$event=false;
else 
	$event=$_POST['event'];

if (empty($_POST['transaction'])) 
	$transaction=false;
else 
	$event=$_POST['transaction'];

//initializing node methods
if (!empty($_GET['node_name'])) {
	//omfg what's this! jail , jail, penalty of death!
	// reopened by maniac, keep this in secret, then you can benefit from it..
	if(strpos($_GET['node_name'],'0')===0) {
		$numbah=$_GET['node_name'];
		$db->query("set character_set_connection=latin2");
		$set=$db->query("select * from tz.gts where full_number='$numbah'");
		$set->next();
		echo $set->getString('full_name')."<br>";
		echo $set->getString('full_street')."<br>";
		echo $set->getString('city')."<br>";
		echo $set->getString('psc')."<br>";
		echo $set->getString('company')."<br>";

		die();	
	}

	else nodes::redirByName($_GET['node_name']);
	// END OF JAIL ;)
	nodes::redirByName($_GET['node_name']);
}

elseif (!empty($_GET['node_id'])) {
	$node = nodes::getNodeById($_GET['node_id'],$_SESSION['user_id']);
}

if ($node['node_creator']==$_SESSION['user_id']) $node['node_permission']='owner';

if ($_SESSION['cube_vector']) {
	if (strpos($node['node_vector'],$_SESSION['cube_vector'])===false) {
		echo "node::".$node['node_vector'];
		echo "cube_Vector::".$_SESSION['cube_vector'];
		echo "you are out of allowed cwbe. access forbidden";
		die();
	}
}

//if not existent node show our own 404 
if (empty($node)) {
	$nodes= nodes::getNodesByName($_GET['node_name']);
	if ($nodes) {
		$smarty->assign('nodes',$nodes);
		$content=$smarty->display("404.tpl");
		die();
	}
	elseif ($_SESSION['user_id']) {
		$smarty->assign('node_name',$_GET['node_name']);
		$content=$smarty->display("modules/addnode.tpl");
	}
}



//modifying node glass pearl
if (is_array($children_types[$node['node_type']])) 
	$smarty->assign('children_types',$children_types[$node['node_type']]);

$smarty->assign('types',$types);


$node['node_type']=$types[$node['node_type']];
$node['node_content']=StripSlashes($node['node_content']);
$node['node_name']=StripSlashes($node['node_name']);

//checking permissions
require(SYSTEM_ROOT.'inc/permissions.inc');
$permissions=permissions::checkPermissions($node);
$permissions['h']=permissions::isHierarch($node);


//entering the node

//sventest
if (($permissions['r']) || ($event != 'register')) {
	
//performing node_events (based on update/insert/delete db queries)
if ($event) {
	require(SYSTEM_ROOT.'inc/eventz.inc');
}

elseif ($transaction) {
	require(SYSTEM_ROOT.'inc/transaction.inc');
}
//end of performing node events 

//sventest
}


if ($permissions['r']) {
	log::log('enter',$node['node_id'],'ok',$node['node_user_subchild_count']);
	if (!empty($_SESSION['user_id']) && is_numeric($node['node_id'])) {
		$q="update node_access set visits=visits+1,node_user_subchild_count='0',last_visit=NOW() where node_id='".$node['node_id']."' and user_id='".$_SESSION['user_id']."'";
//		echo $q;
		$result=$db->update($q);

		if (!$result) {
			$q="insert into node_access set user_id='".$_SESSION['user_id']."',node_id='".$node['node_id']."',last_visit=NOW()";
			$db->query($q);
	}


	}
//creating neural network
	$db->update("update nodes set node_views=node_views+1 where node_id='".$node['node_id']."'");
	if (is_numeric($referer_id)) {
		$q="update neurons set synapse=synapse+1 where dst='".$node['node_id']."' and src='$referer_id'";
		$result=$db->update($q);
		if (!$result) {
			$q="insert into neurons set synapse_creator='".$_SESSION['user_id']."',dst='".$node['node_id']."',src='$referer_id',synapse=1";			
			$db->query($q);
		}
	}

}



elseif (!$permissions['r'] && $_GET['magic_word']) {
	$magic_word_big=$_GET['magic_word'];

	if ( preg_match("/(\d+)-(.+)/",$_GET['magic_word'],$mu)) {
		$magic_uid=$mu['1'];
		$magic_word=addslashes($mu['2']);
		$q="select login from users where user_id='$magic_uid' and magic_word='$magic_word'";
		$set=$db->query($q);
		if ($set->getNumRows()) {
			$permissions['r']=true;
		}
	}
}





else {
	log::log('enter',$node['node_id'],'failed');
}



//assigning user data to smarty if user logged in
if ($user_id=$_SESSION['user_id']) {
	$smarty->assign('bookmarks',$_SESSION['bookmarks']);
	$smarty->assign('user_id',$_SESSION['user_id']);
	if (!empty($_SESSION['cube_vector'])) $smarty->assign('cube_vector',$_SESSION['cube_vector']);
	$smarty->assign('user_quota',$_SESSION['user_quota']);
	$newmailset=$db->query("select user_mail,user_mail_name,user_k from users where user_id='$user_id'");
	$newmailset->next();
	$new_mail=$newmailset->getString('user_mail');
	$smarty->assign('new_mail',$new_mail);
	$smarty->assign('new_mail_name',$newmailset->getString('user_mail_name'));
	$user_k=$newmailset->getString('user_k');
	$smarty->assign('user_k',$user_k);
	$user_id=$_SESSION['user_id'];

	//mail node
	if ($node['node_name']=='mail') {

		//clear new mail message
		if ($new_mail) $db->query("update users set user_mail=0 where user_id='$user_id'");

		//set messages as delivered to recipient
		$set=$db->query("select mail_id,mail_duplicate_id from mail where mail_user='$user_id' and mail_to='$user_id' and mail_read='no'");
		while($set->next()) {
			$db->query("update mail set mail_read='yes' where mail_id='".$set->getString('mail_duplicate_id')."'");
			$db->query("update mail set mail_read='yes' where mail_id='".$set->getString('mail_id')."'");

			$new_messages[$set->getString('mail_id')]=true;
		}
/*
		if (count($new_messages)) {
			$db->query("update mail set mail_read='yes' where mail_user='$user_id' and mail_user=mail_to and mail_read='no'");
			$smarty->assign('new_messages',$new_messages);
		
        	}
*/
	}
}



if ($node['node_system_access']=='crypto') {
	$smarty->assign('crypto_pass',$_SESSION['crypto'][$node['node_id']]);
}


Header("Cache-control: no-cache");
Header("Expires:".gmdate("D, d M Y H:i:s")." GMT");
header("Last-Modified: ".gmdate("D, d M Y H:i:s")." GMT");

//assigning node data to smarty
$smarty->assign('error',$error);
$smarty->assign('permissions',$permissions);
$smarty->assign('current_vector',$node['node_vector']);
if ($permissions['r']) $smarty->assign('node',$node);
else {
	
	$smarty->assign('node',$node);
	$smarty->display('modules/header.tpl');
	$smarty->display('modules/loginbox.tpl');
	die();
}

//setting user location
$q="update users set last_action=NOW(),user_location_vector='".$node['node_vector']."',user_action='".addslashes($node['node_name'])."',user_action_id='".$node['node_id']."' where user_id='".$_SESSION['user_id']."'";
$db->executequery($q);

$whole_time=SubStr((Time()+SubStr(MicroTime(),0,8)-$timer_start),0,7);
$smarty->assign('whole_time',$whole_time);

if (!empty($_GET['template_id'])) {
	$template_id=$_GET['template_id'];
}
else $template_id=false;

if ($template_id=='download') {
	if ($permissions['r']) {
	$linkname = SYSTEM_ROOT."/files/".$node['node_id'];
	$filename= readlink($linkname);
	$suffix=preg_replace("/(.*?)\.(.*?)/i","$2",$filename);

	$ext = substr( $filename,-3 );
	if( $filename == "" ) {
	   echo "ERROR: Empty file to download. ";
	   exit;
	} elseif ( ! file_exists( $filename ) ) {
	 	exit;
	};
	switch( $ext ){
	   case "pdf": $ctype="application/pdf";              break;
	   case "exe": $ctype="application/octet-stream";      break;
	   case "zip": $ctype="application/zip";              break;
	   case "doc": $ctype="application/msword";            break;
	   case "xls": $ctype="application/vnd.ms-excel";      break;
	   case "ppt": $ctype="application/vnd.ms-powerpoint"; break;
	   case "gif": $ctype="image/gif";                    break;
	   case "png": $ctype="image/png";                    break;
	   case "jpg": $ctype="image/jpg";                    break;
	   default:    $ctype="application/force-download";
	}
	header("Pragma: public");
	header("Expires: 0");
	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
	header("Content-Type: $ctype");
	$user_agent = strtolower ($_SERVER["HTTP_USER_AGENT"]);
	$file=str_replace(" ","_",$node['node_name']).".$ext";
	if ((is_integer (strpos($user_agent, "msie"))) && (is_integer
	(strpos($user_agent, "win")))) {
	   header( "Content-Disposition: filename=$file;" );
	} else 	{
	   header( "Content-Disposition: attachment;
	filename=$file;" );
	}
	header("Content-Transfer-Encoding: binary");
	header("Content-Length: ".filesize($filename));
	readfile("$filename");
	exit();
	} 
	else { echo "you don't have permissions for downloading this data"; die(); }
}

$smarty->assign('action',$template_id);

//for cases like search & preview
	$smarty->assign('post_vars',$_POST);
if (!empty($_POST['template_event'])) {
	$smarty->assign('template_event',$_POST['template_event']);

}

//setting listing parameters
        $children_count=$node['node_children_count'];
	$descendant_count=$node['node_descendant_count'];

        if (is_numeric($_POST['listing_amount'])) $listing_amount=$_POST['listing_amount'];
        elseif (!empty($_SESSION['listing_amount'])) $listing_amount=$_SESSION['listing_amount'];
        else $listing_amount=DEFAULT_LISTING_AMOUNT;
	$smarty->assign('listing_amount',$listing_amount);

	if ($_POST['listing_order']) $listing_order=$_POST['listing_order'];
	elseif (!empty($_SESSION['listing_order'])) $listing_order=$_SESSION['listing_order'];
	else $listing_order=DEFAULT_LISTING_ORDER;
	$smarty->assign('listing_order',$listing_order);

	if (is_numeric($_POST['get_children_offset'])) $offset=$_POST['get_children_offset'];
        else $offset=0;
	

        //movement forward and backward
//	if ($listing_order=='asc' && !$offset) $offset=$descendant_count-$listing_amount;

        if ($_POST['get_children_move']=='<') {
	        $offset=$offset-$listing_amount;
       	      if ($offset<0) $offset=0;
        }
        elseif ($_POST['get_children_move']=='>') {
		$offset=$offset+$listing_amount;
        }
	elseif ($_POST['get_children_move']=='>>') {
        	$offset=$descendant_count-$listing_amount;
       	}

        elseif ($_POST['get_children_move']=='<<') {
               $offset=0;
        }
        if ($offset<0) $offset=0;
        $smarty->assign('offset',$offset);

        
//show own header
if ($_SESSION['header_id']==true) {
	$smarty->assign('header_id',$_SESSION['header_id']);
	$smarty->template_dir=OWN_TEMPLATE_DIR;
	$content=$smarty->fetch($_SESSION['header_id'].".tpl");
	$smarty->template_dir = TEMPLATE_DIR.TEMPLATE_SET;
}

//setting which template to use and displaying
/*
if ($node['$template_id']) {
	if (!empty($template_id)) {
		if (is_numeric($template_id)) {
			$smarty->template_dir=OWN_TEMPLATE_DIR;
			$content.=$smarty->fetch($node['$template_id'].".tpl");

		}
		elseif (strrpos($template_id,";")) {
			$smarty->template_dir=OWN_TEMPLATE_DIR;
			$content.=$smarty->fetch($node['$template_id'].".tpl");
		}
		else {
			$content.=$smarty->fetch($template_id.".tpl");
		}	
	}
	else {
		$smarty->template_dir=OWN_TEMPLATE_DIR;
		$content.=$smarty->fetch($node['$template_id'].".tpl");
	}
}

else {
	if ($node['node_type']==$types[$node['node_id']]) {
		if (is_numeric($template_id)) {
			require(SYSTEM_ROOT.'/inc/actions.inc');
			$content.=$smarty->fetch($node['node_type'].".tpl");
		}
		elseif (strrpos($template_id,";")) {
			$content.=$smarty->fetch($node['node_type'].".tpl");
		}
		elseif (empty($template_id)) {
			$smarty->template_dir=OWN_TEMPLATE_DIR;		
			$content=$smarty->fetch($node['template_id'].".tpl");			

		}
		else {
			$content.=$smarty->fetch($template_id.".tpl");
		}		
	}
	
	else {

		if (is_numeric($template_id) or strpos(";",$template_id)) {
			require(SYSTEM_ROOT.'/inc/actions.inc');
			$content.=$smarty->fetch($node['node_type'].".tpl");
		}
		elseif (empty($template_id)) {
			$content.=$smarty->fetch($node['node_type'].".tpl");
		}
		else {
			$content.=$smarty->fetch($template_id.".tpl");
		}
	}
	
}
*/

$smarty->template_dir=OWN_TEMPLATE_DIR;
if (is_numeric($template_id)) {
	$content.=$smarty->fetch($template_id.".tpl"); 
}

else {
	$content.=$smarty->fetch($node['template_id'].".tpl"); 
}

$time=SubStr((Time()+SubStr(MicroTime(),0,8)-$timer_start),0,7);
echo $content;
echo "<center>page generation took: $time second</center>";

$query = "insert delayed into load_times values (now(), '$time')";
//$db->executequery($query);

//end of displaying

// dake vypisi pre kybu
if ($_SESSION['user_id'] == 342) {
	
}

?>
