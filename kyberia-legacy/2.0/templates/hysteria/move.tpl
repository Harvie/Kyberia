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
{include file="modules/node_settings.tpl"}
{include file="modules/userinfo.tpl"}

</td>
<!--end of left column-->

<td valign='top'>
{include file="modules/movement.tpl"}
{get_movement user_id=$node.node_id offset=$offset listing_amount=$listing_amount}
{foreach from=$get_movement item=movement}
	<a href='/id/{$movement.node_id}'>{$movement.node_name}</a>
&nbsp;({$movement.last_visit|date_format:"%d.%m.%Y. - %H:%M:%S"})<br>
{/foreach}
</td>

<!--end of central column-->

</td></tr></table>
{/if}

{include file="modules/footer.tpl"}