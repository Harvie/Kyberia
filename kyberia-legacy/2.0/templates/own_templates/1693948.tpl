<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

<table width=100%>
{*left column*}
<tr><td valign='top' align='left' width='166'>

<table cellspacing="0" cellpadding="0" width="166">

{*users*}
{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}
<tr colspan="3">
<center><a href='/id/{$node.node_id}/configure'>configure</a></center>
</tr>
{/if}

{*friends*}
{get_userlist}
{if $active_friends eq true}
<tr colspan="3"><b><center>friends</center></b></tr>
<tr>
{foreach name=friends from=$active_friends item=active_friend}
{if $smarty.foreach.friends.iteration is div by 3}</tr><tr>{/if}
<td width="25" valign="top" align="left">
<a href="javascript:chngto('{$active_friend.login}','{$active_friend.user_id}')" title='{$active_friend.login|strip_tags}'>
<img border='0' alt='{$active_friend.login|strip_tags}' width='25' height='25' alt='{$node_visitor.login|strip_tags}' src='{get_image_link id=$active_friend.user_id}'></a>
</td>
{/foreach}

{/if}
</tr><tr colspan="3"><td>
<br>
<b><center>users on.line</center></b>
{foreach from=$active_users item=active_user}
<center><a href="javascript:chngto('{$active_user.login}','{$active_user.user_id}')" title='{$active_user.login|strip_tags}'>{$active_user.login|strip_tags}</a><br></center>
{/foreach}
</td></tr>
</table>

</td>
{*main column*}
<td width='666' valign='top'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{include file="modules/mailform.tpl"}
{include file="modules/mail.tpl" listing_amount=$listing_amount offset=$offset}
</form>
</td></tr></table>

{include file="modules/footer.tpl"}