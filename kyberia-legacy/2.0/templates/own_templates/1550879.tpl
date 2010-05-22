<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{if $permissions.w eq true}

<div class='node_name'>
		title or keywords::
		<input type='text' name='node_name'>
    <input type='checkbox' name='no_html' value='yes'>&nbsp;NO HTML
<!--
	<td>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional data file::<input type='file' name='data_file'>
		&nbsp;{$user_quota}bytez
-->
</div>
<textarea name='node_content'>{$post_vars.node_content}</textarea>
<div class='666'>
	<input type='submit' name='event' value='add'>
	<select name='template_id'>
	<option value='4'>submission</option>
	<option value='3'>forum</option>
	<option value='2'>nodeshell</option>
	</select>

<input type='submit' name='template_event' value='preview'>
<!--<input type='checkbox' name='between' value='yes'><td valign='middle'>&nbsp;use between-->
{include file="modules/movement.tpl"}
<input type='submit' name='template_event' value='filter_by'>
<select name='search_type'><option value='user'>user</option><option value='content'>content</option>
</select>

<input type='hidden' name='node_parent' value='{$node.node_id}'>
{include file="modules/owner_toolbar.tpl"}
</div>

<!--<td>&nbsp;<input type='submit' name='event' value='delete'>-->
u have {$user_k}
<input type='submit' value='K' name='event'>


<input type='submit' name='event' value='put'> into <select name='nodeshell_id'>
{foreach from=$bookmarks key=id item=name}
<option value='{$id}'>{$name|strip_tags|truncate:42:"":true}</option>
{/foreach}
</select>

<br>
{if $permissions.w eq true}{include file="modules/get_node_userlist.tpl"}{/if}

{/if}
