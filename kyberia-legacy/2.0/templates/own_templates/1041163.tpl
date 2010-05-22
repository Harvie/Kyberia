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

<!-- IN MAIL SCRIPT -->
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

<!-- CSS -->
{if $node.node_id eq '1'}<link rel='stylesheet' type='text/css' href='/data/css/main.css'>
{else}<link rel='stylesheet' type='text/css' href='http://freezy.wnet.sk/TP203.css'>{/if}

<!-- TITLE -->
<title>
{if $new_mail eq true}{$new_mail}.m@il.from.{$new_mail_name}..{/if}
{$node.node_name}..{$node.node_id}..{$user_k}.K.left
</title>

</head>
<body>
<!-- MAIL & ERROR -->
{if $new_mail eq true}
<div class='most_important'><center><a href='/id/24' class='mail'><b>u.have.{$new_mail}.new.mail.last.from.{$new_mail_name}</b></a></center></div>
{/if}
{if $error eq true}
<div class='most_important'><center>{$error}</center></div>
{/if}

{if $node.node_id eq '1'}
<center>
<a href='/id/1/'>MAIN</a> ::
<a href='/id/101/'>KYB</a> ::
<a href='/id/102/'>HYST</a> ::
<!--<a href='/id/19'>BOOK</a> ::-->
<a href='/id/1478235'>BOOK</a> ::
<!--<a href='/id/24'>MAIL</a> ::</div>-->
{if $new_mail eq true}
<a href='/id/1693948/'><i>MAIL</i></a> ::
{else}
<a href='/id/1693948/'>MAIL</a> ::
{/if}
<a href='/id/23'>LAST</a> ::
<a href='/id/15'>TOP K</a> ::
<!--<a href='/id/27'>PEOPLE</a> ::-->
<a href='/id/1502464'>PEOPLE</a> ::
<a href='/id/21'>BLOGZ</a> ::
<a href='/id/{$user_id}'>ME</a> ::
<a href='/id/{$user_id}/configure'>CONF</a> ::
<form enctype="multipart/form-data" action='/id/25/' method='post'><input type='text' value='' tabindex='24' 

name="query"><input type='submit' name='template_event' value='search'></form> ::
<form enctype="multipart/form-data" action='/id/24/' method='post'><input type='hidden' name='event' value='logout'><input 

type='submit' value='LOGOUT' tabindex='23'></form>
</center>

{else}
<div id="menu">
	<div><a href='/id/1/'>MAIN</a></div>
	<div><a href='/id/101/'>CATS</a></div>
<!--	<div><a href='/id/19'>BOOK</a></div>-->
	<div><a href='/id/1478235'>BOOK</a></div>
<!--	<div><a href='/id/24'>MAIL</a></div>-->
	{if $new_mail eq true}
	<div><a href='/id/1693948/'><i>MAIL</i></a></div>
	{else}
	<div><a href='/id/1693948/'>MAIL</a></div>
	{/if}
	<div><a href='/id/23'>LAST</a></div>
	<div><a href='/id/15'>TOP K</a></div>
<!--	<div><a href='/id/27'>PEOPLE</a></div>-->
	<div><a href='/id/1502464'>PEOPLE</a></div>
	<div><a href='/id/21'>BLOGZ</a></div>
	<div><a href='/id/{$user_id}/stats'>ME</a></div>
	<div><a href='/id/{$user_id}/configure'>CONF</a></div>
	<div><form enctype="multipart/form-data" action='/id/25/' method='post'><input type='text' value='' tabindex='24' name="query"><input type='submit' name='template_event' value='search'></form></div>	
	<div><form enctype="multipart/form-data" action='/id/24/' method='post'><input type='hidden' name='event' value='logout'><input type='submit' value='LOGOUT' tabindex='23'></form></div>
</div>
<div id="body">
{/if}