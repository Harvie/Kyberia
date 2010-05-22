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

<link rel='stylesheet' type='text/css' href='/id/1745749/download'>  

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
<!-- here you can realize yourself -->
<div class="t1">
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<a href='#top' style='display:block; height:15px; width:40px; color:#6dae42; border:1px solid; float:left;'>top</a><input type='submit' value='logout' name='event' tabindex='23' style='float:right;'>
<a href='/id/1/'>main</a> ::
[<a href='/id/1582474/'>no</a>]<a href='/id/101/'>tree</a> ::
<a href='/id/683643'>lib</a>[<a href='/id/1392818'>cat</a>] :: 
<a href='/id/156968'>b0</a><a href='/id/404600'>0k</a> ::
<a href='/id/24'>posta</a> ::
<!-- <a href='/id/23'>posledne</a> :: -->
<a href='/id/15'>k!</a>[<a href='/id/1569351'>no-img</a>] :: 
<a href='/id/27'>ludia</a> ::
<a href='/id/1416619'>on air</a> :: 
<a href='/id/21'>denniky</a> ::
<!-- <a href='/id/29'>news</a> :: -->
<a href='/id/25'>search</a> ::
<a href='/id/{$user_id}'>MARIN</a>[<a href='/id/{$user_id}/configure'>conf</a>] ::
<a href='/id/980161'>platlas</a>[<a href='/id/980161/configure'>conf</a>] ::   

 

<a href='/id/1549689'>||</a>
<a href='/id/1559635'>|t</a>
<a href='/id/1391463'>|n</a>
<a href='/id/1061919/configure'>|h</a>


 </form>
</div>
 <div class="t2"></div>
{if $new_mail eq true}
<center><a href='/id/24'><b>mas {$new_mail} new mail||posledny od {$new_mail_name} {$new_mail_user_id}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}
<div id="mnu"></div>














































