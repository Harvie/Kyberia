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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1250">
<link rel='stylesheet' type='text/css'  href='http://morph.sk/~morrigan/data/morka.css'>
<title></title>
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
<br>
<!-- here you can realize yourself -->
<center>
<a href='/id/1/'>na hlavnúú</a> ----
<a href='/id/101/'>kyberia</a> ----
<a href='/id/19'>búkmárks</a> ----
<a href='/id/24'>pošta</a> ----
<a href='/id/23'>posledné</a> ----
<a href='/id/15'>k</a> ----
<a href='/id/27'>ludia</a> ----
<!-- <a href='/id/20'>clanky</a> ---- -->
<a href='/id/21'>denníky</a> ----
<a href='/id/25'>s&#224;&#224;&#224;&#232;</a> ----
<a href='/id/1182473/configure'>konfigjúr templ</a> ----
<a href='/id/{$user_id}/configure'>nastavenie</a> ---- 
<a href='http://northpole.no-ip.org/~morykan/'>u rejdena</a> -----
<a href='http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe' target='_blank'>putty</a> -----
<a href='http://www.google.sk' target='_blank'>gúgl</a> -----
<a href='http://www.imageshack.us' target='_blank'>imidžšek</a> -----
<a href='http://www.irc.cz/cgi-bin/irc.cgi' target='_blank'>irc</a> -----
<a href='http://www.allmusic.com' target='_blank'>allmusic</a> -----
<a href='http://www.lingea.cz/ilex/L.asp?l=0' target='_blank'>we:rterbuch</a> -----
<form enctype="multipart/form-data" action='/id/1' method='post'>
<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</center>
<br>
{if $new_mail eq true}<br />
<center><a href='/id/24' class='mail'>
tvoja nedočkavá poštová schránka prijala {$new_mail} mail(y/ov), posledný je od: {$new_mail_name}</a></center><br />
{/if}<br />
<br />
{if $error eq true}<br />
<center><span align='center' class='most_important'>{$error}</span></center><br />

{/if}<br />
