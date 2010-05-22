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
<!-- <link rel='stylesheet' type='text/css' href='/id/1066289/download'> -->
<title>{$node.node_name}{if $new_mail eq true} | {$new_mail}_{$new_mail_name}{/if}</title>
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
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<!-- <a href='/id/20'>clanky</a> ---- -->
<!-- <a href='/id/29'>news</a> ---- -->
<!-- <input type='submit' value='logout' name='event' tabindex='23'> ---- -->
<center>
<a href='/id/19'>.bk</a><a href='/id/404600'>.mrks</a> ---
<a href='/id/24'>.@</a> ---
<a href='/id/15'>.k</a> ---
<a href='/id/21'>.blgs</a> ---
<a href='/id/64836'>mnlg</a> ---
<a href='/id/23'>.lst</a> ---
<a href='/id/1370868'>.kev</a> ---
<a href='/id/1300551'>.dvlp</a> ---
<a href='/id/849/4'>.sbms</a> &nbsp;//&nbsp;
<a href='/id/1/'>.main</a> ---
<a href='/id/101/'>.kyb</a> ---
<a href='/id/27'>.on</a><a href='/id/1416619'>.ln</a> ---
<a href='/id/25'>.srch</a> ---
<a href='/id/1017832'>.hlp</a> ---
<a href='/id/{$user_id}/configure'>.set</a><a href='/id/1501867/configure'>.h</a><a href='/id/1844515'>.m</a> &nbsp;//&nbsp;
<a href='/id/63532'>.l:t</a> ---
<a href='/id/683643'>.shlf</a> ---
<a href='/id/1446809'>.shar</a> ---
<a href='/id/1392818'>.ctlg</a> ---
<a href='/id/978843'>.tmp</a> ---
<a href='http://www.google.sk/' target='_blank'>.<font color=blue>G</font><font color=red>o</font><font color=yellow>o</font></a><a href='http://www.google.com/ncr' target='_blank'>.<font color=blue>g</font><font color=green>l</font><font color=red>e</font></a> &nbsp;//&nbsp;
<a href='/id/1618122' target='_blank'>.s</a> ---
<BUTTON type='submit' value='logout' name='event'>.out</BUTTON>
</form>
</center>
{if $new_mail eq true}
<center><a href='/id/24'><b>u've'got {$new_mail} new mail, last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}