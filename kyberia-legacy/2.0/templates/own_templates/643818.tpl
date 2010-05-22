<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<body>
<table>
<tr><td>$node.node_id :: id nody</td><td>{$node.node_id}</td></tr>
<tr><td>$node.node_parent :: id rodica nody</td><td>{$node.node_parent}</td></tr>
<tr><td>$node.node_thread_vector :: vektor nody</td><td>{$node.node_thread_vector}</td></tr>
<tr><td>$node.node_name :: nazov nody</td><td>{$node.node_name}</td></tr>
<tr><td>$node.node_content :: obsah nody</td><td>{$node.node_content}</td></tr>
<tr><td>$node.node_system_access :: systemove prava (public,moderated,private)</td><td>{$node.node_system_access}</td></tr>
<tr><td>$node.node_external_access :: prava pre nezaregistrovanych userov ('yes','no')</td><td>{$node.node_external_access}</td></tr>
<tr><td>$node.node_type :: typ nody</td><td>{$node.node_type}</td></tr>
<tr><td>$node.node_views :: pocet kolkokrat bola premenna zobrazena</td><td>{$node.node_views}</td></tr>
<tr><td>$node.node_children_count :: pocet deti</td><td>{$node.node_children_count}</td></tr>
<tr><td>$node.node_descendant_count :: celkovy pocet potomkov</td><td>{$node.node_descendant_count}</td></tr>
<tr><td>$node.lastchild_created :: datum vytvorenia posledneho dietata</td><td>{$node.lastchild_created}</td></tr>
<tr><td>$node.lastdescendant_created :: datum vytvorenia posledneho potomka</td><td>{$node.lastdescendant_created}</td></tr>
<tr><td></td><td></td></tr>
<tr><td>dalej su v tejto premennej ulozene informacie o vztahu user - noda</td><td></td></tr>
<tr><td>$node.node_bookmark :: ma user danu nodu bookmarknutu? ('yes','no')</td><td>{$node.node_bookmark}</td></tr>
<tr><td>$node.last_visit :: posledna userova navsteva nody</td><td>{$node.last_visit}</td></tr>
<tr><td>$node.node_permission :: specialne permission ? ('master','op','access','silence','ban')</td><td>{$node.node_permission}</td></tr>
</table>


</body>
</html>