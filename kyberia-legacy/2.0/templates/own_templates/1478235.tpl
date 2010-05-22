<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
<link rel='stylesheet' type='text/css' href='http://freezy.rulez.sk/bkmrks.css'>

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>

{else}

<script language="javascript" src="/id/1478235/download"></script>

<table width=100% cellpadding='5'>
<tr><td valign='top' width='110'>
<center>
{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<a href='/id/{$node.node_id}/configure'>configure</a><br>
{/if}
<a href='/id/{$node.node_id}/forum'>!!!show flat!!!</a></center>

{*friends*}
<table cellspacing="0" cellpadding="0">
{get_userlist}
{if $active_friends eq true}
<b'><center>friends</center></b>
{foreach from=$active_friends item=active_friend}
<tr><td width="100%" valign="top" align="left"><div class='b_friend'>
<a href='http://kyberia.sk/id/{$active_friend.user_id}/' title='{$active_friend.login|strip_tags}'>
<img border='0' alt='{$active_friend.login|strip_tags}' width='23' height='23' alt='{$node_visitor.login|strip_tags}' src='{get_image_link id=$active_friend.user_id}'></a>[<a href='http://kyberia.sk/id/{$active_friend.user_action_id}'>{$active_friend.user_action|strip_tags}</a>]<br>{$active_friend.idle_time_minutes}min {$active_friend.idle_time_seconds}sec
</div></td></tr>
{/foreach}
{/if}
<tr><td>
<br>
<b><center>users on.line</center></b>
{foreach from=$active_users item=active_user}
<center><a
href='http://kyberia.sk/id/{$active_user.user_id}'>{$active_user.login|strip_tags}</a><br></center>
{/foreach}
</td></tr>
</table>

</td>

<td valign='top' width=650>

<form method='post' action='/id/{$node.node_id}'>
<span class='tt'>&nbsp</span>
{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
<!-- <h2>X</h2> --><div class='b_cat'>
{* showing bookmark category  *}
{if $bookmark_category.node_name neq false}

<a href="javascript:chngbukcat('{$bookmark_category.node_id}')">kategoria</a>:: <a class='important' href='/id/{$bookmark_category.node_id}/configure'>{$bookmark_category.node_name}</a>   
		{if $bookmark_category.sum neq false}
				:: <span class='most_important'> {$bookmark_category.sum} NeW</span>
		{/if} 
{/if}
{if $bookmark_category.node_name neq true}
~~~ UnSoRTeD ~~~
{/if}

<div class='b_item'>
{foreach from=$bookmark_category.children item=bookmarks}
{if $bookmarks.node_name && $bookmarks.node_id}
<div class="b_node">
<input style='height: 11px; width: 11px;' type='checkbox' name='bookmarks_chosen[]' value='{$bookmarks.node_id}'>
<a href='http://kyberia.sk/id/{$bookmarks.node_id}'>{$bookmarks.node_name|strip_tags}</a>

{if $bookmarks.node_user_subchild_count neq false} :: <span class='most_important'>{$bookmarks.node_user_subchild_count} NeW</span>
{/if}

{if $bookmarks.lastdescendant_created > $bookmarks.last_visit}:: <span class='most_important'>DeSC</span>
{/if}
{if $bookmarks.node_creator eq $user_id or $bookmarks.node_permission eq 'master' or $bookmarks.node_permission eq 'op'} :: [<a href='http://kyberia.sk/id/{$bookmarks.node_id}/configure'>configure</a>]{/if}
</div>

{/if}
{/foreach}</div></div>

<br>

{/foreach}
<input type='text' name='bookmark_category_id'><input type='submit' name='event' value='set_bookmark_category'>
</form>

</td>
</tr></table>
{/if}

{include file="modules/footer.tpl"}
<center>||&nbsp;|&nbsp;&nbsp;|||&nbsp;&nbsp;&nbsp;||&nbsp;|&nbsp;&nbsp;|&nbsp;&nbsp;||||&nbsp;&nbsp;||</center>
