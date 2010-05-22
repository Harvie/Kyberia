<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<table>
<tr><td colspan='2' align='center'></td></tr>
<tr><td>názov:</td><td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<tr><td>rubrika:</td><td><a href='/id/{$node.node_parent}'>{$node.node_parent_name}</a></td>
<tr><td>vytvoril:</td><td><a href='/id/{$node.node_owner_id}'>{$node.owner}</a></td>
</table>
<table>
<tr>
<td colspan='2' align='center'>
<br><span class='important'>zobrazené {$node.node_views} krát</span>
<br><span class='important'>{$node.node_children_count} príspevok</span>
{if $node.node_user_subchild_count neq false}
<br><span class='most_important'>{$node.node_user_subchild_count} NEW</span>
{/if}
{if $offset neq false}
<br><span class='important'>using offset:: {$offset} </span>
{/if}
</td>
<tr><td colspan='2' align='center'>
</td></tr>
</table>
{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<center><a href='/id/{$node.node_id}/configure'>configure</a></center>{/if}
<br>
{if $node.node_type eq 'forum'}<center><a href='/id/{$node.node_id}/threaded_forum'>!!!show threaded!!!</a></center>{/if}
<br>