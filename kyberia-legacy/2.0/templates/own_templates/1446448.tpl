<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

<div style="
	margin:		1em;
	padding:	2em;
	border:		1px solid darkgreen;
">


<form method='post' action='/id/{$node.node_id}'>

{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
	<ul>

	{* showing bookmark category  *}
	{if $bookmark_category.node_name neq false}

		<li>
		<a href='/id/{$bookmark_category.node_id}/'>
			<h1>{$bookmark_category.node_name}</h1>
		</a>
		</li>
		

	{/if}

	{foreach from=$bookmark_category.children item=bookmarks}
		{if $bookmarks.node_name}
			<input style='height: 11px; width: 11px;' type='checkbox' name='bookmarks_chosen[]' value='{$bookmarks.node_id}'> 

			<a href='/id/{$bookmarks.node_id}'>
				{$bookmarks.node_name}
			</a>

			{if $bookmarks.node_user_subchild_count neq false}
				:: <span class='most_important'>
						{$bookmarks.node_user_subchild_count} NEW CHILDREN
				</span>
			{/if}

			{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
				:: <span class='most_important'>
					!!NEW DESCENDANT!!
				</span>
			{/if}

			<br>
		{/if}
	{/foreach}

	</ul>
{/foreach}

<input type='text' name='bookmark_category_id'>
<input type='submit' name='event' value='set_bookmark_category'>
</form>


</div>