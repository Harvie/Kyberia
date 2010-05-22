<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}


{if $error eq true}
<center><span style='error'>{$error}</span></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if} 

<table width='100%'><tr>


<!--left column-->
<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="modules/node_settings.tpl"}

{* showing poll *}
{include file="modules/get_poll_box.tpl"}
<br>
{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td>

<!--end of left column-->

<!--main central column-->
<td valign='top'>
{*showing node_content*}
{include file="modules/node_content.tpl"}

<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}
</form>

{get_nodes_by_parent parent=1571388 listing_amount=666 offset=$offset}
<span class="important">nodes::</span><br>
{foreach from=$get_nodes_by_parent item=child}
<!--
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'> -->
	recycled:: <a href='/id/{$child.node_id}'>{$child.node_id}||{$child.node_name}</a> :: {if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}(<a href='/id/{$child.node_id}/1961033'>configure</a>){/if}	
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{/foreach}
<br><br>
<span class="important">forum::</span>
{include file="1549839.tpl" children_type=4}
<!--end of central column-->
</td></tr></table>


{include file="modules/footer.tpl"}

