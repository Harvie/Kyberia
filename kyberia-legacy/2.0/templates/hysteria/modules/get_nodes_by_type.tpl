<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_nodes_by_type type=$type listing_amount=$listing_amount offset=$offset vector=';1;102'}
{foreach from=$get_nodes_by_type item=child}
<table class='bordered' width='100%'>
<tr>
<td>{$child.node_content|truncate:320|stripslashes}</td></tr>
</table>
{/foreach}
