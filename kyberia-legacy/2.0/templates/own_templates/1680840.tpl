<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}

<div style='position: fixed;height: 100%;background-color:black;z-index: 2'>
<div class='active_users' style='margin-left: 10px; width: 200px'>
<span class='important'><center>friends</center></span>
{if $action}{get_userlist vector=$action} in vector {$action}
{else}{get_userlist}
{/if}

{foreach name=friends from=$active_friends item=active_friend}<a href='/id/{$active_friend.user_id}'><img name='{$active_friend.login}' alt='{$active_friend.login}' title='{$active_friend.login}' src='{get_image_link id=$active_friend.user_id}' border='0' height='50' width='50'></a>{/foreach}
</div>




<div style='margin-left: 10px; margin-top: 5px; width: 200px'>
<span class='important'><center>new forums</center></span>
{get_nodes_by_type type=3 listing_amount=10 offset=$offset}
{foreach from=$get_nodes_by_type item=child}
<a href='/id/{$child.node_id}'>{$child.node_name|strip_tags}</a>
{$child.login} ({$child.node_children_count})</a><br>
{/foreach}
</div>

<div style='margin-left: 10px; margin-top: 5px; width: 200px; text-align: justify'>
<span class='important'><center>users online</center></span>
{foreach name=users from=$active_users item=active_user}
<a href="/id/{$active_user.user_id}">{$active_user.login}</a>
{/foreach}
</div>
</div>



<div style='position: absolute; left: 240px; top: 16px'>
{if $action}{get_k vector=$action} in vector {$action}
{else}{get_k}
</span>
<!--{include file="modules/movement.tpl"}-->
{/if}

{foreach from=$get_k item=k}
<table class='bordered'>
<tr>
<td align='center' rowspan='2' valign='top'>
<img border='0' hspace='5' width='50' src={get_image_link id=$k.node_creator}>
<span class='most_important'>{$k.k} k</span><br />
<form action='/id/{$k.node_id}' method='post' name='kit'>
<input type='submit' style='position: static' value='K' class='k' name='event'>
</form>
</td><br />
<td class='header' width='100%'><a href='/id/{$k.node_id}/'>{$k.node_name}</a>
in <a href='/id/{$k.node_parent}'>{$k.parent_name}</a> by <a href='/id/{$k.node_creator}'>{$k.creator}</a></td>

<tr><td valign='top'>{$k.node_content|stripslashes|nl2br}</td></tr>
</tr>
</table>
<br>
{/foreach}


<br /><br /><br /><br /><br /><br />
{include file="modules/footer.tpl"}
</div>







