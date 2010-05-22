<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_nodes_by_type type=$type listing_amount=$listing_amount offset=$offset}
{foreach from=$get_nodes_by_type item=child}

{if $child.node_type eq 6 or $child.node_type eq 13 }
{$child.node_name}<br>
{/if}

{/foreach}
