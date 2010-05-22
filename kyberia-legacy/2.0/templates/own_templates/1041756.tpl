<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="modules/node_settings.tpl"}

{* showing poll *}
{include file="modules/get_poll_box.tpl"}
<br>
{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=66% valign='top'>
{*showing node_content*}
{get_children listing_amount='23232323232323' offset=$offset}
<table width='100%' align='center'><tr>
{foreach name=picz from=$get_children item=child}
{if $smarty.foreach.picz.iteration is div by 5}</tr><tr>{/if}
<td width='190'>
        <table>
                <tr><td class='important'>{$child.node_name}</td></tr>
                <tr>
                        <td><a href='/id/{$child.node_id}/'><img border='0' name='{$child.node_name}' src='{get_image_link id=$child.node_id}'></a>
                     
                </tr>
        </table>
</td>
{/foreach}
</tr>
</table>

{*showing form for adding child node*}
<form method='post' action='/id/{$node.node_id}'>
{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}
</form>

<center>{include file="modules/movement.tpl"}</center>
<!--end of central column-->

</td></tr></table>

{include file="modules/footer.tpl"}



