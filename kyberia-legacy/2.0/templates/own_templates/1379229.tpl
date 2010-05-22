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
<link href='http://www.lidldollys.com/users/ach/fiona.css' rel='stylesheet' type='text/css'>
<!--
YOU CAN PUT YOUR OWN CSS SKIN HERE!!!
<link rel='stylesheet' type='text/css' href='/data/css/zabke.css'>
-->
<title>there’s nothing left to grieve</title>
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
<a href=http://www.zionmag.org target='blank'>zion</a> ---- <a href=http://www.nyx.cz target='blank'>nyx</a> ---- <a href=http://www.imhd.sk target='blank'>imhd</a> ---- <a href=http://www.allmusic.com target='blank'>allmusic</a> ---- <a href=http://www.imdb.com target='blank'>imdb</a> ---- <a href=http://www.imageshack.us target='blank'>imageshack</a> ---- <a href=http://www.dictionare.com/english/dictionaries.htm target='blank'>ro-en</a> ---- <a href=http://www.slovnik.sk target='blank'><b>s</b>lovni<b>k</b></a> ---- <a href=http://www.fdicts.cm/ target='blank'>slovníky</a> ---- <a href=http://www.memepool.com// target='blank'>memepool</a>
<!--<center><span align='center' class='most_important'>42</span></center>-->
<!-- here you can realize yourself -->
<center>
<form enctype="multipart/form-data" action='/id/105/' method='post'>
<a href='/id/101/'>klubostrom</a> ---
<a href='/id/{$user_id}/configure'>nastavenia</a> ----
<a href='/id/19'>booknuté</a> ---
<a href='/id/24'><span class='most_important'>poštá</span></a> ---
<a href='/id/23'>posledné</a> ---
<a href='/id/15'>karma</a> ---
<a href='/id/27'>aktívny</a> ---
<!-- <a href='/id/20'>clanky</a> --- -->
<a href='/id/21'>červená knižnica</a> ---
<!--<a href='/id/29'>rss kŕmenie</a> --- -->
<a href='/id/25'>vyhľadávanie</a> ---
<a href='/id/1017832'>help klub</a> ---
<a href='/id/1/'>hlavná</a> ---
<form><!--<input type='submit' value='logout' name='event' tabindex='23'>papá<br>-->
<BUTTON name="event" value="logout" type="submit">papá</BUTTON>
</center>
</form>
{if $new_mail eq true}
<center><a href='/id/24' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}
































