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
<table width='100' class='header'><tr><td>
{foreach name=friends from=$active_friends item=active_friend}
<div style="height:23px; clear:left; margin-bottom:10px">
<a href='/id/{$active_friend.user_id}/' style="float:left;">
<img width='23' height='23' alt='{$node_visitor.login}'
              src='{get_image_link id=$active_friend.user_id}' border='0'></a>
{$active_friend.login}
[<a
href='/id/{$active_friend.user_action_id}'>{$active_friend.user_action}</a>]
              {$active_friend.idle_time_minutes}m
              {$active_friend.idle_time_seconds}s
</div>
{/foreach}
</td></tr></table>
<br/>
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
<span class='important'>last 10 sumbissions</span><br>
{include file="modules/get_last.tpl" vector=$action listing_amount=10}
<!--end of central column-->

</td></tr></table>
{/if}

{include file="modules/footer.tpl"}












