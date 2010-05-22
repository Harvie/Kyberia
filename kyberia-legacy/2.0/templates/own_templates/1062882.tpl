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
<link rel='stylesheet' type='text/css' href='/data/css/kyberia.css'>

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
<!-- <center><span align='center' class='most_important'>42</span></center> -->

<!-- here you can realize yourself -->
<center>
<form enctype="multipart/form-data" action='/id/349/' method='post'>
<a href='/id/1/'>main</a><b> || </b>
<a href='/id/101/'>kyberia</a><b> || </b>
<a href='/id/156968'><b>book's</b></a><b> || </b>
<a href='/id/19'>bookmarks</a><b> || </b>
<span align='center' class='most_important'><a href='/id/24'>posta</a></span><b> || </b>
<a href='/id/23'>posledne</a><b> || </b>
<a href='/id/15'>k</a><b> || </b>
<a href='/id/27'>ludia</a><b> || </b>
<!-- <a href='/id/20'>clanky</a> || -->
<a href='/id/21'>denniky</a><b> || </b>
<a href='/id/25'>search</a><b> || </b>
<a href='/id/1017832'>help</a><b> || </b>
<a href='/id/{$user_id}/configure'>nastavenie</a><b> || </b>
<input type='submit' value='logout' name='event' tabindex='23'>
</center>
</form>

{if $new_mail eq true}
<a href='/id/24'><b><center><span align='center' class='most_important'>u have {$new_mail} new mail,last from {$new_mail_name}</span></center></b></a>
{/if}

{if $error eq true}
{$error}
{/if}





















