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
<link rel='stylesheet' type='text/css' href='/id/1448408/download'>
<title>{if $new_mail eq true}{$new_mail} NEW MAIL ({$new_mail_name}):{/if}{$user_id}@{$node.node_name}.kyberia.sk</title>
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

<body>

<!-- location hack:
<img width="1" height="1" style="display:none" alt="" src="/id/1126515/download">
//-->
<form enctype="multipart/form-data" action='/id/24/' method='post'>
<div class="t1">
<a href='/id/1/'>main</a> ---
<a href='/id/101/'>kyberia</a> ---
<a href='/id/19'>bookmarks</a> (<a href='/id/660/bookmarklist'>old</a>) ---
<a href='/id/24'>posta</a> ---
<a href='/id/23'>posledne</a> ---
<a href='/id/15'>k</a> ---
<a href='/id/27'>ludia</a> ---
<a href='/id/21'>denniky</a> ---
<a href='/id/25'>search</a> ---
<i><a href='/id/1448408/configure'>css</a>/<a href='/id/64696/configure'>tpl</a></i> ---
<a href='/id/{$user_id}/configure'>{$user_id}/conf</a> -----
<input type='hidden' name='event' value='logout'>
<input type='submit' value='ísť do piči' tabindex='23'>
{if $new_mail eq true}
<br>
<strong><a href="/id/24">u have {$new_mail} new mail,last from</a> <a href="/{$new_mail_name}" style="color:red">{$new_mail_name}</a></strong>
{/if}
{if $error eq true}
{$error}
{/if}
</div>
<div style="height:24px"></div>
</form>



