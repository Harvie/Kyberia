<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_nodes_by_type vector=;1;103 type=$type listing_amount=$listing_amount offset=$offset}
{foreach from=$get_nodes_by_type item=child}
{if $type eq 11}
<a href='/id/{$child.node_parent}'>{$child.node_name}</a><br>( {$child.login})<br><br>
{else}
<a href='/id/{$child.node_id}'>{$child.node_name}</a><br>( {$child.login} :: {$child.node_children_count} submissionz)<br><br>
{/if}
{/foreach}
