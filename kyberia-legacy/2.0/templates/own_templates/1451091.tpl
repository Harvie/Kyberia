<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}
<center><span class='important'>k data nodes
{if $action}{get_k vector=$action} in vector {$action}
{else}{get_k}
</span>
</center>
{/if}
{foreach from=$get_k item=k}
<table class='bordered' style="margin: 1em; border: 1px solid #6dae42;">
<tr>
<td align='center' rowspan='2' valign='top'>
<img border='0' hspace='5' width='50' src={get_image_link id=$k.node_creator}>
<span class='most_important'>{$k.k} k</span>
</td>
<td class='header' width='100%'><a href='/id/{$k.node_id}/'>{$k.node_name}</a>
 in <a href='/id/{$k.node_parent}'>{$k.parent_name}</a> by <a href='/id/{$k.node_creator}'>{$k.creator}</a></td>
<tr><td valign='top'>{$k.node_content|stripslashes|nl2br}</td></tr>
</tr>
</table>
{/foreach}
<br>
{include file="modules/footer.tpl"}
  





