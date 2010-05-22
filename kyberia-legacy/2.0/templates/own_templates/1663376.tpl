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
<link href='http://proklete.misto.cz/mino/kyberia/kybesia.css' rel='stylesheet' type='text/css'>
<!--
YOU CAN PUT YOUR OWN CSS SKIN HERE!!!
<link rel='stylesheet' type='text/css' href='/data/css/zabke.css'>
-->
<title>kambodža.sk: detičky detičky danko a detičky</title>
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
<i>... <a href=http://www.imhd.sk/ba/index.php?w=3825242e29ef2f302523ea target='blank'><span class='horne_linky'>imhd</span></a></font> ... <a href=https://webmail.fses.uniba.sk/ target='blank'><span class='horne_linky'>fses pošta</span></a> ... 
<a href=https://secure.tlis.sk/squirrel/src/login.php target='blank'><span class='horne_linky'>tlis pošta</span></a> ... 
<a href=http://proklete.misto.cz/mino/ target='blank'><span class='horne_linky'>prokleté místo</span></a> ... 
<a href=http://www.whatismyip.com/ target='blank'><span class='horne_linky'>IP</span></a> ... 
<a href=http://158.195.100.226/ target='blank'><span class='horne_linky'>ORION</span></a> ... 
<a href=http://www.tlis.sk/ target='blank'><span class='horne_linky'>IRŠ TLIS</span></a> ... 
<a href=http://www.wikipedia.org/ target='blank'><span class='horne_linky'>wiki</span></a> ... 
<a href=http://www.google.com target='blank'><span class='horne_linky'>goooogle</span></a> ...</i>
<!--<center><span align='center' class='most_important'>42</span></center>-->
<!-- here you can realize yourself -->

<center>
<b><form enctype="multipart/form-data" action='/id/2393/' method='post'>
<a href='/id/1/'>hlavná</a> ...
<a href='/id/101/'>klubostrom</a> ...
<a href='/id/19'>booknuté</a> ...
<a href='/id/24'>poštička</a> ...
<a href='/id/23'>last</a> ...
<a href='/id/15'>K!harma</a> ...
<a href='/id/27'>lidičky</a> ...
<!-- <a href='/id/20'>clanky</a> --- -->
<a href='/id/21'>srdcervúce denníčky</a> ...
<a href='/id/1663376/configure'>.:.::.:..:...</a> ...
<a href='/id/25'>searč</a> ...
<a href='/id/1017832'>help klub</a> ...
<a href='/id/{$user_id}/configure'>change me</a> ...</b>
<form><!--<input type='submit' value='logout' name='event' tabindex='23'>ta preč<br>-->
<BUTTON name="event" value="logout" type="submit">ta het</BUTTON>
</center>
</form>
{if $new_mail eq true}
<center><a href='/id/24' class='mail'>másh {$new_mail} nové správy, poslednú od {$new_mail_name}</a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}








