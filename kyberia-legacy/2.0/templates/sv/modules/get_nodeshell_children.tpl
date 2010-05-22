<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_children listing_amount='23232323232323' offset=$offset types=$children_types}
{foreach from=$get_children item=child}
{$child.depth} 
{if $child.node_type eq 2}
nodeshell:: <a class='important' href='/id/{$child.node_id}'>{$child.node_name}</a> :: 
(<a href='/id/23/{$child.node_thread_vector};{$child.node_id}'>posledne</a>,
<a href='/id/15/{$child.node_thread_vector};{$child.node_id}'>k</a>)
<br>
{elseif $child.node_type eq 3}
&nbsp;forum:: <a href='/id/{$child.node_id}'>{$child.node_name}</a> :: 
({if $child.node_user_subchild_count} <span class='most_important'>{$child.node_user_subchild_count} NEW</span>{/if})<br>
{elseif $child.node_type eq 5}
&nbsp;article:: <a href='/id/{$child.node_id}'>{$child.node_name}</a><br>

{/if}
{/foreach}
