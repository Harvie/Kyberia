<?

global $kyberia;
if (!is_object($kyberia)) {
	include_once("/home/hromi1/kyberia/inc/kyberia.inc");
	$kyberia= new CLASS_KYBERIA();
}

if (IsSet($HTTP_REFERER) AND !strstr($HTTP_REFERER,"kyberia")) {
        $kyberia->setRefererStats();
}


?>
<html><head>
<title>
preventing destruction by slowly interconnecting enlightened minds
</title>
<link rel=stylesheet type="text/css" href="css/gr.css">
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
	document.posta.postadresat.value = document.posta.postadresat.value.toLowerCase() ;
	document.images['fricon'].src = '/images/users/' + document.posta.postadresat.value + '.gif'  ;
}

function chngto(adr) {
document.posta.postadresat.value = adr ;
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
<?php if (!$user_id) { ?>
<script type='text/javascript'>
function Go(){return}

</script>

<?php  } if (1==0) {?>

<script language="JavaScript" type="text/javascript">
        openWin("/leporelo.php",397,561,"no","no");
</script>
<?php } ?>
<noscript>Your browser does not support script</noscript>
