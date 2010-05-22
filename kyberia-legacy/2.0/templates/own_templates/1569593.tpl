<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}
{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>
{else}
<table width='100%'><tr>
<!--left column-->
<td valign='top' align='center' width='23%'>
<!--node_settings-->
<table>
<tr><td colspan='2' align='center'>
<img src='{get_image_link id=$node.node_id}'>
</td></tr>
<tr><td>node:</td><td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<tr><td>datetime:</td><td> after beltaine of 85'</td></tr>
</table>
<br>
<table class='bordered'>
<tr><td colspan='2' align='center' class='important'>permissions</td></tr>
<tr><td>you:</td><td align='center'>
{if $permissions.r}r,{/if}
{if $permissions.w}w,{/if}
{$node.node_permission}
</a></td>
<tr><td>system:</td><td align='center'>{$node.node_system_access}</a></td>
<tr><td>net:</td><td align='center'>{$node.node_external_access}</a></td>
</table>
<br>
<center><a href='/id/{$node.node_id}/neurons'>neurons</a></center>
<br>
<center><a href='/id/{$node.node_id}/stats'>statistics</a></center>
<center><a href='/id/{$node.node_id}/offtopic'>offtopic</a></center>
<center><a href='/id/{$node.node_id}/links'>links</a></center>
<center><a href='/id/{$node.node_id}/print'>print</a></center>
<center><a href='/id/15/{$node.node_vector}'>k</a></center>
<table>
<tr>
<td colspan='2' align='center'>
<br><span class='important'>node viewed {$node.node_views} times</span>
<br><span class='important'>total descendants::{$node.node_descendant_count}</span>
<br><span class='important'>total children::{$node.node_children_count}</span>
{if $node.node_user_subchild_count neq false}
<br><span class='most_important'>{$node.node_user_subchild_count} NEW</span>
{/if}
{if $node.k neq false}
<br><span class='most_important'>{$node.k} K</span><br><br>
{/if}

{if $offset neq false}
<br><span class='important'>using offset:: {$offset} </span>
{/if}
</td>
<form action='/id/{$node.node_id}/' method='post'>
<tr><td colspan='2' align='center'>
{if $node.node_bookmark neq 'yes'}
<input type='submit' name='event' value='book'>
{else}
<input type='submit' name='event' value='unbook'>
{/if}
&nbsp;
<input type='submit' name='event' value='K'>
</td></tr>
</form>
</table>
{if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<center><a href='/id/{$node.node_id}/configure'>configure</a></center>{/if}
<br>
<center><a href='/id/{$node.node_id}/forum'>!!!show flat!!!</a></center>
<br>
<!-- end of node_settings --> 
<a href='/id/{$node.node_id}/1757900'>nodeshells</a><br>
<a href='/id/{$node.node_id}/1761254'>forums</a><br>
<a href='/id/{$node.node_id}/1573668'>submissions</a><br>
<a href='/id/{$node.node_id}/1773535'>articles</a><br>
<a href='/id/{$node.node_id}/1757556'>blogs</a><br>
<a href='/id/{$node.node_id}/1757626'>datas</a><br>

{* showing poll *}
{*include file="modules/get_poll_box.tpl"*}
<br>
{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td>
<!--end of left column-->
<!--main central column-->
<td valign='top'>
<form method='post' action='/id/{$node.node_id}'>
<center>{include file="modules/movement.tpl"}</center>
</form>
{if $action eq true}
<center>{include file="modules/movement.tpl"}</center>
{include file="modules/get_creation_by_template_id.tpl" listing_amount=$listing_amount type=$action}
{else}
{include file="modules/node_content.tpl"}
{* shows what other friends think about users *}
{get_children_by_external_link external_link='session://friend' listing_amount=$listing_amount offset=$offset orderby=desc}
{foreach from=$get_children_by_external_link item=child}
<table>
<tr>
<td valign='top' rowspan='2'><img width='50' hspace='5' src='{get_image_link id=$child.node_creator}'>&nbsp;</td>
<td valign='top' width='100%'>
<table width='100%'><tr class='header' valign='top'>
<td>
{if $child.template_id eq 6 }
<center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{elseif $child.template_id eq 5 }
<center><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b>
{else}
&nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
{if $child.user_action neq false}
&nbsp;[lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]
{/if}
{/if}
<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</center>
<tr><td>{$child.node_content}</td></tr>
</table>
</table>
{/foreach}
<form method='post' action='/id/{$node.node_id}'>
<BR>
<textarea name='node_content'>{$post_vars.node_content}</textarea>
<br>
{if $permissions.w eq true}
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<input type='hidden' name='external_link' value='session://friend'>
<table><tr><td><input type='submit' name='event' value='add'>
<td> with name:</td> <td><input type='text' name='node_name'></td>
</table>
{/if}
</form>
{/if}
<!--end of central column-->
</td></tr></table>
{/if}
{include file="modules/footer.tpl"}








