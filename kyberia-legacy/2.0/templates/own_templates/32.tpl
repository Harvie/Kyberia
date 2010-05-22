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

<td>
<center><font class=most_important>pozor pozor pozor!<br>
po zaregistrovani usera sa stavate jeho "ochrancom" tj. dojde mu automaticky<br>
od vas posta ze sa na vas moze obracat so svojimi problemami a ziadostami</font></center>
{get_waiting_users}
<form method='post' action='/id/32'>
<table align='center'>
{foreach from=$get_waiting_users item=waiting}
        <tr class='bordered'><td><a href='/id/{$waiting.user_id}'>{$waiting.login}</a></td>
        <td width='500'>{$waiting.node_content}</td>
        <td>{$waiting.email}</td>
        <td><input type='checkbox' name='waiting[{$waiting.user_id}]'>
        </td></tr>
{/foreach}
<tr><td colspan='4' align='center'><input type='submit' value='register_users' name='event'>
<input type='submit' value='remove_users' name='event'></td></tr>
</table>
</td></table>
</form>
{include file="modules/footer.tpl"}


