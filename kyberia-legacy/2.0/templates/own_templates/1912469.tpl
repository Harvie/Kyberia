<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{math equation="x*2" x=100 assign=list}
{get_movement user_id=$user_id offset=$offset listing_amount=$list} 
 {foreach from=$get_movement name=graf item=movement}
{if $smarty.foreach.graf.first} 
0 {$movement.node_id}::{$movement.node_name} 1 html<br>
{/if}
{$smarty.foreach.graf.iteration} [{$movement.node_id}::{$movement.node_name}] {math equation="x+1" x=$smarty.foreach.graf.iteration} host<br>
{math equation="x+1" x=$smarty.foreach.graf.iteration} [{$movement.node_parent}] -1 image<br>
{/foreach}


