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
<title>{if $new_mail eq true}{$new_mail} NEW MAIL ({$new_mail_name}):{/if}{$user_id}@{$node.node_name}.kyberia.sk</title>
<link rel="shortcut icon" href="/id/1459933/download">
<link rel='stylesheet' type='text/css' href='http://outdooractive.info/KR_PZ.css'>
<link rel='stylesheet' type='text/css' href='/id/1126515/download'>
{if $node.node_name eq 'mail'}
<script>
function vymena() {ldelim}
document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase();
document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}
function chngto(name,id) {ldelim}
document.formular.mail_to.value = name;
name = name.toLowerCase();
document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}
</script>
{/if}
</head>
<body onload="document.getElementById('krpz').src='/id/1126515/download'">
<form enctype="multipart/form-data" action='/id/24/' method='post'>
<div id="t1">
<a href='/id/1/'>r00t</a> ---
<a href='/id/101/'>kyberia</a> ---
<a href='/id/19/'>bookmarks</a> ---
<a href='/id/24/'>mail</a> ---
<a href='/id/1416619/'>on_air</a> ---
<a href='/id/1569351/'>K</a> ---
<a href='/id/21/'>blogs</a> ---
<a href='/id/25/'>search</a> ---
{if $user_id eq 660}
<a href='/id/1127587/configure'>tpl_edit</a> ---
{/if}
<a href='/id/{$user_id}/configure'>{$user_id}_conf</a> -----
<a href='http://www.google.com/webhp?hl=xx-hacker'><img src='/id/1450676/download' width='40' height='14' alt='' border='0' style='position:relative;top:4px'></a> -----
<input type='hidden' name='event' value='logout'>
<input type='submit' value='isc het' tabindex='23'>
{if $new_mail eq true}
<br>
<strong><a href="/id/24">u have {$new_mail} new mail,last from</a> <a href="/{$new_mail_name}" style="color:red">{$new_mail_name}</a></strong>
{/if}
{if $error eq true}
{$error}
{/if}
</div>
<div id="corr"></div>
</form>
{if $node.node_name eq 'bookmarks'}
<div id="adv"></div>
<div class="nic"></div>
{/if}
<!-- KR PZ location hack: -->
<img style='position:absolute;top:-1px;left:-1px;width:1px;height:1px' id='krpz' src='' alt=''>
