<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_nodes_by_parent parent=0 listing_amount=2323232323 offset=$offset}
$registered_users_with_standard_template-id = array({section name=list loop=$get_nodes_by_parent}{math equation="x-1" x=$get_nodes_by_parent[list].node_id assign=refjus}{if $get_nodes_by_parent[list].external_link eq "db://user" && $get_nodes_by_parent[list].template_id eq 7 && $get_nodes_by_parent[list].node_creator neq $refjus}{$get_nodes_by_parent[list].node_id}, {/if}{/section});
<br>
{get_nodes_by_parent parent=0 listing_amount=2323232323 offset=$offset}
$registered_users_with_other_template-id = array({section name=list loop=$get_nodes_by_parent}{math equation="x-1" x=$get_nodes_by_parent[list].node_id assign=refjus}{if $get_nodes_by_parent[list].external_link eq "db://user" && $get_nodes_by_parent[list].template_id neq 7 && $get_nodes_by_parent[list].node_creator neq $refjus}{$get_nodes_by_parent[list].node_id}, {/if}{/section});
<br>
{get_nodes_by_parent parent=101 listing_amount=2323232323 offset=$offset}
$registered_users_with_standard_template-id_vector-101 = array({section name=list loop=$get_nodes_by_parent}{math equation="x-1" x=$get_nodes_by_parent[list].node_id assign=refjus}{if $get_nodes_by_parent[list].external_link eq "db://user" && $get_nodes_by_parent[list].template_id eq 7 && $get_nodes_by_parent[list].node_creator neq $refjus}{$get_nodes_by_parent[list].node_id}, {/if}{/section});
<br>
{get_nodes_by_parent parent=101 listing_amount=2323232323 offset=$offset}
$registered_users_with_other_template-id_vector-101 = array({section name=list loop=$get_nodes_by_parent}{math equation="x-1" x=$get_nodes_by_parent[list].node_id assign=refjus}{if $get_nodes_by_parent[list].external_link eq "db://user" && $get_nodes_by_parent[list].template_id neq 7 && $get_nodes_by_parent[list].node_creator neq $refjus}{$get_nodes_by_parent[list].node_id}, {/if}{/section});
<br>


