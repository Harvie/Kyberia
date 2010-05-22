<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>

{else}

<table width=100% cellpadding='5'>
<tr>
<td valign='top' width=20%>
</td>

<td valign='top' width=70%>

{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
{* showing bookmark category  *}

{foreach from=$bookmark_category.children item=bookmarks}
{if $bookmarks.parent eq $node.node_id}

<input style='height: 11px; width: 11px;' type='checkbox' name='bookmarks_chosen[]' value='{$bookmarks.node_id}'>
<a href='/id/{$bookmarks.node_id}'>{$bookmarks.node_name|strip_tags}</a>

{if $bookmarks.node_user_subchild_count neq false} :: <span class='most_important'>{$bookmarks.node_user_subchild_count} NeW</span>
{/if}

{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}:: <span class='most_important'>DeSC</span>
{/if}
{if $bookmarks.node_creator eq $user_id or $bookmarks.node_permission eq 'master' or $bookmarks.node_permission eq 'op'} :: [<a href='/id/{$bookmarks.node_id}/configure'>configure</a>]{/if}
</div>

{/if}
{/foreach}

<br>

{/foreach}

</td>
</tr></table>
{/if}

{include file="modules/footer.tpl"}
