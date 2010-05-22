<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_nodes_by_type  orderby='rand()' vector=$vector type=$type listing_amount=$listing_amount offset=$offset}
{section name=list loop=$get_nodes_by_type}
<a href='/id/{$get_nodes_by_type[list].node_id}'>{$get_nodes_by_type[list].node_name}</a> <br><br>
{/section}