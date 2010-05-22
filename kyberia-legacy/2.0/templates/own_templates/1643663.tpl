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

<form action='/id/963221/' method='post'>
<tr><td colspan='2' align='center'>
<input type='submit' name='event' value='book'>
&nbsp;
<input type='submit' name='event' value='unbook'>
&nbsp;
<input type='submit' name='event' value='-1'>
</td></tr>
</form>

<table width='100%'><tr>

<!--left column-->

<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="modules/node_settings.tpl"}

{* showing poll *}
{include file="modules/get_poll_box.tpl"}
<br>

</td>
<!--end of left column-->


<!--main central column-->
<td width=666 valign='top'>
{*showing node_content*}
{include file="modules/node_content.tpl"}
{*showing form for adding child node*}
{include file="modules/get_threaded_children.tpl" children_type=4}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'>
{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}

</form>
<!--end of central column-->


</td></tr></table>

