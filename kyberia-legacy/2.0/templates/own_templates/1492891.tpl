<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}

<a href='/id/1492891/configure'>cnf</a>





{get_nodes_by_parent parent=0 listing_amount=$listing_amount offset=$offset}


{foreach from=$get_nodes_by_parent item=child}

<div style='margin-top: 10px;'>
<img width='50' hspace='5' src='{get_image_link id=$child.node_creator}' style='float:left; margin-right:5px;'><div style='background:#333;'>
<a href='/id/{$child.node_id}'>{$child.node_name}</a> <br> (written by <a href='/id/{$child.node_creator}'>{$child.login}</a> viewed {$child.node_views} times, {$child.node_children_count} submissions
<br style='clear:left;'></div>
<div style='margin-top: 5px;'>{$child.node_content} </div>
</div>

{/foreach}
 

{include file="modules/footer.tpl"}









