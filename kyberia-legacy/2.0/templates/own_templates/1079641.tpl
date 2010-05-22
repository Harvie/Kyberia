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
<link rel='stylesheet' type='text/css' href='/id/1079588/download'>
<title>komunitny diskusny system alternativa.sk</title>
</head>
<body>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
{$error}
{if $user_id eq false}
<table align='center' valign='center' width='100%' height='100%'>
<tr><td>
<center>Prosim prihlas sa do systemu alternativa.sk
<table><tr><td>login::</td><td> <input tabindex=1 accesskey=l type='text' name='login'></td>
<td>&nbsp;password::</td><td><input tabindex=2 accesskey=p type='password' name='password'></td><td>
<input tabindex=3 type='submit' name='event' value='login'></td></tr></table>
<br>&copy; alternativa.sk 2004<br>
Zaregistrovať sa môžete <a href='/id/1097147'>tu</a></center></td></tr></table>
{else}
<center>Bol si úspešne prihlásený.</a></center>

<form enctype="multipart/form-data" action='/id/{$node.node_id}/' method='post'>
<center>
<a href='/id/1078009/'>Alternatíva</a> ----
<a href='/id/19'>Obľúbené bookmarky</a> ----
<a href='/id/24'>Pošta</a> ----
<a href='/id/23'>Posledné</a> ----
<a href='/id/15'>K</a> ----
<a href='/id/27'>Ľudia</a> ----
<a href='/id/21'>Denníky</a> ----
<a href='/id/29'>Správy</a> ----
<a href='/id/25'>Hľadaj</a> ----
<a href='/id/548/configure'>Zmena nastavenia</a> -----
<input type='submit' value='logout' name='event' tabindex='23'>

</center>
<center>Vitajte v komunitnom systeme alternativa.sk <center>
<table><tr><td width='230'>
<table align='center' width='230' cellspacing='0' cellpadding='0'>
{get_userlist vector=$cube_vector}
{foreach name=users from=$active_users item=active_user}
{$active_user.login}<br>
{/foreach}

</td></tr>
</table>
</td>
{get_movement_params children_count=$node.node_children_count}


<!--main central column-->
<td valign='top'>
{*showing node_content*}
<table><tr><td>datovy bod:</td><td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<tr><td>rodicovsky datovy bod:</td><td><a href='/id/{$node.node_parent}'>{$node.node_parent_name}</a></td>
<tr><td>vytvoril:</td><td><a href='/id/{$node.node_creator}'>{$node.owner}</a></td>
<tr><td>datum:</td><td>{$node.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</td></tr>
</table>
<br>
{include file="modules/node_content.tpl"}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/
{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}
{* getting and showing nodeshell children *}

{get_children listing_amount='23232323232323' offset=$offset types=$children_types}
{foreach from=$get_children item=child}
{$child.depth}
prispevok:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a><br>
{/foreach}


{* get_nodeshell_children.tpl *}
</form>
<!--end of central column-->

</td>

</tr></table>

{include file="modules/footer.tpl"}
</td>
</tr></table>
{/if}
</body>
</html>















