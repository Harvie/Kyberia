<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
<br>
<div style="font-size:6pt">
<div style="background:#6dae42; color:black; padding:0.1em">registered users so inym teplate_id [niektore su zamerne(napr. 1538 hehe) a niektore bug]</div>
<br>

<div style="border-bottom:1px solid; width:100%">
{get_nodes_by_parent parent=0 listing_amount=2323232323 offset=$offset}
$registered_users_with_differnet_template-id = array({section name=list  loop=$get_nodes_by_parent}{math equation="x-1" x=$get_nodes_by_parent[list].node_id assign=refjus}{if $get_nodes_by_parent[list].external_link eq "db://user" && $get_nodes_by_parent[list].template_id neq 7 && $get_nodes_by_parent[list].node_creator neq $refjus}<a href='/id/{$get_nodes_by_parent[list].node_id}/forum'>{$get_nodes_by_parent[list].node_id}</a>, {/if}{/section});

</div>

<br><br><br>

<div style="background:#6dae42; color:black; padding:0.1em">all refused users  [register. formular je node_id -1]</div>
<br>

<div style="border-bottom:1px solid; width:100%">
{get_nodes_by_parent parent=0 listing_amount=2323232323 offset=$offset}
$refused_users = array({section name=list  loop=$get_nodes_by_parent}{math equation="x-1" x=$get_nodes_by_parent[list].node_id assign=refjus}{if $get_nodes_by_parent[list].external_link eq "db://user" && $get_nodes_by_parent[list].node_creator eq $refjus}<a href='/id/{$get_nodes_by_parent[list].node_id}/forum'>{$get_nodes_by_parent[list].node_id}</a>, {/if}{/section});
</div>
</div>



