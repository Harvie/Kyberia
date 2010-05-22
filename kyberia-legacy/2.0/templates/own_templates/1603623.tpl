<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
	<head>
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
	<meta http-equiv="Cache-Control" content="Public">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
	{if $node.node_id eq '1'}<link rel='stylesheet' type='text/css' href='/data/css/main.css'>
	{else}<link rel='stylesheet' type='text/css' href='http://www.kyberia.sk/id/1603613/download'>{/if}
	<title>{$user_id}@{$node.node_name}</title>
</head>
<body>
	{if $new_mail eq true}
		<div><center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center></div>
	{/if}
	{if $node.node_id eq '1'}
		<a href='/id/1/'>MAIN</a> ::
		<a href='/id/101/'>CATS</a> ::
		<a href='/id/19'>BOOK</a> ::
		<a href='/id/24'>MAIL</a> ::
		<a href='/id/23'>LAST</a> ::
		<a href='/id/15'>TOP K</a> ::
		<a href='/id/27'>PEOPLE</a> ::
		<a href='/id/21'>BLOGZ</a> ::
		<a href='/id/{$user_id}/stats'>ME</a> ::
		<a href='/id/{$user_id}/configure'>CONF</a> ::
		{if $user_id eq '1371'}<a href='/id/1603623/configure'>TPLCONF</a>::{/if}
		<form enctype="multipart/form-data" action='/id/24/' method='post'><input type='hidden' name='event' value='logout'><input type='submit' value='LOGOUT' tabindex='23'></form>::
		<form enctype="multipart/form-data" action='/id/25/' method='post'><input type='text' value='' tabindex='24' name="query"><input type='submit' name='template_event' value='search'></form>
	{else}
	<div id="dmenu">
		<div><a href='/id/1/'>MAIN</a></div>
		<div><a href='/id/101/'>CATS</a></div>
		<div><a href='/id/19'>BOOK</a></div>
		<div><a href='/id/24'>MAIL</a></div>
		<div><a href='/id/23'>LAST</a></div>
		<div><a href='/id/15'>TOP K</a></div>
		<div><a href='/id/27'>PEOPLE</a></div>
		<div><a href='/id/21'>BLOGZ</a></div>
		<div><a href='/id/{$user_id}/stats'>ME</a></div>
		<div><a href='/id/{$user_id}/configure'>CONF</a></div>
		{if $user_id eq '1371'}<div><a href='/id/1603623/configure'>TPLCONF</a></div>{/if}
		<div><form enctype="multipart/form-data" action='/id/24/' method='post'><input type='hidden' name='event' value='logout'><input type='submit' value='LOGOUT' tabindex='23'></form></div>
		<div><form enctype="multipart/form-data" action='/id/25/' method='post'><input type='text' value='' tabindex='24' name="query"><input type='submit' name='template_event' value='search'></form></div>
	</div>
	<div id="bdy">
	{/if}