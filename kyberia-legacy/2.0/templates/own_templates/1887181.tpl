<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_nodes_by_vector vector=$vector listing_amount=2323666 offset=$offset on_main=$on_main}

<div style="width:800px; margin: auto; ">
{foreach from=$get_nodes_by_vector item=child}
{id $child.external_link eq "db://user"}

<div style="float: left; width: 200px; text-align:center;"><a href="/id/{$child.node_id}">{$child.node_name}</a>::<a href="/id/{$child.node_id}/4">4</a></div>

{/if}
{/foreach}

</div>



