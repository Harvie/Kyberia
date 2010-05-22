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
<!-- kyberia --> 
<!-- <link rel='stylesheet' type='text/css' href='/data/css/kyberia.css'> -->
<!-- drakh -->
<!-- <link rel='stylesheet' type='text/css' href='http://www.kyberia.sk/id/1603613/download'> -->
<!-- bloody white -->
<link rel='stylesheet' type='text/css' href='http://kyberia.sk/id/1960652/download'>
<!-- <link rel='stylesheet' type='text/css' href='bloody_white.css'> -->
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
	<div id="dmenu">
		<div><a href='/id/1/'>MAIN</a></div>
		<div><a href='/id/101/'>CATS</a></div>
		<div><a href='/id/19'>BOOK</a></div>
		<div><a href='/id/24'>MAIL</a></div>
		<div><a href='/id/23'>LAST</a></div>
		<div><a href='/id/15'>K CHART</a></div>
		<div><a href='/id/27'>PEOPLE</a></div>
		<div><a href='/id/21'>BLOGZ</a></div>
		<div><a href={$user_id}/stats>ME</a></div>
		<div><a href={$user_id}/configure>CONF</a></div>
		<div><a href='/id/25/'>SEARCH</a></div>
		<div>
			<form action='/id/24/' method='post' enctype="multipart/form-data" name="logout_form" id="logout_form">
				<input type='hidden' name='event' value='logout'>
				<input type='submit' value='HeT' tabindex='23'>
			</form>
		</div>
	</div>
	<div id="bdy">
	</div>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}




