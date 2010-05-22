<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
<script language="javascript" src="/id/1499862/download"></script>

<table width=100%>
<tr><td valign='top' width=20%>

{*friends*}
<table cellspacing="0" cellpadding="0" style="margin-left: 7px;">
{get_userlist}
{if $active_friends eq true}
<center><b>friends</b></center>
{foreach from=$active_friends item=active_friend}
<tr><td width="100%" valign="top" align="left">
<a href='/id/{$active_friend.user_id}/' title='{$active_friend.login|strip_tags}'>
<img border='0' width='23' height='23' alt='{$node_visitor.login|strip_tags}' src='{get_image_link id=$active_friend.user_id}' style="float:left;"></a>[<a href='/id/{$active_friend.user_action_id}'>{$active_friend.user_action|strip_tags}</a>]<br>{$active_friend.idle_time_minutes}min {$active_friend.idle_time_seconds}sec
</td></tr>
{/foreach}
{/if}
<tr><td>
<center><b>users on.line</b></center>
{foreach from=$active_users item=active_user}
<center><a
href='/id/{$active_user.user_id}'>{$active_user.login|strip_tags}</a><br></center>
{/foreach}
</td></tr>
</table>

</td>

<td valign='top' width=50%>

<form method='post' action='/id/{$node.node_id}'>

{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
{* showing bookmark category  *}
{if $bookmark_category.node_name neq false}
<a href="javascript:chngbukcat('{$bookmark_category.node_id}')"><font color="#6DAE42">kategoria</font></a>:: <a class='important' href='/id/{$bookmark_category.node_id}/configure'>{$bookmark_category.node_name}</a>
        {if $bookmark_category.sum neq false}
                :: <span class='most_important'> {$bookmark_category.sum} NEW</span>
        {/if}
{/if}

<br>
{foreach from=$bookmark_category.children item=bookmarks}
{if $bookmarks.node_name && $bookmarks.node_id}
<input style='height: 11px; width: 11px;' type='checkbox' name='bookmarks_chosen[]' value='{$bookmarks.node_id}'>
<a href='/id/{$bookmarks.node_id}'>{$bookmarks.node_name|strip_tags}</a>
{if $bookmarks.node_user_subchild_count neq false} :: <span class='most_important'>{$bookmarks.node_user_subchild_count} NEW CHILDREN</span>
{/if}

{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
:: <span class='most_important'>!!NEW DESCENDANT!!</span>
{/if}

<br>
{/if}
{/foreach}

<br>
{/foreach}

<input type='text' name='bookmark_category_id'><input type='submit' name='event' value='set_bookmark_category'>
</form>

</td></tr></table>

{include file="modules/footer.tpl"}