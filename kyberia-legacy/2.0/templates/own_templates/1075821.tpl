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
<link rel='stylesheet' type='text/css' href='/id/1069463/download'>
<title>virtual office slobodna volba</title>
</head>
<body>
<!--<center><img src='http://kyberia.sk/id/1069461/download'></center>-->
<table><tr><td valign='top' width='230'>
{get_children listing_amount='23232323232323' offset=$offset types=$children_types}
{foreach from=$get_children item=child}
{$child.depth}
<a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a><br>
{/foreach}

<!-- SHOWING USERLIST IN LEFT COLUMN-->
{get_userlist vector='00000103'}
<table cellspacing='0' cellpadding='0'>
{if $active_friends eq true}
<tr><td width=100%>
<span class='important'><center>friends</center></span>
{foreach from=$active_friends item=node_visitor}
<div class='active_user'><div class='active_user_img'><a href='/id/{$node_visitor.user_id}/'>
<img border='0' name='{$node_visitor.login}' width='50' height='50' alt='{$node_visitor.login}' src='{get_image_link id=$node_visitor.user_id}'>
</a></div></div>
{/foreach}
<!--END OF USERLIST-->

</td></tr>
<tr><td width=100%>
<span class='important'><center>users</center></span>
{foreach from=$active_users item=node_visitor}
<div class='active_user'><div class='active_user_img'><a href='/id/{$node_visitor.user_id}/'>
<img border='0' name='{$node_visitor.login}' width='50' height='50' alt='{$node_visitor.login}' src='{get_image_link id=$node_visitor.user_id}'>
</a></div></div>
{/foreach}
{/if}

</table>

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
{include file="modules/get_threaded_children.tpl"}


{* get_nodeshell_children.tpl *}
</form>
<!--end of central column-->

</td>

</tr></table>

{include file="modules/footer.tpl"}
</td>
</tr></table>
</body>
</html>





































