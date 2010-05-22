<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>

{else}
<table width='100%'><tr><br />
<!--left column--><br />
<td valign='top' align='center' width='23%'>
{include file="modules/node_settings.tpl"}
{include file="modules/userinfo.tpl"}
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

<form method='post' enctype="multipart/form-data" action='/id/{$user_id}/'>
<table align='center'>
<tr><td><input type='text' name='node_name' value=''>
<td><input type='submit' name='event' value='configure_node_name'>
<tr><td><select name='node_system_access'>
<option value='public' selected>public</option>
<option value='moderated' >moderated</option>
<option value='private' >private</option>
<option value='cube' >cube</option>
<option value='crypto' >crypto</option>
</select></td>
<td><input type='submit' name='event' value='configure_system_access'>
<tr><td><input name='node_external_access' type='checkbox' value='' >
<td><input type='submit' name='event' value='configure_external_access'>
<tr><td><input type='text' name='template_id' value=''>
<td><input type='submit' name='event' value='configure_template_id'>
</table>
</form>



<form action='/id/{$user_id}/' method='post'>
<table>
<tr><td>
<input type='text' name='new_parent' value=''>
</td><td>
<input type='submit' name='event' value='set_parent'>
</td></tr>
</table>
</form>

</form>
{/if}

<!--end of central column-->

</td></tr></table>
{/if}

{include file="modules/footer.tpl"}