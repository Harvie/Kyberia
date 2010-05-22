<html><head>
<title>
<?=KYBERIA_TITLE?>
</title>
<link rel=stylesheet type="text/css" href="http://www.kyberia.sk/css/gr.css">
 <meta http-equiv="Cache-Control" content="Public">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<script>
 function openWin(url, width, height, scrollbars, resize) {
                                if (!width) width = 640;
                                if (!height) height = 480;
                                if (!scrollbars) scrollbars = "yes";
                                if (!resize) resize = "yes";
                                window.open(url,"","width=" + width + ",height=" + height + ",toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=" + scrollbars + ",resizable=" + resize);
                        }

function vymena() {
	document.posta.mail_to.value = document.posta.mail_to.value.toLowerCase() ;
	document.images['fricon'].src = '/images/users/' + document.posta.mail_to.value + '.gif'  ;
}

function chngto(adr) {
document.posta.mail_to.value = adr ;
adr = adr.toLowerCase() ;
document.images['fricon'].src = '/images/users/' + adr + '.gif' ;
}

function openWinConfirm(qry, url, width, height, scrollbars, resize) {
	if (window.confirm(qry)) {
	openWin(url, width, height, scrollbars, resize);
}
}	

</script>
</head>
<body>
<?php 

if ((!$user_id) && ($action!='register') && AD_BANNER_MAIN)  { 
	echo AD_BANNER_MAIN;
?>

<script type='text/javascript'>
function Go(){return}

</script>
<script type='text/javascript' src='http://kyberia.sk/js/exmplmenu_var.js'></script>
<script type='text/javascript' src='http://kyberia.sk/js/menu_com.js'></script>
<script type='text/javascript' src='http://kyberia.sk/js/menu.js'></script>
<?php  } if (1==0) {?>

<script language="JavaScript" type="text/javascript">
        openWin("/leporelo.php",503,645,"no","no");
</script>
<?php } ?>
<noscript>Your browser does not support script</noscript>
