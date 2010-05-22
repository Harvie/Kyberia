<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->


{get_movement user_id=1538 offset=$offset listing_amount=$listing_amount} 


Graph<br>
{ldelim}<br>
&nbsp;&nbsp;&nbsp;### metadata ###<br>
&nbsp;&nbsp;&nbsp;@name="movment graph";<br>
&nbsp;&nbsp;&nbsp;@description=;<br>
&nbsp;&nbsp;&nbsp;@numNodes=;<br>
&nbsp;&nbsp;&nbsp;@numLinks={math equation="x+1" x=$listing_amount};<br>
&nbsp;&nbsp;&nbsp;@numPaths=0;<br>
&nbsp;&nbsp;&nbsp;@numPathLinks=0;<br>
<br>

&nbsp;&nbsp;&nbsp;### structural data ###<br>
&nbsp;&nbsp;&nbsp;@links=[<br>

{foreach from=$get_movement name=grafnode item=movement}
{if $smarty.foreach.grafnode.first}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @source={counter start=0}; @destination={counter}; {rdelim} ,<br>
{/if}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @source={counter}; @destination={counter}; {rdelim} ,<br>
{if $smarty.foreach.grafnode.last}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @source={counter}; @destination={counter assign=abc}{$abc}; {rdelim}<br>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@default=|| false ||;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@nodeValues=;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@linkValues=[<br>
{foreach from=$get_movement name=treelink item=movement}
{if $smarty.foreach.treelink.first}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @id={math equation="x-1" x=$smarty.foreach.treelink.iteration}; @value=T; {rdelim}<br>{/if}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @id={$smarty.foreach.treelink.iteration}; @value=T; {rdelim},<br>
{if $smarty.foreach.treelink.last}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @id={math equation="x+1" x=$smarty.foreach.treelink.total}; @value=T; {rdelim}<br>{/if}
{/foreach}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@pathValues=;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{rdelim},<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@name=$node_id;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@type=int;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@default=;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@nodeValues=[ <br> 
{math equation="x*2" x=$listing_amount assign=list}
{get_movement user_id=1538 offset=$offset listing_amount=$list} 
 {foreach from=$get_movement name=graf item=movement}
{if $smarty.foreach.graf.first}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @id={math equation="x-1" x=$smarty.foreach.graf.iteration}; @value={$movement.node_id}; {rdelim}<br>{/if}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @id={$smarty.foreach.graf.iteration}; @value={$movement.node_id}; {rdelim},<br>
{if $smarty.foreach.graf.last}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ldelim} @id={math equation="x+1" x=$smarty.foreach.graf.total}; @value={$movement.node_id}; {rdelim}<br>{/if}
{/foreach}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];<br>
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
 @numNodes={math equation="x+1" x=$abc}

