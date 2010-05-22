<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<center>
<form method='post'>
<input tabindex=1 type='text' value='{$smarty.post.query}' name='query'>
<input type='submit' name='template_event' tabindex=2 value='search'><br><br>
</form>
<br><br>
{if $smarty.post.query}{get_search query=$smarty.post.query listing_amount=$listing_amount offset=$offset}
{foreach from=$get_search_short item=found}
        <a href='/id/{$found.node_id}'>{$found.node_name}</a><br>
{/foreach}<br><br>
        {foreach from=$get_search item=child}

<table class='bordered' cellspacing='0' cellpadding='0'>
<tr>
<td align='center' valign='top' rowspan='2'>
        <img vspace='5' hspace='5' width='50' src='{get_image_link id=$child.node_creator}'>
        {if $child.k eq true}<span class='most_important'>{$child.k} k</span>{/if}
</td>

<td valign='top' style='width: 100%'>
        <table width=100%>
                <tr class='header' width=100% valign='top'><td>
                &nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
                {if $child.user_action neq false}
                        &nbsp;[lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]
                {/if}
                &nbsp;&nbsp;{$child.node_created|date_format:"%H:%M:%S - %d.%m.%Y"}&nbsp;
                &nbsp;&nbsp;<input type='checkbox' value='{$child.node_id}' name='node_chosen[]'>
                &nbsp;&nbsp;<a href='/id/{$child.node_id}'>enter</a>&nbsp;&nbsp;
                {if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
                {if $child.node_children_count}<span class='most_important'>
{$child.node_children_count}&nbsp;&nbsp;CHILDREN</span>{/if}
                </td></tr>
                <tr><td>{$child.node_content|stripslashes}</td></tr>
        </table>
</table>
<br>

        {/foreach}
{/if}
</center>





