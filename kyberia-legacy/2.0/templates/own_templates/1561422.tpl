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
<!--main column-->
<table width='100%'><tr>
<td width=666 valign='top' align='center'>
{*showing node_content*}
{include file="modules/node_content.tpl"}
</td>
</tr></table>
<!--end of main column-->

<!--bottom column-->
<table width='666' align='center'><tr>

<td width='222'>
<table align='center'>
<tr><td colspan='2' align='center'>
<img src='/images/nodes/1/5/1561354.gif'>
</td></tr>
<tr><td>node:</td><td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<tr><td>template:</td><td><a href='/id/1561422'>1561422</a></td></tr>
<tr><td>parent:</td><td><a href='/id/{$node.node_parent}'>{$node.node_parent_name}</a></td>
<tr><td>owner:</td><td><a href='/id/{$node.node_creator}'>{$node.node_creator}</a></td>
<tr><td>datetime:</td><td>15.04.2005. - 15:12:41</td></tr>
</table>
</td>

<td width='222'>
<table class='bordered' align='center'>
<tr><td colspan='2' align='center' class='important'>permissions</td></tr>
<tr><td>you:</td><td align='center'>
{if $permissions.r eq true}r,{/if}{if $permissions.w eq true}w,{/if}{$node.node_permission}
</td>
<tr><td>system:</td><td align='center'>{$node.node_system_access}</td>
<tr><td>net:</td><td align='center'>{$node.node_external_access}</td>
</table>
</td>

<td width='222'>
<center><a href='/id/{$node.node_id}/neurons'>neurons</a><br>
<a href='/id/{$node.node_id}/stats'>statistics</a><br>
<a href='/id/{$node.node_id}/offtopic'>offtopic</a><br>
<a href='/id/{$node.node_id}/links'>links</a><br>
<a href='/id/{$node.node_id}/print'>print</a><br>
<a href='/id/15/'>k</a><br>
<span class='important'> total children::{$node.node_children_count} </span><br>
{$k.k}</center>
<table align='center'>
<form action='/id/{$node.node_id}/' method='post'>
<tr><td colspan='2' align='center'>
<input type='submit' name='event' value='book'>
<input type='submit' name='event' value='unbook'>
&nbsp;
<input type='submit' name='event' value='K'>
</td></tr>
</form>
</table>
<center>{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<a href='/id/{$node.node_id}/configure'>configure</a><br>{/if}
<a href='/id/{$node.node_id}/forum'>!!!show flat!!!</a><br></center>
</td>

</tr></table>
<!--end of bottom column-->

{include file="modules/footer.tpl"}