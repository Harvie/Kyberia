<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_creation_by_template_id template_id=$node.template_id listing_amount=$listing_amount offset=$offset}
{foreach from=$get_creation_by_template_id item=child}
	{if $type eq 11}
		{get_poll poll=$child}
			{include file="modules/show_poll.tpl" get_poll=$get_poll}
			<br>

	{else}
		<table width='100%' class='bordered'>
		<tr>
		{if $type eq 8}<td valign='top' width='50' rowspan='2'><img width='50' hspace='5' src='{get_image_link id=$child.node_parent}'>&nbsp;</td>{/if}
		<td valign='top'>
		<table width='100%'><tr class='header' valign='top'>
			<td align='center'>
			&nbsp;<a href='/id/{$child.node_id}'>{$child.node_name}</a>  in  <a href='/id/{$child.node_parent}'>{$child.parent_name}</a>
			{if $child.user_action neq false} &nbsp;[lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]{/if}
			<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</center>
			<tr><td>{$child.node_content|truncate:230|stripslashes}</td></tr>
		</table>
		</table>
		<br>
	{/if}
{/foreach}
