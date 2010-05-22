<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<table align='center'><td>
{get_node_userlist}
{foreach from=$userlist item=node_visitor}
<td><a href='/id/{$node_visitor.user_id}/'><img hspace='0' vspace='0' width='50' height='50' border='0' align='left' name='{$node_visitor.login}' alt='{$node_visitor.login}' src='{get_image_link id=$node_visitor.user_id}'></a></td>
{/foreach}
</tr></table>
<br>
