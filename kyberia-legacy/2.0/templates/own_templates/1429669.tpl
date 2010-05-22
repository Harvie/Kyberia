<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{*
{get_movement_params}
{include file="modules/header.tpl"}

{if $error eq true}
{$error}

{/if}

{if $user_id eq false}
{include file="modules/loginbox.tpl"}


{else}


{include file="modules/get_nodes_by_type_small.tpl" vector=00000101000635320068381700683643 type=12 listing_amount=23}




{get_nodes_by_type type=12 vector=00000101000635320068381700683643 listing_amount=23 offset=$offset}
{foreach from=$get_nodes_by_type item=child}

{$child.node_name}

{/foreach} 
{/if} *}


{get_nodes_by_type  vector=00000101000635320068381700683643 type=2 listing_amount=2323232323 offset=$offset}
{foreach from=$get_nodes_by_type item=child}
{if $type eq 11}
	in node <a href='/id/{$child.node_id}'>{$child.node_id}</a>
     {*get_poll poll=$child*}
     {*include file="modules/show_poll.tpl" get_poll=$get_poll*}
     <br>
{else}
<a href='/id/{$child.node_id}'>{$child.node_name}</a><br>( {$child.login} :: {$child.node_children_count} submissionz)<br><br>
{/if}
{/foreach}


 {foreach from=$get_linked_nodes vector=0000000000000001 item=child}
 {$child.node_name}<br>
{/foreach}

{include file="modules/footer.tpl"}




