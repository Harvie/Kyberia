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

<link rel='stylesheet' type='text/css' MEDIA="screen" href='/id/1745749/download'>
<LINK REL="stylesheet" TYPE="text/css" MEDIA="handheld" HREF="http://x86.sk/~marin/css/pda.css">

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

<title>|| {$node.node_name} | {if $new_mail eq true}{$new_mail}_{$new_mail_name}{/if}||</title>


</head>

<body>
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
<a href='#top' style='display:block; height:15px; width:30px; color:#D921A7; border:1px solid; float:left;'> ~ </a><input type='submit' value='logout' name='event' tabindex='23' style='float:right;'>
<a href='/id/1/'>main</a> &nbsp*&nbsp
<a href='/id/101/'>kyberja</a> &nbsp*&nbsp
<a href='/id/19'>bu:</a><a href='/id/156968'>kmarks</a> &nbsp*&nbsp
<a href='/id/24'>mail</a> &nbsp*&nbsp
<a href='/id/1416619'>on air</a> &nbsp*&nbsp
<a href='/id/15'>k!</a> &nbsp <a href='/id/1569351'>x pictr</a> &nbsp*&nbsp 
<a href='/id/21'>denníky</a> &nbsp*&nbsp
<a href='/id/27'>ppl</a> &nbsp*&nbsp
<a href='/id/25'>srch</a> &nbsp*&nbsp 
<a href='/id/{$user_id}'>tri vlnks</a> &nbsp <a href='/id/{$user_id}/configure'>configure</a> 

</form>
</div>
<div class="t2"></div>
{if $new_mail eq true}
<right><a href='/id/24'><b> &nbsp &nbsp !! {$new_mail} new mail,, laast from {$new_mail_name} !! {$new_mail_user_id}</b></a></right>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}
<div id="mnu"></div>







