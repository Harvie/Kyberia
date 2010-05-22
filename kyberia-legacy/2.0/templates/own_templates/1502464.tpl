<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<link rel='stylesheet' type='text/css' href='http://freezy.rulez.sk/kyb.css'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $user_id eq true}{if $header_id neq true}{include file="modules/toolbar.tpl"}{/if}{/if}

{if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
{if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}

{if $action}{get_userlist vector=$action} in vector {$action}
{else}{get_userlist}

{/if}

<!-- image -->
<table align='center' valign='top' style='margin-bottom: 0;' width='780'>
<tr><td><center><img src="http://kyberia.sk/upload/top.gif"></center></td></tr>
</table>

<table align='center' valign='top' style='border: solid 1px #6dae42; border-top: 0; margin-top: 0;' width='780'>
<!--left column-->

<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="modules/node_settings.tpl"}

<center><br><a href='/id/31'>register</a>
<br><br>
<form action='/id/25/' method='post'>
<input type='text' value='{$smarty.post.query}' name='query'>
<input type='submit' name='template_event'  value='search'><br>
</form><br><br>
</td>
<!--end of left column-->

<!-- center column -->
<td valign='top' width='468'>

<center>
{include file="modules/loginbox.tpl"}
</center>

<table>
<tr><td colspan='3' class='important'>friends</td></tr>
<tr>
{foreach name=friends from=$active_friends item=active_friend}
{if $smarty.foreach.friends.iteration is div by 3}</tr><tr>{/if}
<td width='190'>
        <table>
                <tr><td colspan='1' class='important'><a href='/id/{$active_friend.user_id}/'>{$active_friend.login|strip_tags}</a></td></tr>

                <tr>
                        <td><a href='/id/{$active_friend.user_id}/'>
<img border='0' name='{$active_friend.login}' width='50' height='50' alt='{$node_visitor.login}' src='{get_image_link id=$active_friend.user_id}'></a></td>
                        <td valign='top'>[<a href='/id/{$active_friend.user_action_id}'>{$active_friend.user_action|strip_tags}</a>]<br>{$active_friend.idle_time_minutes}min {$active_friend.idle_time_seconds}sec</td>
                </tr>
        </table>

</td>
{/foreach}
</tr>

<tr><td colspan='3' class='important'>users<br><br></td></tr>
<tr>
{foreach name=users from=$active_users item=active_user}
{if $smarty.foreach.users.iteration is div by 3 }</tr><tr>{/if}
<td width='190'>
        <table>
                <tr><td colspan='1' align='center' class='important'><a href='/id/{$active_user.user_id}/'>{$active_user.login|strip_tags}</a></td></tr>

                <tr>
<td valign='top'>[<a href='/id/{$active_user.user_action_id}'>{$active_user.user_action|strip_tags}</a>]
<br>{$active_user.idle_time_minutes}min {$active_user.idle_time_seconds}sec</td>
                </tr>
        </table>

</td>
{/foreach}

</td></tr>
</table>
</table>

</td>
<!-- end of center column -->

</tr>
</table>
<br><center><img src='http://stats.h-k.sk/kybusers.png' border='0'></center>
{include file="modules/footer.tpl"}