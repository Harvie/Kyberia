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

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{include file="modules/node_settings.tpl"}
{include file="modules/children_types.tpl"}
{* showing poll *}
{include file="modules/get_poll_box.tpl"}
<br>
{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td>
<!--end of left column-->

<td valign='top'>
{get_bookmarks user_id=$node.node_id}
{foreach from=$get_bookmarks item=bookmark}
<a href='/id/{$bookmark.node_id}'>{$bookmark.node_name}</a> 
{if $bookmark.node_user_subchild_count eq true}
	<span class='most_important'>({$bookmark.node_user_subchild_count} UNREAD)</span>
{/if}
<br>

{/foreach}
</td>

<!--end of central column-->

</td></tr></table>
{/if}

{include file="modules/footer.tpl"}