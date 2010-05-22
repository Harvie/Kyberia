<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->


{get_movement user_id=1538 offset=$offset listing_amount=$listing_amount} 


{math equation="max(x)" x=$get_movement}

{*section name=bb loop=$get_movement}
 {math equation="max(x)" x=$get_movement[bb].node_id}
{/section*}

<br><br>

Graph<br>
{ldelim}<br>
&nbsp;&nbsp;&nbsp;### metadata ###<br>
&nbsp;&nbsp;&nbsp;@name="movment graph";<br>
&nbsp;&nbsp;&nbsp;@description=;<br>
&nbsp;&nbsp;&nbsp;@numNodes=dosadit+1;<br>
&nbsp;&nbsp;&nbsp;@numLinks={$listing_amount};<br>
&nbsp;&nbsp;&nbsp;@numPaths=0;<br>
&nbsp;&nbsp;&nbsp;@numPathLinks=0;<br>
<br>

&nbsp;&nbsp;&nbsp;### structural data ###<br>
&nbsp;&nbsp;&nbsp;@links=[<br>

{foreach from=$get_movement name=grafnode item=movement}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @source={$movement.node_parent}; @destination={$movement.node_id}; {rdelim} ,<br>
{if $smarty.foreach.grafnode.last}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @source={$movement.node_parent}; @destination={$movement.node_id}; {rdelim}<br>
{/if}
{/foreach}
&nbsp;&nbsp;&nbsp;];<br>
&nbsp;&nbsp;&nbsp;@paths=;
<br><br>
&nbsp;&nbsp;&nbsp;### attribute data ###<br>
&nbsp;&nbsp;&nbsp;@enumerations=;<br>
&nbsp;&nbsp;&nbsp;@attributeDefinitions=<br>
&nbsp;&nbsp;&nbsp;[<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@name=$root;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@type=bool;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@default=|| false ||;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@nodeValues=[ {ldelim} @id=0; @value=T; {rdelim} ];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@linkValues=;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@pathValues=;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{rdelim},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@name=$tree_link;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@type=bool;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@default=|| true ||;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@nodeValues=;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@linkValues=;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@pathValues=;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{rdelim}<br>
&nbsp;&nbsp;&nbsp;];<br>
&nbsp;&nbsp;&nbsp;@qualifiers=[<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@type=$spanning_tree;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@name=$sample_spanning_tree;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@description=;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@attributes=[<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim}@attribute=0;@alias=$root;{rdelim},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim}@attribute=1;@alias=$tree_link;{rdelim}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{rdelim}<br>
&nbsp;&nbsp;&nbsp;];<br>
<br>
&nbsp;&nbsp;&nbsp;### visualization hints ###<br>
&nbsp;&nbsp;&nbsp;@filters=;<br>
&nbsp;&nbsp;&nbsp;@selectors=;<br>
&nbsp;&nbsp;&nbsp;@displays=;<br>
&nbsp;&nbsp;&nbsp;@presentations=;<br>
<br>
&nbsp;&nbsp;&nbsp;### interface hints ###<br>
&nbsp;&nbsp;&nbsp;@presentationMenus=;<br>
&nbsp;&nbsp;&nbsp;@displayMenus=;<br>
&nbsp;&nbsp;&nbsp;@selectorMenus=;<br>
&nbsp;&nbsp;&nbsp;@filterMenus=;<br>
&nbsp;&nbsp;&nbsp;@attributeMenus=;<br>
{rdelim}
<hr>
array pre numNodes [vytvorit si to <a href="http://marin.x86.sk/toolz/numnodes.php">niekde</a> inde do php]::
<br><br>


{*section name=naj loop=$get_movement}
{$get_movement[naj].node_id},
{$get_movement[naj].node_parent},
{/section*}


<div>
&lt;?php<br><br>
$a = array({foreach from=$get_movement name=grafnum item=movement}
{$movement.node_parent}, {$movement.node_id}, {if $smarty.foreach.grafnum.last} {$movement.node_parent}, {$movement.node_id}{/if}
{/foreach});
<br>
 <p>echo $aMax = max($a);</p>
<br>?&gt;
</div>

{*get_movement user_id=1538 offset=$offset listing_amount=$listing_amount}
{foreach from=$get_movement item=movement}
&nbsp;&nbsp;&nbsp;<a href='/id/{$movement.node_id}'>{$movement.node_name}</a> <br>
{/foreach*}

