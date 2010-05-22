<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
<div style="position:relative; width:100% height:100%; text-align:center;">
{if $error eq true}
{$error}
{/if}


<div style="text-align:left; position:relative; width: 780px; margin: 0 auto;">
<img src="/upload/top.gif">
<div style="border:1px solid #6dae42; border-top:0; width: 778px; _width:780px;">
<div style="float: left; width:25%; margin-left:5px;">
<span class="important">latest data nodes::</span><br> <br>

{get_nodes_by_type type=12 listing_amount=23 offset=$offset}
	{foreach from=$get_nodes_by_type item=child}
		<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:40:"<br>":true}</a><br>
		by <a href='/id/{$child.node_creator}'>{$child.login|wordwrap:40:"<br>":true}</a>
		in <a href='/id/{$child.node_parent}'>{$child.parent_name|wordwrap:40:"<br>":true}</a><br><br>

	{/foreach}
<br><br><br>
{get_nodes_by_parent parent=21 listing_amount=$listing_amount offset=$offset}
	<span class='important'>user blogs::</span><Br><Br>
	{foreach from=$get_nodes_by_parent item=child}
		<img src='{get_image_link id=$child.node_creator}' align='left' hspace='5' vspace='5' border='0'>
<a href='/id/{$child.node_id}'>{$child.node_name|strip_tags|wordwrap:20:"<br>":true}</a><br>{$child.node_content|truncate:66|imagestrip|strip_tags|stripslashes|wordwrap:20:"<br>":true|imagestrip}
			<br>by <a href='/id/{$child.node_creator}'>{$child.login}</a> {$child.node_views} views
		<br><br style="clear:left;">
	{/foreach}

{include file="modules/node_settings.tpl"}
</div>
<div style="float: left; width:50%;  _width:360px; margin-left:5px;">
{include file="modules/loginbox.tpl"}<br><br>
<span class='important'>latest forums::</span><br><br>
{get_nodes_by_type type=3 listing_amount=10 offset=$offset}

	{foreach from=$get_nodes_by_type item=child}
		<a href='/id/{$child.node_id}'>{$child.node_name|strip_tags}</a>
		by <a href='/id/{$child.node_creator}'>{$child.login}</a>
		({$child.node_children_count} children)</a><br>
	{/foreach}<br>

{get_linked_nodes}<br> 
<span class='important'>latest articles::</span><br><br>

{foreach from=$get_linked_nodes item=child }
<div style="border:1px solid #6dae42;">
<img width=75 src='{get_image_link id=$child.node_id}' align='left' hspace='5' vspace='5' border='0'>
<a href='/id/{$child.node_id}'>{$child.node_name}</a><br>
{$child.node_content|truncate:20|stripslashes|strip_tags}
<br><br><i>node created by <a href='/id/{$child.node_creator}'>{$child.login}</a>,synapse link created by <a href='/id/{$child.synapse_creator}'>{$child.linker}</a>
<br>
{/foreach}
<br> 


</div>

<div style="float:right; width: 20%; margin-right:5px; margin-top:23px;">
<center><a href='/id/31'>register</a><br>
<form action='/id/25/' method='post'>
<input type='text' value='{$smarty.post.query}' name='query'>
<input type='submit' name='template_event'  value='search'><br>
</form><br><br></center>
 {include file="modules/get_userlist.tpl"}
</div>

</div>

<br style="clear:both;">

</div>
</div>
</div>
{include file="modules/footer.tpl"}