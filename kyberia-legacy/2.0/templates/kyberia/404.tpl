<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
<title>{$error}</title>
</head>
<body>
{foreach from=$nodes item=node}
<a href='/id/{$node.node_id}'>{$node.node_name}</a><br>
{/foreach}
</body>
</html>
