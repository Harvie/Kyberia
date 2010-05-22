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
{get_stats user_id=$node.node_id offset=$offset listing_amount=$listing_amount}
<table class='bordered'>
{foreach from=$get_stats item=stat}
<tr><td>
<img width='50%' height='50%' src='{get_image_link id=$stat.user_id}' border=0></td><td>
<a href='/id/{$stat.user_id}'>{$stat.login}</a> 
&nbsp;({$stat.last_visit|date_format:"%d.%m.%Y. - %H:%M:%S"})
&nbsp;({$stat.node_user_subchild_count}) NEW
{if $stat.node_bookmark eq 'yes'},booked{/if}
{if $stat.given_k eq 'yes'},K{/if}
</td></tr>
{/foreach}
</table>
</td>

<!--end of central column-->

</td></tr></table>
{/if}

{include file="modules/footer.tpl"}