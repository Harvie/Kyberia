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
{get_neurons user_id=$node.node_id}
<table class='bordered'>
{foreach from=$get_dendrites item=synapse}
<tr><td>
<a href='/id/{$synapse.node_id}'>{$synapse.node_name}</a> 
</td></tr>
{/foreach}
</table>
</td>
<td valign='top'>
<table class='bordered'>
{foreach from=$get_axons item=synapse}
<tr><td>
<a href='/id/{$synapse.node_id}'>{$synapse.node_name}</a> 
</td></tr>
{/foreach}
</table>

</td>

<!--end of central column-->

</td></tr></table>
{/if}

{include file="modules/footer.tpl"}