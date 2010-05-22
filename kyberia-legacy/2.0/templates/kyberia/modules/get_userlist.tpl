<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<div class='active_users'>
<table cellspacing='0' cellpadding='0'>
{get_userlist}
{if $active_friends eq true}
<tr><td width=100%>
<span class='important'><center>friends</center></span>
{foreach from=$active_friends item=node_visitor}
<div class='active_user'><div class='active_user_img'><a href='/id/{$node_visitor.user_id}/'><img border='0' name='{$node_visitor.login}' width='50' height='50' alt='{$node_visitor.login}' title='{$node_visitor.login}' src='{get_image_link id=$node_visitor.user_id}'></a></div></div>
{/foreach}
</td></tr>
{/if}
<tr><td>
<span class='important'><center>users on.line</center></span>
{foreach from=$active_users item=node_visitor}
<center><a href='/id/{$node_visitor.user_id}'>{$node_visitor.login}</a><br></center>
{/foreach}
</td></tr>
</table>