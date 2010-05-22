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
<link rel='stylesheet' type='text/css' href='http://www.depo.blueweb.sk/kyberia/css/kyberia.css'>
<title>zelame tlupe domestikovanych primatov uspech v buchani drevenymi palickami do cierneho kotucika</title><br />
<br />
{if $node.node_name eq 'mail'}<br />

<script><br />
function vymena() {ldelim}<br />
	document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;<br />
	document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';<br />
{rdelim}<br />
<br />
function chngto(name,id) {ldelim}<br />
	document.formular.mail_to.value = name ;<br />
	name = name.toLowerCase() ;<br />
	document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';<br />
{rdelim}<br />
</script><br />
{/if}<br />
<br />
</head>


<body>
hjghjghjhg
<!-- header -->
{if $user_id eq true}
  {include file="http://www.depo.blueweb.sk/kyberia/tpl/ZoneX_header.tpl"}
{/if}

<!-- error message -->
{if $error eq true}
  <center><span class='most_important'>
  {$error}
  </span></center>
{/if}

<!-- mail -->
{if $new_mail eq true}
  <center><a href='/id/24/' class='mail'>{$new_mail} nová správa od id {$new_mail_name}</a></center>
{/if}

<!-- banner -->
<div id='banner'></div>
<center><img src='http://kyberia.sk/upload/top.gif' border='0'></center>



<table width='780' align='center' valign='top' class='bordered2'>
<tr><br />
<td align='center' valign='top' style='width: 230px'><br />
	{get_nodes_by_type type=6 listing_amount=23 offset=$offset}<br />
	<center><span class='important'>user blogs</span></center><Br><br />
	{foreach from=$get_nodes_by_type item=child}<br />

		<table width='100%'><br />
			<tr><td><img src='{get_image_link id=$child.node_creator}' align='left' hspace='5' vspace='5' border='0'><br />
			<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:20:"n":true}</a><br>{$child.node_content|truncate:230|imagestrip|stripslashes|wordwrap:15:"n":true|imagestrip}<br />
			<br><center>by <a href='/id/{$child.node_creator}'>{$child.login}</a> {$child.node_views} views</center></td></tr><br />
		</table><br><br />
	{/foreach}<br />

	<a href='/blogs/'>more blogs??</a><br />
</td><br />
<td valign='top'><br />
	<center>{include file="modules/loginbox.tpl"}</center><br />
	<br><br><br />
	<Center><span align='center' class='important'>latest forums</span></center><br><br />
	{get_nodes_by_type type=3 listing_amount=10 offset=$offset}<br />
	{foreach from=$get_nodes_by_type item=child}<br />

		<a href='/id/{$child.node_id}'>{$child.node_name}</a><br />
		by <a href='/id/{$child.node_creator}'>{$child.login}</a><br />
		({$child.node_children_count} children)</a><br><br />
	{/foreach}<br />
<br />
	<br><br><br />
	<Center><span align='center' class='important'>latest data nodes</span></center><br><br />

	{get_nodes_by_type vector=;1;101 type=12 listing_amount=9 offset=$offset}<br />
	{foreach from=$get_nodes_by_type item=child}<br />
		<a href='/id/{$child.node_id}'>{$child.node_name}</a><br />
		by <a href='/id/{$child.node_creator}'>{$child.login}</a><br />
		in <a href='/id/{$child.node_parent}'>{$child.parent_name}</a><br><br />

	{/foreach}<br />
	<br><br />
	{get_nodes_by_type orderby="nodes.node_created desc" vector=;1;101 type=5 listing_amount=27 offset=$offset on_main='yes'}<br />
	<br><center><span class='important' align='center'>latest articles</span></center><br />
	{foreach from=$get_nodes_by_type item=child }<br />
		<table width='100%' class='bordered'><br />
			<tr><td><img src='{get_image_link id=$child.node_id}' align='left' hspace='5' vspace='5' border='0'><br />

			<a href='/id/{$child.node_id}'>{$child.node_name}</a><br><br />
			{$child.node_content|truncate:230|stripslashes}<br />
			<br><br><i>added by <a href='/id/{$child.node_creator}'>{$child.login}</a> <br />
into nodeshell <a href='/id/{$child.node_parent}'> {$child.parent_name}</a></i><br />
			</td></tr><br />

		</table><br><br />
	{/foreach}<br />
<br />
</td><br />
<td valign='top' style='width: 105px'><br />
	<center><br><a href='/id/31'>register</a></center><br />
	<br><br><br />
	{include file="modules/get_userlist.tpl"}<br />
</td><br />

<br />
</tr><br />
</table><br />
{include file="modules/footer.tpl"}<br />

</td></tr></table></html>


