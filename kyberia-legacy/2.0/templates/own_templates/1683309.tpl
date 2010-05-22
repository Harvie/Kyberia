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
<center><font style='error'>{$error}</font></center>
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
{if $permissions.w eq true}
<table>
	<tr><td>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;title or keywords::
		<input type='text' name='node_name'>
	</td>
	<td><input type='checkbox' name='no_html' value='yes'><td valign='middle'>&nbsp;NO HTML</td>

</tr></table>

<textarea name='node_content'></textarea>

<table width=666><tr>
<td>

	<input type='submit' name='event' value='add'>
<td>
	<select name='template_id'>
	<option value='2'>nodeshell</option>
	<option value='3'>forum</option>
	<option value='4'>submission</option>
	<option value='5'>article</option>
	<option value='10'>bookcat</option>
	<option value='12'>data</option>
	<option value='14'>template</option>
	<option value='28'>rss_bot</option>
	<option value='1683309'>noudshell</option>
	</select>
</td>

<td><input type='submit' name='template_event' value='preview'>
<td><table><tr>
<td><input type='hidden' name='get_children_offset' value='0'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input class='small' name='listing_amount' type='text' value=''></td>
<td><select name='listing_order'>
<option value='desc'  selected >zozadu :-)</option>
<option value='asc'  >(-: zpredu</option></select></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table></td>

<td align='left'><input type='submit' name='template_event' value='filter_by'>
<td align='left'><select name='search_type'><option value='user'>user</option><option value='content'>content</option>
</select>

<td><input type='hidden' name='node_parent' value='{$node.node_id}'>
</tr>

<tr><td colspan='5' align='center'>
<table><tr><td colspan='5' align='center'>
<input type='submit' name='event' value='delete'>
&nbsp;<input type='submit' name='event' value='set_parent'>::<input type='text' name='new_parent'>
</td></tr></table></td></tr>
</table>

<table align='center'>
<tr>
<td>u have {$user_k}</td>
<td><input type='submit' value='K' name='event'></td>
</tr>
</table>

{/if}
</form>

{get_children listing_amount='23232323232323' offset=$offset types=$children_types}


{foreach from=$get_children item=child}
{$child.depth} 

{if $child.template_id eq 2}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	nodeshell:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: 
	(<a href='/id/23/{$child.node_vector}'>posledne</a>, <a href='/id/15/{$child.node_vector}'>k</a>,
	{if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if})
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;NEW DESCENDANT</span>{/if}	
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 1417553}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	node-hell:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: 
	(<a href='/id/23/{$child.node_vector}'>posledne</a>, <a href='/id/15/{$child.node_vector}'>k</a>,
	{if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if})
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;NEW DESCENDANT</span>{/if}	
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 1683309}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	noudshell:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: 
	(<a href='/id/23/{$child.node_vector}'>posledne</a>, <a href='/id/15/{$child.node_vector}'>k</a>,
	{if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if})
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;NEW DESCENDANT</span>{/if}	
	(<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 3}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;forum:: <a href='/id/{$child.node_id}'>{$child.node_name}</a> :: 
	({$child.node_children_count} children{if $child.node_user_subchild_count} <span class='most_important'> {$child.node_user_subchild_count} NEW</span>{/if})
	({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>
	{if $child.lastdescendant_created > $child.last_visit}<span class='most_important'>&nbsp;NEW DESCENDANT</span>{/if}	
{$child.login}</a>)<br>

{elseif $child.template_id eq 4}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;submission:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>  ::
	({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 5}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;article:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>  :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 10}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;bookcat:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>) :: {$child.node_id}<br>

{elseif $child.template_id eq 12}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;data:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>  :: ({if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<a href='/id/{$node.node_id}/configure'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq 14}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;template:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a>  :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>) :: {$child.node_id}<br>

{elseif $child.template_id eq 28}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;rss_bot:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>)<br>

{elseif $child.template_id eq $child.node_id}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;templejt:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>) :: {$child.node_id}<br>

{else}

<input style='height: 11px; width: 11px;' type='checkbox' value='{$child.node_id}' name='node_chosen[]'>&nbsp;
	&nbsp;node:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> ::
	({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if}) (<a href='/id/{$child.node_creator}'>{$child.login}</a>) <br>
{/if}
{/foreach}


{get_linked_nodes orderby=$listing_order}
{foreach from=$get_linked_nodes item=link}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$link.node_id}' name='node_chosen[]'>&nbsp;
	link:: <a class='important' href='/id/{$link.node_id}'>{$link.node_name}</a> :: 
	(<a href='/id/23/{$link.node_vector}'>posledne</a>,

	<a href='/id/15/{$link.node_vector}'>k</a>)
	{if $link.synapse_created > $link.last_visit}<span class='most_important'>&nbsp;NEW LINK</span>{/if}	(({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if})
	(<a href='/id/{$link.synapse_creator}'>{$link.login}</a>) <br>
{/foreach}


{foreach from=$get_linked_bookmarks item=link}
<input style='height: 11px; width: 11px;' type='checkbox' value='{$link.node_id}' name='node_chosen[]'>&nbsp;
	bookmark:: <a class='important' href='/id/{$link.node_id}'>{$link.node_name}</a> :: 
	(<a href='/id/23/{$link.node_vector}'>posledne</a>,
	<a href='/id/15/{$link.node_vector}'>k</a>)
	{if $link.synapse_created > $link.last_visit}<span class='most_important'>&nbsp;NEW LINK</span>{/if}	
	(<a href='/id/{$link.synapse_creator}'>{$link.login}</a>) ({if $child.node_creator eq $user_id or $child.node_permission eq 'master' or $child.node_permission eq 'op'}<a href='/id/{$child.node_id}/configure'>configure</a>{/if})<br>
{/foreach}

<!--end of central column-->
</td></tr></table>

{include file="modules/footer.tpl"}