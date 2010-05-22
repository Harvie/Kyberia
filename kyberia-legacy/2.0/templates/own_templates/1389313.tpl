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

<link rel='stylesheet' href='/id/1066289/download' type='text/css'>
<title>{$node.node_name}|{if $new_mail eq true}{$new_mail} new mail,last from {$new_mail_name}{/if}</title>
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
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<a href='#top' style='display:block; height:15px; width:40px; color:#6dae42; border:1px solid; float:left;'>top</a><input type='submit' value='logout' name='event' tabindex='23' style='float:right;'>
<a href='/id/1389313/configure'><font size="1" color="black">.</font></a>
<a href='/id/1'>main</a> ---
<a href='/id/101/'>kyberia</a> ---
<a href='/id/1669447'>bookmarks</a> ---
<a href='/id/24'>mail</a> ---
<a href='/id/1416619'>last</a> ---
<a href='/id/15'>k!</a> ---
<a href='/id/1569351'>noimg-k!</a> ---
<a href='/id/27'>people</a> ---
<!-- <a href='/id/20'>články</a> --- -->
<a href='/id/21'>blogs</a> ---
<a href='/id/25'>search</a> ---
<a href='/id/1370868'>kev-main</a> ---
<a href='/id/1370880'>kev-bookmarks</a> ---
<a href='/id/15/01370868'>kev-k!</a> ---
<a href='/id/{$user_id}'>userinfo</a>
<a href='/id/1389313/configure'><font size="1" color="black">.</font></a>
</form>
</div>
<div class="t2"></div>
</center>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}




