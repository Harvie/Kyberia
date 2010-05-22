<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='/id/1402531/download/'>
<title>{$user_id}@{$node.node_name}</title>
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
	<div><a href='/id/15'>TOP K</a></div>
	<div><a href='/id/27'>PEOPLE</a></div>
	<div><a href='/id/21'>BLOGZ</a></div>
	<div><a href='/id/{$user_id}/'>ME</a></div>
	<div><a href='/id/{$user_id}/configure'>CONF</a></div>
	<div>
		<form enctype="multipart/form-data" action='/id/24/' method='post'>
			<input type='hidden' name='event' value='logout'>
			<input type='submit' value='LOGOUT' tabindex='23'>
		</form>
	</div>
</div>

