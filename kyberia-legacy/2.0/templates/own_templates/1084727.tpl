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
<!--
YOU CAN PUT YOUR OWN CSS SKIN HERE!!!
<link rel='stylesheet' type='text/css' href='/data/css/zabke.css'>
-->
<link rel='stylesheet' type='text/css' href='/data/css/kyberia.css'>
<title>kybérija.sk: chat pre celú rodinu</title>
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
<a href=http://www.burundi.sk target='blank'>burundi</a> ---- <a href=http://vladimira.rgb.sk target='blank'>tove reine</a> ---- <a href=http://www.imhd.sk target='blank'>imhd</a> ---- <a href=http://www.allmusic.com target='blank'>allmusic</a> ---- <a href=http://www.imdb.com target='blank'>imdb</a> ----
<!--<center><span align='center' class='most_important'>42</span></center>-->
<!-- here you can realize yourself -->
<center>
<form enctype="multipart/form-data" action='/id/876667/' method='post'>
<a href='/id/1/'>main pagina</a> ---
<a href='/id/101/'>tree of clubs</a> ---
<a href='/id/19'>booked</a> ---
<a href='/id/24'><span class='most_important'>mail</span></a> ---
<a href='/id/23'>last</a> ---
<a href='/id/15'>k!arma</a> ---
<a href='/id/27'>active people</a> ---
<!-- <a href='/id/20'>clanky</a> --- -->
<a href='/id/21'>red diaries</a> ---
<a href='/id/29'>rss feed</a> ---
<a href='/id/25'>search</a> ---
<a href='/id/1017832'>help club</a> ---
<a href='/id/{$user_id}/configure'>configure</a> ----
<form><!--<input type='submit' value='logout' name='event' tabindex='23'>logout<br>-->
<BUTTON name="event" value="logout" type="submit">futamesh!</BUTTON>
</center>
</form>

<!-- this part is to give you message about new mail, it's already present in the code of main page, so if you're on main page and you get new mail, there will be two identical messages -->
{if $new_mail eq true}
<center><a href='/id/24' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}


