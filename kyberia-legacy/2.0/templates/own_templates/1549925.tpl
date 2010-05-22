<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<table>
<tr><td colspan='2' align='center'>
<img src='{get_image_link id=$node.node_id}'>
</td></tr>
<tr><td>node:</td><td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<tr><td>template:</td><td><a href='/id/{$node.template_id}'>{$node.template_id}</a></td></tr>
<tr><td>parent:</td><td><a href='/id/{$node.node_parent}'>{$node.node_parent_name}</a></td></tr>
<tr><td>owner:</td><td><a href='/id/{$node.node_creator}'>{$node.owner}</a></td></tr>
</table>
<br>
<table class='bordered'>
<tr><td colspan='2' align='center' class='important'>permissions</td></tr>
<tr><td>you:</td><td align='center'>
{if $permissions.r}r,{/if}
{if $permissions.w}w,{/if}
{$node.node_permission}
</td></tr>
<tr><td>system:</td><td align='center'>{$node.node_system_access}</td></tr>
<tr><td>net:</td><td align='center'>{$node.node_external_access}</td></tr>
</table>
<br>
<center><a href='/id/{$node.node_id}/1961036'>neurons</a></center>
<br>
<center><a href='/id/{$node.node_id}/1961037'>statistics</a><a href='/id/{$node.node_id}/748131'>/sort</a></center></a></center>
<!-- <center><a href='/id/{$node.node_id}/offtopic'>offtopic</a></center> -->
<center><a href='/id/{$node.node_id}/14'>source</a></center>
<center><a href='/id/{$node.node_id}/links'>links</a></center>
<!-- <center><a href='/id/{$node.node_id}/print'>print</a></center> -->
<center><a href='/id/15/{$node.node_vector}'>k</a></center>
<table>
<tr>
<td colspan='2' align='center'>
<br><span class='important'>node viewed {$node.node_views} times</span>
<br><span class='important'>total descendants::{$node.node_descendant_count}</span>
<br><span class='important'>total children::{$node.node_children_count}</span>
{if $node.node_user_subchild_count neq false}
<br><span class='most_important'>{$node.node_user_subchild_count} NEW</span>
{/if}
{if $node.k neq false}
<br><span class='most_important'>{$node.k} K</span><br><br>
{/if}

{if $offset neq false}
<br><span class='important'>using offset:: {$offset} </span>
{/if}
</td>
</tr>
<form action='/id/{$node.node_id}/' method='post'>
<tr><td colspan='2' align='center'>
{if $node.node_bookmark neq 'yes'}
<input type='submit' name='event' value='book'>
{else}
<input type='submit' name='event' value='unbook'>
{/if}
&nbsp;
<input type='submit' name='event' value='K'>
</td></tr>
</form>
</table>
{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<center><a href='/id/{$node.node_id}/1961033'>configure</a></center>{/if}
<br>
<center><a href='/id/{$node.node_id}/3'>!!!show flat!!!</a></center>
<br>


