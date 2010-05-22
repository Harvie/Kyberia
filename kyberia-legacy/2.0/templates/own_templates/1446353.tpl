<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

<ul id="bookmarks">

{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}

	{if $bookmark_category.node_name neq false}
		<li><h1>{$bookmark_category.node_name}</h1></li>
	{else}
		<li>{$bookmark_category.node_id}</li>
	{/if}

	{foreach from=$bookmark_category.children item=bookmarks}
		<ul>

		{if $bookmarks.node_name}
			<li>
			<a href='/id/{$bookmarks.node_id}'>{$bookmarks.node_name}</a>

			{if $bookmarks.node_user_subchild_count neq false}
				<strong>({$bookmarks.node_user_subchild_count} New Children)</strong>
			{/if}

			{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
				<strong>(New descendant)</strong>
			{/if}
			</li>
		{/if}

		</ul>
	{/foreach}

{/foreach}

</ul>
