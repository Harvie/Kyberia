<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->


{include file="modules/header.tpl"}
{**
<table width=100%>
<tr><td valign='top' width="106">
{if $action}{get_userlist vector=$action} in vector {$action}
{else}{get_userlist}
{/if}
<div class='active_user_img' style="padding: 0; margin: 0; border: 0;">
{foreach name=friends from=$active_friends item=active_friend}
                        <a href="javascript:chngto('{$active_friend.login}','{$active_friend.user_id}')">
                        <img border='0' name='{$active_friend.login}' width='50'
height='50' title='[{$active_friend.login}] [location: {$active_friend.user_action}] [idle: {$active_friend.idle_time_minutes}:{$active_friend.idle_time_seconds}]' alt='{$node_visitor.login}' src='{get_image_link id=$active_friend.user_id}'></a>
{/foreach}
</div>
</td>
<td valign='top'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{include file="modules/mailform.tpl"}<br>
{include file="modules/mail.tpl" listing_amount=$listing_amount offset=$offset}
</form>
</td></tr></table>
------------ **}

<table width=100%>
<tr><td valign='top' width=23%>
{include file="modules/get_mail_userlist.tpl"}
</td>
<td valign='top'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{include file="modules/mailform.tpl"}
{include file="modules/mail.tpl" listing_amount=$listing_amount offset=$offset}
</form>
</td></tr></table>

{include file="modules/footer.tpl"}











