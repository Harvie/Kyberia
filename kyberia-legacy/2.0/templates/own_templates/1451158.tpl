<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

<form method='post' action='/id/{$node.node_id}'>

<ul id="bookmarks">
{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
	{if $bookmark_category.node_name neq false}
		<li><hr noshade><h1><a href="/id/{$bookmark_category.node_id}">{$bookmark_category.node_name}</a></h1></li>
	{else}
		<li>{$bookmark_category.node_id}</li>
	{/if}
	{foreach from=$bookmark_category.children item=bookmarks}
		<ul>
		{if $bookmarks.node_name}
			<li>
			<input style='height: 11px; width: 11px;' type='checkbox' name='bookmarks_chosen[]' value='{$bookmarks.node_id}'>&nbsp;&nbsp;&nbsp;<a href='/id/{$bookmarks.node_id}'>{$bookmarks.node_name}</a>
			{if $bookmarks.node_user_subchild_count neq false}
				<strong> [{$bookmarks.node_user_subchild_count} New]</strong>
			{/if}
			{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
				<strong> [Babooo]</strong>
			{/if}
			</li>
		{/if}
		</ul>
	{/foreach}
{/foreach}
<br>
<input type='text' name='bookmark_category_id'> <input type='submit' name='event' value='set_bookmark_category'>
</form>
</ul>
{include file="modules/footer.tpl"} 






