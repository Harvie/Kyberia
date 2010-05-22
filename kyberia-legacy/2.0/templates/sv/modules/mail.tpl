<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{if $template_event eq 'preview'}
<table>
<tr>
<td valign='top' rowspan='2' ><img hspace='5' src='{get_image_link id=$user_id}'></td>
<td width='100%' valign='top'>
<table width='100%'><tr class='header'>
<td align='center'>PREVIEW

<tr><td>{$post_vars.mail_text|preview}</td></tr>
</table>
</table>
{* end of preview *}
{/if}

{get_mail listing_amount=$listing_amount offset=$offset}
{foreach from=$get_mail item=message}
<table>
<tr>
<td valign='top' rowspan='2'><img hspace='5' width='50' src='{get_image_link id=$message.mail_from}'>
<td class='header' valign='top'>
<a href='javascript:chngto("{$message.mail_from_name}","{$message.mail_from}")'>{$message.mail_from_name}</a>  
{if $message.mail_from neq $user_id and $message.locationfrom_action_id}[location:: <a href='/id/{$message.locationfrom_action_id}'>{$message.locationfrom_action}</a>]{/if}
&nbsp;&nbsp;-->&nbsp;&nbsp;
<a href='javascript:chngto("{$message.mail_to_name}","{$message.mail_to}")'>{$message.mail_to_name}</a>
{if $message.mail_to neq $user_id and $message.locationto_action_id}[location:: <a href='/id/{$message.locationto_action_id}'>{$message.locationto_action}</a>]{/if}
&nbsp;&nbsp;--&nbsp;&nbsp;<input type='checkbox' name='message[{$message.mail_id}]'> 
<br>
{if $message.mail_to==$user_id  AND $message.mail_timestamp > $node.last_visit}<span class='most_important'>NEW</span>
{elseif $message.mail_read eq 'no'}<span class='most_important'>UNDELIVERED</span>{/if}
&nbsp&nbsp;{$message.mail_timestamp|date_format:"%H:%M:%S - %d.%m.%Y"}
</td>
</tr>
<tr>
<td valign='top'>{$message.mail_text}</td>
</tr>
</table>
{/foreach}



