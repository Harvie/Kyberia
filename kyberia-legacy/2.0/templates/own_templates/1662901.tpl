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

{if $node.node_id == 1666455}
<meta http-equiv="refresh" content="60">
{/if}

<link rel='stylesheet' type='text/css' href='http://www.depo.blueweb.sk/kyberia/css/kyberia.css'>
<title>k.{$node.node_name|strip_tags}</title>
{if $node.node_id == 1685121}
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
<br><br>
<div id="header">
<center>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
<a href='/id/1663286/'>ZoneX</a> &#9472;&#9472;
<a href='/id/1/'>main</a> &#9472;&#9472;
<a href='/id/101/'>kyberia</a> &#9472;&#9472; 
<a href='/id/1663920'>bookmarks</a>.<a href='/id/1666455/'>fresh</a> &#9472;&#9472;
<a href='/id/24'>posta {if $new_mail eq true}
<span style="font-size:7pt;">(<b><span style="font-size:8pt;color:red;">{$new_mail},{$new_mail_name}</span></b>)</span>
{else}
<span style="font-size:7pt;">(0)</span>
{/if}</a>
 &#9472;&#9472;
<a href='/id/23'>posledne</a> &#9472;&#9472;
<a href='/id/15'>kar!</a>.<a href="/id/1569351">ma!</a> &#9472;&#9472;
<a href='/id/27'>ludia</a> &#9472;&#9472;
<!-- <a href='/id/20'>clanky</a> &#9472;&#9472; -->
<a href='/id/21'>denniky</a> &#9472;&#9472;
<!--<a href='/id/29'>news</a> &#9472;&#9472; -->
<a href='/id/1664658'>search</a> &#9472;&#9472;
<a href='/id/1017832'>help</a> &#9472;&#9472;
<a href='/id/{$user_id}/configure'>nastavenie</a> &#9472;&#9472;
<input type='submit' value='logout' name='event' tabindex='23'>
</form>
</center>
</div>


{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}

<!-- Take me UP! -->
<div id="up">
{$node.node_type}<a href="#"> take me UP!</a><br />
<form enctype="multipart/form-data" action='/id/{$node.node_id}/'method='post' name='formular'>
<input type='submit' name='get_children_move' value='<<'>
<input type='submit' name='get_children_move' value='<'>
<input type='submit' name='get_children_move' value='>'>
<input type='submit' name='get_children_move' value='>>'><br /><a href="/id/1571388">recycler:</a><br />
<input type='hidden' name='new_parent' value='1571388'>
<input type='submit' name='event' value='set_parent'><br />
</div>








