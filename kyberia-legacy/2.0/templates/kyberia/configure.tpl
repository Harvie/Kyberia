<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}

<table style='width: 100%; align:center;'>
<tr><td align='center'>
{if $node.node_creator eq $user_id}{include file="modules/configure.tpl"}{/if}
{if $node.node_creator eq $user_id or $node.node_permission eq 'master'}{include file="modules/configure_content.tpl"}{/if}

<form action='/id/{$node.node_id}/' method='post'>

	{if $node.node_creator eq $user_id or $node.node_permission eq 'master'}{include file="modules/configure_poll.tpl"}{/if}
	{get_node_commanders}
	{if $node.node_permission eq 'owner'}{include file="modules/masterlist.tpl"}{/if}
	{if $node.node_permission eq 'master'}{include file="modules/oplist.tpl"}{/if}
	{if $node.node_permission eq 'op'}{include file="modules/accesslist.tpl"}{/if}
</form>
</td></tr>
</table>
{include file="modules/footer.tpl"}