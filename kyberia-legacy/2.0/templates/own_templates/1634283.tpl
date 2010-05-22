<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
{if $node.node_name eq 'mail'}
<script>
function vymena() {ldelim}
document.formular.mail_to.value =
document.formular.mail_to.value.toLowerCase() ;
document.images['fricon'].src =
'/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}

function chngto(name,id) {ldelim}
document.formular.mail_to.value = name ;
name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/'
+id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}
</script>
{/if}
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css'
href='https://kyberia.sk/id/1663576download'>
<title>{$user_id}@{$node.node_name}</title>
</head>
<body>
<div>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from
{$new_mail_name}</b></a></center>
{/if}
</div>
<div id="dmenu">
       <div><a href='/id/1/'>mAIn</a></div>
       <div><a href='/id/101/'>TrEE</a></div>
       <div><a href='/id/19'>bOOkZ</a></div>
       <div><a href='/id/24'>M@iL</a></div>
       <div><a href='/id/23'>LAST</a></div>
       <div><a href='/id/15'>TOP K!</a></div>
       <div><a href='/id/27'>PEOPLE</a></div>
       <div><a href='/id/21'>BLOGZ</a></div>
       <div><a href='/id/{$user_id}/stats'>ME</a></div>
       <div><a href='/id/{$user_id}/configure'>ConFingUre</a></div>
       <div><a href='/id/1634283/configure'>SkiN conFig</a></div>
       <div>
               <form enctype="multipart/form-data" action='/id/24/' method='post'>
                       <input type='hidden' name='event' value='logout'>
                       <input type='submit' value='++ l_0G 0uT ++' tabindex='23'>
               </form>
       </div>
</div>
<div id="bdy">

