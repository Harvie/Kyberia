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
<link rel='stylesheet' type='text/css' href='/data/css/main.css'>
<title>zelame tlupe domestikovanych primatov uspech v buchani drevenymi palickami do cierneho kotucika</title>

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
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $user_id eq true}{include file="modules/toolbar.tpl"}{/if}
{if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
{if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}
<!--<span class='most_important'>dnes v noci od 23:23 bude niekolko hodin kyberia vypnuta, vdaka za pochopenie</span>-->

<div id='banner'>

</div>
<center><img src='http://kyberia.sk/upload/top.gif' border='0'></center>

<table width='780' align='center' valign='top' class='bordered2'>
<tr>
<td align='center' valign='top' style='width: 230px'>
	{get_nodes_by_type type=6 listing_amount=23 offset=$offset}
	<center><span class='important'>user blogs</span></center><Br>
	{foreach from=$get_nodes_by_type item=child}
		<table width='100%'>
			<tr><td><img src='{get_image_link id=$child.node_creator}' align='left' hspace='5' vspace='5' border='0'>
			<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:20:"\n":true}</a><br>{$child.node_content|truncate:230|imagestrip|stripslashes|wordwrap:15:"\n":true|imagestrip}
			<br><center>by <a href='/id/{$child.node_creator}'>{$child.login}</a> {$child.node_views} views</center></td></tr>
		</table><br>
	{/foreach}
	<a href='/blogs/'>more blogs??</a>
</td>
<td valign='top'>
	<center>{include file="modules/loginbox.tpl"}</center>
	<br><br>
	<Center><span align='center' class='important'>latest forums</span></center><br>
	{get_nodes_by_type type=3 listing_amount=10 offset=$offset}
	{foreach from=$get_nodes_by_type item=child}
		<a href='/id/{$child.node_id}'>{$child.node_name}</a>
		by <a href='/id/{$child.node_creator}'>{$child.login}</a>
		({$child.node_children_count} children)</a><br>
	{/foreach}

	<br><br>
	<Center><span align='center' class='important'>latest data nodes</span></center><br>
	{get_nodes_by_type vector=;1;101 type=12 listing_amount=9 offset=$offset}
	{foreach from=$get_nodes_by_type item=child}
		<a href='/id/{$child.node_id}'>{$child.node_name}</a>
		by <a href='/id/{$child.node_creator}'>{$child.login}</a>
		in <a href='/id/{$child.node_parent}'>{$child.parent_name}</a><br>
	{/foreach}
	<br>
	{get_nodes_by_type orderby="nodes.node_created desc" vector=;1;101 type=5 listing_amount=27 offset=$offset}
	<br><center><span class='important' align='center'>latest articles</span></center>
	{foreach from=$get_nodes_by_type item=child }
		<table width='100%' class='bordered'>
			<tr><td><img src='{get_image_link id=$child.node_id}' align='left' hspace='5' vspace='5' border='0'>
			<a href='/id/{$child.node_id}'>{$child.node_name}</a><br>
			{$child.node_content|truncate:230|stripslashes}
			<br><br><i>added by <a href='/id/{$child.node_creator}'>{$child.login}</a> 
into nodeshell <a href='/id/{$child.node_parent}'> {$child.parent_name}</a></i>
			</td></tr>
		</table><br>
	{/foreach}

</td>
<td valign='top' style='width: 105px'>
	<center><br><a href='/id/31'>register</a></center>
	<br><br>
	{include file="modules/get_userlist.tpl"}
</td>

</tr>
</table>
{include file="modules/footer.tpl"}
