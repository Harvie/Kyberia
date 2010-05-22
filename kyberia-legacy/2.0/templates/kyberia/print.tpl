<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->


<head>
<!--<link rel='stylesheet' type='text/css' href='/data/css/kyberia.css'>-->
<title>{$node.node_name}</title></head>
<body>
<table width='666'><tr>
<td valign='top' align='left'>
{include file="modules/node_content.tpl"}
<br><br>
{include file="modules/get_threaded_children.tpl" children_type=4 listing_amount=2}
<br><br>
{include file="modules/get_bookmark_statistics_box.tpl"}

</td></tr></table>

{include file="modules/footer.tpl"}