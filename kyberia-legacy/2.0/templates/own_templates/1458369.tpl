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

<link rel='stylesheet' type='text/css' href='/id/1595784/download'>
<!--
<link rel='stylesheet' type='text/css' href='http://x86.sk/~acidmilk/shadowrun.css'>
-->

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
<center>
<br>

<div style=" background-color: #222; ">
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
[<a href='/id/101/' style='header'>kyberija tree</a>] --
[<a href='/id/156968' style='header'>buukmarks</a>] --
[<a href='/id/24' style='header'>mail</a>] --
[<a href='/id/1462783' style='header'>my_last</a>] --
[<a href='/id/15' style='header'>k</a>] --
[<a href='/id/27' style='header'>people</a>] --
[<a href='/id/21' style='header'>blogs</a>] --
[<a href='/id/25' style='header'>search</a>] --
[<a href='/id/1370868/' style='header'>kévl</a>] --
[<a href='/id/1593701' style='header'>pers|trash</a>] --
[<a href='/id/1571388' style='header'>RB@K</a>] --
[<a href='/id/1582474' style='header'>out of tree</a>] --
[<a href='/id/{$user_id}/1961033' style='header'>conf /me</a>] --
[<a href='/id/1458369/1961033' style='header'>conf /header</a>] ----



<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</center>


{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}


</div>












































































