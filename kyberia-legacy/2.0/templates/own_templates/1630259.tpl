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

<form method='post' enctype="multipart/form-data" action='/id/1626909/'>
<table align='center'>
<tr><td><input type='submit' name='event' value='delete'></td></tr>
</table>
</form>
<!--end of central column-->

</td></tr></table>
{/if}

{include file="modules/footer.tpl"}

