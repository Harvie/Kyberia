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
<link rel='stylesheet' type='text/css' href='/data/css/sv.css'>
<title>1.maj Namestie Slobody - Million Marihuana March 2004 - zaciname!</title>
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

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $user_id eq true}{include file="modules/toolbar.tpl"}{/if}
{if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
{if $new_mail eq true}<center><a href='/id/24/' class='important'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}
