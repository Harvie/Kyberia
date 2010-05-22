<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
{debug}
{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>

{else}


<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
<table>
<tr><td colspan='2' align='center'>
<img src='http://x86.sk/~marin/imgz/np.gif'>
</td></tr>
<tr><td>node:</td><td><a href='/id/{$node.node_id}'>{$node.node_name}</a></td></tr>
<tr><td>owner:</td><td><a href='/id/1538'>MARIN</a></td>
<tr><td>datetime:</td><td>niekedy zaciatkom leta</td></tr>
</table>
<br>
<center><a href='/id/{$node.node_id}/1961036'>neurons</a></center>
<br>
<center><a href='/id/{$node.node_id}/1961037'>statistics</a></center>
<center><a href='/id/{$node.node_id}/offtopic'>offtopic</a></center>
<center><a href='/id/{$node.node_id}/links'>links</a></center>
<center><a href='/id/15/000000000000{$node.node_id}'>k</a></center><br>
<span class='important'> total children::{$node.node_children_count} </span><br>
<span class='most_important'>666 K</span>
<center><a href='/id/{$node.node_id}/forum'>!!!show flat!!!</a></center>
<br>
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
<table width='666' border=0><tr><td>
{$node.node_content|nl2br}
</td></tr></table><br><br>
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
{if $permissions.w eq true}<br />
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
{$node.external_link}







