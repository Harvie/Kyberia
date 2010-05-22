<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<center><span class='important'>top {$offset} - {math equation="x+y" x=$offset y=$listing_amount}</span></center><br><br>
{get_nodetype_by_views offset=$offset listing_amount=$listing_amount node_type=$node_type}
{section name=list loop=$nodetype_by_views}
{*math equation="x+y" x=$smarty.section.list.iteration y=$offset*}
{$nodetype_by_views[list].node_views} views :: 
<a href='/id/{$nodetype_by_views[list].node_id}'>{$nodetype_by_views[list].node_name}</a> <br><br>
{/section}