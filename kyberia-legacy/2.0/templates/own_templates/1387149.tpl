<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->


{get_movement_params}
{include file="modules/header.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>

{else}

<table width='100%'><tr valign='top'><td>
{get_userlist}
<!--left column-->
<span class='important'>friendz</span>
<table width='100' class='header'>
{foreach name=friends from=$active_friends item=active_friend}
        <tr><td valign='top'>
                        <a href='/id/{$active_friend.user_id}/'><img border='0' name='{$active_friend.login}' alt='{$active_friend.login}' title='{$active_friend.login}' width='23'
height='23' alt='{$node_visitor.login}' src='{get_image_link id=$active_friend.user_id}'></a>
                       {$active_friend.login}
        </td></tr>
        <tr><td>
                        [<a href='/id/{$active_friend.user_action_id}'>{$active_friend.user_action}</a>]<br>{$active_friend.idle_time_minutes}m {$active_friend.idle_time_seconds}s<br/>
        </td></tr>                
{/foreach}
</table>
<br/>

<span class='important'>random forumz</span><br><br>
{include file="modules/get_nodes_by_type_small.tpl" type=3 listing_amount=10}
<br><br>
<span class='important'>data</span><br><br>
{include file="modules/get_nodes_by_type_small.tpl" type=12 listing_amount=10}
<br>
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
<!--
<form method='post'>
<table align='center'><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table>
</form>
-->
<span class='important'>last sumbissions</span><br>
{include file="modules/get_last.tpl" vector=$action listing_amount=1000}
<!--end of central column-->

</td></tr></table>
{/if}

{include file="modules/footer.tpl"}






