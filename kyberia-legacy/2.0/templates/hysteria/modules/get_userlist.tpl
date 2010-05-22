<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<div class='active_users'>
<table cellspacing='0' cellpadding='0'>
{get_userlist vector=;1;102}
{if $active_friends eq true}
<tr><td width=100%>
<span class='important'><center>friends</center></span>
{foreach from=$active_friends item=node_visitor}
<a href='/id/{$node_visitor.user_id}'>{$node_visitor.login}</a><br>
{/foreach}
</td></tr>
{/if}
<tr><td>
<br><span class='important'><center>users on.line</center></span>
{foreach from=$active_users item=node_visitor}
<a href='/id/{$node_visitor.user_id}'>{$node_visitor.login}</a>
&nbsp;[<a href='/id/{$node_visitor.user_action_id}'>{$node_visitor.user_action|truncate:12}</a>]<br>
{/foreach}
</td></tr>
</table>