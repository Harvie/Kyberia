<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">

<link rel='stylesheet' type='text/css' href='/data/css/kyberia.css'>
<title>{$node.node_name}</title>
{if $node.node_name eq 'mail'}
<script>
function vymena() {ldelim}
document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}

function chngto(name,id) {ldelim}
document.formular.mail_to.value = name ;
name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}
</script>
{/if}
</head>
<body>
<center>
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
{if $new_mail eq true}
<a href='/id/24'><b>{$new_mail}
[{$new_mail_name}]</b></a>
{/if}

{if $error eq true}
<span align='center' class='most_important'>{$error}</span>
{/if}
<a href='/id/1'> ~ </a>*
<a href='/id/101/'> kbr </a>*
<a href='/id/102/'> hystr </a>*
<a href='http://www.nyx.cz/index.php?l=secure;n=4e55'> nyx </a>*
<a href='http://www.homeofpoi.com/ubbthreads/login.php?Cat=0'> HoP </a> *
<a href='/id/63858'> frshw </a> *
<a href='/id/1196221'> <font color=orange>@</font> </a> *
<a href='/id/24'> mail </a>*
<a href='/id/19'> bkmrks </a>*
<a href='/id/1406838'> n.d </a>*
<!-- <a href='/id/23'> lst </a>* -->
<a href='/id/15'> k </a>*
<!-- <a href='/id/27'> ppl </a>* -->
<a href='/id/1416619'> l/p </a>*
<!-- <a href='/id/20'> clanky </a>* -->
<a href='/id/21'> blgz </a>*
<a href='/id/25'> srch </a>*
<a href='http://www.pobox.sk'> pbx </a>*
<a href='https://gmail.com'> gml </a>*
<a href=http://zona.amtel.sk> sms </a>*
<a href=https://samoobsluha.oskar.cz/index.php?message=12&lang=en> oskr </a>*
<a href=http://babelfish.altavista.com> bblfsh </a>*
<a href=http://maps.google.com> map </a>*
<a href='/id/1370868'> kev </a>*
<a href='/id/224/configure'> sttngz </a>*
<!-- <input type='submit' value='logout' name='event' tabindex='27'> -->
<button name='event' value='logout' type='submit'>Q</button>
</form>
</center>
