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
{* showing poll *}
{*include file="modules/get_poll_box.tpl"*}
<br>
{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>

{if $action eq true}
<center>{include file="modules/movement.tpl"}</center>
{include file="modules/get_creation_by_type.tpl" listing_amount=$listing_amount type=$action}
<center>{include file="modules/movement.tpl"}</center>

{else}
{include file="modules/node_content.tpl"}
<center>{include file="modules/movement.tpl"}</center>
{* shows what other friends think about users *}
{include file="modules/get_children_by_type.tpl" listing_amount=$listing_amount type=8}

{/if}
<!--end of central column-->

</td></tr></table>
{/if}

{include file="modules/footer.tpl"}