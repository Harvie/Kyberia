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
<!-- keby nahodou nezozrala moje css tak default -->
<!-- <link rel='stylesheet' type='text/css' href='/data/css/zabke.css'> -->
<!-- <link rel='stylesheet' type='text/css' href='/data/css/kyberia.css'> -->
<!-- <link rel='stylesheet' href='/id/1066289/download' type='text/css'> -->
<!-- <link rel='stylesheet' href='/id/1130023/download' type='text/css'> -->
<!-- <link rel='stylesheet' href='/id/1066289/download' type='text/css'> -->
<!-- <link rel='stylesheet' href='/id/1603613/download' type='text/css'> -->
<link rel='stylesheet' href='http://bin.mypage.sk/FILES/easylistening.css' type='text/css'>
<title>kwak</title>
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
<!--
<span class='most_important'>LINkeR's kyberia template</span> -->
<!-- <table width='100%' style='background-color:#111'> -->
<table width='100%'>
<tr>
<td><span align='center' class='most_important'>LINkeR's template</span></td>
<td><a href='/id/643780'>FRIENDS</a></td>
<td><a href='/id/63692/'>LINUX</a></td>
<td><a href='/id/64548/'>GENTOO</a></td>
<td><a href='/id/64147/'>BROWSERS</a></td>
<td><a href='/id/63756/'>FUNNY</a></td>
<td><a href='/id/156968/'>NEW BOOKMARK</a></td>
<td><a href='/id/63986/'>RC5-72 cracking : moo</a></td>
</tr></table>
<hr>
{if $new_mail eq true}
<center><a href='/id/24' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}

<!-- here you can realize yourself -->
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<center>
<a href='/id/1/'>main</a> ----
<a href='/id/101/'>kyberia</a> ----
<a href='/id/19'>bookmarks</a> ----
<a href='/id/24'>posta</a> ----
<a href='/id/23'>posledne</a> ----
<a href='/id/15'>k</a> ----
<a href='/id/27'>ludia</a> ----
<!-- <a href='/id/20'>clanky</a> ---- -->
<a href='/id/21'>denniky</a> ----
<a href='/id/29'>news</a> ----
<a href='/id/25'>search</a> ----
<a href='/id/1017832'>ZACINAME S KYBERIOU</a> ----
<a href='/id/{$user_id}/configure'>nastavenie</a> -----
<input type='submit' value='logout' name='event' tabindex='23'>

</center>
</form> 
























