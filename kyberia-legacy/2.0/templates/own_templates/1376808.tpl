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
<link href="http://www.tgallery.sk/_/riot_grrril.css" rel="stylesheet" type="text/css">

<title>te audire no possum. musa sapientum fixa est in aure</title>

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
<a href=http://www.post.sk target='blank'>post.sk</a> ---- <a href=http://www.prf.cuni.cz/ target='blank'>alma máter</a> ---- <a href=http://ib2004.gjh.sk/ target='blank'>ib2004</a> ---- <a href=http://www.allmusic.com target='blank'>allmusic</a> ---- <a href=http://www.imdb.com target='blank'>imdb</a> ---- <a href=http://www.imageshack.us target='blank'>imageshack</a> ---- <a href=http://www.photobucket.com/ target='blank'>photobucket</a> ---- <a href=http://www.slovnik.sk target='blank'><b>s</b>lovni<b>k</b></a> ---- <a href=http://www.fdicts.com/ target='blank'>slovníky</a> ---- <a href=http://en.wikipedia.org/wiki/Main_Page target='blank'>wiki</a> ---- mhd: <a href=http://www.dpp.cz/idos/ConnForm.asp target='blank'>praha</a>/<a href=http://www.imhd.sk/nr/ target='blank'>nitra</a>  
<!--<center><span align='center' class='most_important'>42</span></center>-->
<!-- here you can realize yourself -->
<center>
<form enctype="multipart/form-data" action='/id/1590/' method='post'>
<a href='/id/1/'>hlavná</a> ---
<a href='/id/101/'>klubostrom</a> ---
<a href='/id/19'>booknuté</a> ---
<a href='/id/24'><span class='most_important'>poštá</span></a> ---
<a href='/id/23'>posledné</a> ---
<a href='/id/15'>karma</a> ---
<a href='/id/27'>aktívny</a> ---
<!-- <a href='/id/20'>clanky</a> --- -->
<a href='/id/21'>červená knižnica</a> ---
<a href='/id/29'>rss kŕmenie</a> ---
<a href='/id/25'>vyhľadávanie</a> ---
<a href='/id/1017832'>help klub</a> ---
<a href='/id/{$user_id}/configure'>nastavenia</a> ----
<form><!--<input type='submit' value='logout' name='event' tabindex='23'>ísť het<br>-->
<BUTTON name="event" value="logout" type="submit">ísť het</BUTTON>
</center>
</form>
{if $new_mail eq true}
<center><a href='/id/24' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}





