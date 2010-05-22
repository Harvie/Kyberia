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
<link href='/id/1500611/download' rel='stylesheet' type='text/css'>
<!--
YOU CAN PUT YOUR OWN CSS SKIN HERE!!!
<link rel='stylesheet' type='text/css' href='/data/css/zabke.css'>
-->
<title>sex drogy and rock*n*roll</title>
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
<a href=http://www.zionmag.org target='blank'>zion</a> ---- <a href=http://www.bjork.com target='blank'>björk</a> ---- <a href=http://www.vlak-bus.cz target='blank'>vlak-bus</a> ---- <a href=http://www.mgzn.cz target='blank'>mgzn.cz</a> ---- <a href=http://www.slovnik.sk target='blank'><b>s</b>lovni<b>k</b></a> ---- <a href=http://www.hotmail.com target='blank'>hotmail</a> ---- <a href=http://www.dreamingwolf.host.sk target='blank'>dreamingwolf</a> ----
<!--<center><span align='center' class='most_important'>42</span></center>-->
<!-- here you can realize yourself -->
<center>
<form enctype="multipart/form-data" action='/id/1097/' method='post'>
<a href='/id/1/'>main</a> ---
<a href='/id/101/'>kybéria</a> ---
<a href='/id/19'>bookmarks</a> ---
<a href='/id/24'><font color=#f534a5>poštá</font></a> ---
<a href='/id/23'>posledné</a> ---
<a href='/id/15'>karma</a> ---
<a href='/id/27'>to sú ľudia</a> ---
<!-- <a href='/id/20'>clanky</a> --- -->
<a href='/id/21'>blogs</a> ---
<!-- <a href='/id/29'>rss kŕmenie</a> -->
<a href='/id/25'>vyhľadávanie</a> ---
<a href='/id/1017832'>help klub</a> ---
<a href='/id/{$user_id}/configure'>nastavenia</a> ----
<form><!--<input type='submit' value='logout' name='event' tabindex='23'>ís? het<br>-->
<BUTTON name="event" value="logout" type="submit">logaut</BUTTON>
</center>
</form>
{if $new_mail eq true}
<center><a href='/id/24' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}





