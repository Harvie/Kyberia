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
<link rel='stylesheet' href='/id/1480441/download' type='text/css'>
<title>kyberka:P</title>
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
<center><span align='center' class='most_important'></span></center>

<!-- here you can realize yourself -->
<center>
<a href='/id/1/'>main</a> ----
<a href='/id/101/'>kyberka</a> ----
<a href='/id/19'>bookmarks</a> ----
<a href='/id/24'>post</a> ----
<a href='/id/23'>last</a> ----
<a href='/id/15'>K!</a> ----
<a href='/id/27'>people</a> ----
<a href='/id/21'>diarys</a> ----
<a href='/id/29'>news</a> ----
<a href='/id/25'>search</a> ----
<a href='/id/{$user_id}/configure'>setup</a> -----
<input type='submit' value='logout' name='event' tabindex='23'>
</center>
</form>






