<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='/data/css/main.css'>
<title>a man should stay upright. not to be held upright</title>
</head>

<body>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $user_id eq true}{if $header_id neq true}{include file="modules/toolbar.tpl"}{/if}{/if}
{if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
{if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}


<table align='center' valign='top' class='bordered' width='865'>
<tr><td colspan='3' align='center' valign='top'>
</td></tr>
<tr>
<td align='left' valign='top' width='230'>

	<center><span class='important'>latest data nodes</span></center><br><br>
	{get_nodes_by_type type=12 listing_amount=23 offset=$offset}
	{foreach from=$get_nodes_by_type item=child}
		<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:40:"<br>":true}</a><br>
		by <a href='/id/{$child.node_creator}'>{$child.login|wordwrap:40:"<br>":true}</a><br>
		in <a href='/id/{$child.node_parent}'>{$child.parent_name|wordwrap:40:"<br>":true}</a><br>
	{/foreach}
	<br>
	{get_nodes_by_parent parent=21 listing_amount=$listing_amount offset=$offset}
	<center><span class='important'>user blogs</span></center><Br>
	{foreach from=$get_nodes_by_parent item=child}
		<table width='230'>
			<tr><td><img src='{get_image_link id=$child.node_creator}' align='left' hspace='5' vspace='5' border='0'>
			<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:20:"<br>":true}</a><br>{$child.node_content|truncate:66|imagestrip|strip_tags|stripslashes|wordwrap:20:"<br>":true|imagestrip}
			<br>by <a href='/id/{$child.node_creator}'>{$child.login}</a> {$child.node_views} views</td></tr>
		</table><br>
	{/foreach}

{include file="modules/node_settings.tpl"}
</td>
<td valign='top' width='468'>

  <center>

{include file="modules/loginbox.tpl"}
<a href='http://www.csaf.cz/akcie.php?id=628'><img src='http://csaf.cz/obrazky/banner-praha-20051018.gif' border='0'></a>
</center>

	<br><br>
	<Center><span align='center' class='important'>latest forums</span></center><br>
	{get_nodes_by_type type=3 listing_amount=10 offset=$offset}
	{foreach from=$get_nodes_by_type item=child}
		<a href='/id/{$child.node_id}'>{$child.node_name|strip_tags}</a>
		by <a href='/id/{$child.node_creator}'>{$child.login}</a>
		({$child.node_children_count} children)</a><br>
	{/foreach}

	<br><br>
<!--
<center>
<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" WIDTH="468" HEIGHT="60">
<PARAM NAME="movie" VALUE="http://freezy.rulez.sk/pngbanner.swf">
<PARAM NAME="quality" VALUE="best">
<EMBED src="http://freezy.rulez.sk/pngbanner.swf" quality="best" bgcolor="#000000" WIDTH="468" HEIGHT="60" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></EMBED>
</OBJECT>
</center>
-->
<br>

{get_linked_nodes}
	<br><center><span class='important' align='center'>latest articles</span></center>
	{foreach from=$get_linked_nodes item=child }
		<table width='100%' class='bordered'>
			<tr><td><img width=75 src='{get_image_link id=$child.node_id}' align='left' hspace='5' vspace='5' border='0'>
			<a href='/id/{$child.node_id}'>{$child.node_name}</a><br>
			{$child.node_content|truncate:320|stripslashes|strip_tags}
			<br><br><i>node created by <a href='/id/{$child.node_creator}'>{$child.login}</a></i>
			</td></tr>
		</table><br>
	{/foreach}

</td>
<td valign='top' width='165'>
	<center><br><a href='/id/31'>register</a>
	<br><br>
<form action='/id/25/' method='post'>
<input type='text' value='{$smarty.post.query}' name='query'>
<input type='submit' name='template_event'  value='search'><br>
</form><br><br>
</center>
	{include file="modules/get_userlist.tpl"}
</td>

</tr>
</table>
{include file="modules/footer.tpl"}









































































































