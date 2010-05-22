<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params}
{include file="modules/header.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>
{/if}

<table width='100%'>
<!--main central column-->
<td valign='top'>
{get_nodes_by_type type=5 listing_amount=2323243254 offset=$offset vector=';1;102'}
{foreach from=$get_nodes_by_type item=child}
<tr><td align='center'><a href='/id/{$child.node_id}'>{$child.node_name}</a></td></tr>
{/foreach}

<!--end of central column-->

</td></tr></table>


{include file="modules/footer.tpl"}