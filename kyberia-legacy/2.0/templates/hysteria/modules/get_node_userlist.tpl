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
<td><a href='/id/{$node_visitor.user_id}/'>{$node_visitor.login}</a></td>
{/foreach}
</tr></table>
<br>
