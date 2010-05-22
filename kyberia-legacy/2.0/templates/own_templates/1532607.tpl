<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<table width='100%' class='bordered'><tr><td>

{include file="modules/header.tpl"}<br />

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
<td width=666 valign='top'>
{*showing node_content*}
{include file="modules/node_content.tpl"}
{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'>
{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}
</form>

{get_children listing_amount='23232323232323' offset=$offset types=$children_types}

{foreach from=$get_children item=child}
{$child.depth} 

{if $child.template_id eq 2}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	nodeshell:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: 
	(<a href='/id/23/{$child.node_vector}'>posledne</a>,
	<a href='/id/15/{$child.node_vector}'>k</a>)
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW DESCENDANT</span>{/if}	
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>
{elseif $child.template_id eq 3}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;forum:: <a href='/id/{$child.node_id}'>{$child.node_name}</a> :: 
	({$child.node_children_count} children{if $child.node_user_subchild_count} <span class='most_important'> {$child.node_user_subchild_count} NEW</span>{/if})
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW DESCENDANT</span>{/if}	
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>
{elseif $child.template_id eq 5}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;article:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>
{elseif $child.template_id eq 12}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;data:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>
{elseif $child.template_id eq 14}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;template:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 4}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;submission:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 28}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;rss_bot:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>


{else}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;shit:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>
{/if}
{/foreach}

{get_linked_nodes orderby=$listing_order}
{foreach from=$get_linked_nodes item=link}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$link.node_id}' name='node_chosen[]'>&nbsp;
	link:: <a class='important' href='/id/{$link.node_id}'>{$link.node_name}</a> :: 
	(<a href='/id/23/{$link.node_vector}'>posledne</a>,
	<a href='/id/15/{$link.node_vector}'>k</a>)
	{if $link.synapse_created > $link.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW LINK</span>{/if}	
	(<a href='/id/{$link.synapse_creator}'>{$link.login}</a>)<br>
{/foreach}

{foreach from=$get_linked_bookmarks item=link}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$link.node_id}' name='node_chosen[]'>&nbsp;
	bookmark:: <a class='important' href='/id/{$link.node_id}'>{$link.node_name}</a> :: 
	(<a href='/id/23/{$link.node_vector}'>posledne</a>,
	<a href='/id/15/{$link.node_vector}'>k</a>)
	{if $link.synapse_created > $link.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW LINK</span>{/if}	
	(<a href='/id/{$link.synapse_creator}'>{$link.login}</a>)<br>
{/foreach}


<!--end of central column-->

</td></tr></table>

{include file="modules/footer.tpl"}

</td></tr></table>





