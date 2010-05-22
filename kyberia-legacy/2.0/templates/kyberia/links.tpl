<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="modules/node_settings.tpl"}

{* showing poll *}
{get_poll}
{include file="modules/show_poll.tpl" get_poll=$get_poll}
<br>
{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
~</td>
<!--end of left column-->

<!--main central column-->
<td width=666 valign='top'>
{*showing node_content*}
{*include file="modules/node_content.tpl"*}
{get_linked_nodes}
{foreach from=$get_linked_nodes item=child}
<table class='bordered' cellspacing='0' cellpadding='0'>
<tr>
<td align='center' valign='top' rowspan='2'>
        <img vspace='5' hspace='5' width='50' src='{get_image_link id=$child.node_creator}'>
</td>

<td valign='top' style='width: 100%'>
        <table width=100%>
                <tr class='header' width=100% valign='top'><td>
                &nbsp;<a href='/id/{$child.node_creator}'>{$child.creator}</a>
                {if $child.user_action neq false}
                        &nbsp;[lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]
                {/if}
                &nbsp;&nbsp;{$child.node_created|date_format:"%H:%M:%S - %d.%m.%Y"}&nbsp;
                &nbsp;&nbsp;<input type='checkbox' value='{$child.node_id}' name='node_chosen[]'>
                &nbsp;&nbsp;<a href='/id/{$child.node_id}'>enter</a>&nbsp;&nbsp;
                {if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
                {if $child.node_children_count}<span class='most_important'>{$child.node_children_count}&nbsp;&nbsp;CHILDREN</span>{/if}
                </td></tr>
                <tr><td>{$child.node_content|stripslashes|nl2br}</td></tr>
        </table>
</table>

{/foreach}

<!--end of central column-->

</td></tr></table>

{include file="modules/footer.tpl"}