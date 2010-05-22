<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<table>
{* getting and showing links for user node_type subtemplates *}
<tr><td align='center'><a href='/id/{$node.node_id}/move'>movement</a><br>
<tr><td align='center'><a href='/id/{$node.node_id}/bookmarklist'>bookmarks</a><br>
{get_user_children_types}
{foreach from=$get_user_children_types item=children_type}
	<tr><td align='center'><a href='/id/{$node.node_id}/{$children_type}'>{$types[$children_type]}s</a></td></tr>
{/foreach}
</table>
