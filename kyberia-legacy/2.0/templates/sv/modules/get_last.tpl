<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_last vector=$vector listing_amount=$listing_amount offset=$offset}
{foreach from=$get_last item=child}
<table>
<tr>
<td width='100' valign='top' rowspan='2'><a href='/id/{$child.node_creator}'><img border=0 hspace='5' src='{get_image_link id=$child.node_creator}'></a>&nbsp;</td>
<td style='width: 100%'>
<table width=100%><tr class='header' width=100% valign='top'>
<td>
parent: <a href='/id/{$child.node_parent}'>{$child.parent_name}</a><br>
author: <a href='/{$child.login}'>{$child.login}</a>
{if $child.user_action neq false}
&nbsp;[lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]
{/if}
&nbsp;&nbsp;{$child.node_created|date_format:"%H:%M:%S - %d.%m.%Y"}&nbsp;
<tr><td>{$child.node_content|stripslashes}</td></tr>
</table>
</table>
{/foreach}
