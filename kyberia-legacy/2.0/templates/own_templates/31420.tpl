<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<table width='666' class='bordered'><tr><td>
{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}


{if $user_id eq false}
<center>{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{include file="1549925.tpl"}

<a href='/id/{$node.node_id}/1757900'>nodeshells</a>

<a href='/id/{$node.node_id}/1761254'>forums</a>
<a href='/id/{$node.node_id}/1573668'>submissions</a>
<a href='/id/{$node.node_id}/1773535'>articles</a>
<a href='/id/{$node.node_id}/1757556'>blogs</a>
<a href='/id/{$node.node_id}/1757626'>datas</a>

{* showing poll *}
{*include file="1549834.tpl"*}
<br>
{*showing bookmark_statistics*}

{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>

{include file="1549916.tpl"}
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
&nbsp;[<a href='/id/{$child.user_action_id}/'>{$child.user_action}</a>]
{/if}
{/if}
<br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</center>
<tr><td>{$child.node_content|nl2br}</td></tr>
</table>
</table>
{/foreach}


<form method='post' action='/id/{$node.node_id}'>
<BR>
<textarea name='node_content'>{$post_vars.node_content}</textarea>
<br>
{if $permissions.w eq true}
<!-- 
pridane input z template_id 8ckou.
vid /id/1860668
[pyxel]
-->
<input type='hidden' name='template_id' value='8'>
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<input type='hidden' name='external_link' value='session://friend'>
<table><tr><td><input type='submit' name='event' value='add'>
<td> with name:</td> <td><input type='text' name='node_name'></td>

</table>
{/if}

</form>