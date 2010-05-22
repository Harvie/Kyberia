<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}<br />
{include file="modules/header.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}


{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="modules/node_settings.tpl"}


{* showing poll *}
{include file="modules/get_poll_box.tpl"}

{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
<table width='666' class='bordered'><tr><td>
<div style="background-color: #664411; padding-bottom: 3px; padding-left: 14px; padding-top: 3px"><span style=" color: #D4CB50; font-size: larger;">- <strong>Posledne pridane datanody</strong> -</span></div><br />
<div style="padding-left: 14px; list-style-type: square;">
(V zozname je poslednych 50 pridanych datanod kamkolvek v kyberii, nielen v kniznici)<br /><br />
{get_nodes_by_type type=12  listing_amount=50 offset=$offset}
{foreach from=$get_nodes_by_type  item=child}
<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:80:"<br>":true}</a><br>
by <a href='/id/{$child.node_creator}'>{$child.login|wordwrap:50:"<br>":true}</a> in <a href='/id/{$child.node_parent}'>{$child.parent_name|wordwrap:80:"<br>":true}</a> on {$child.lastchild_created|wordwrap:80:"<br>":true}<br><br>

{/foreach}

thnx to MARIN

<table width="100%" border="0" summary=""><tr>
<td width="15%" valign="top">=> <a href='http://hysteria.sk/kbase/' target='_blank'><span style=" color: #D4CB50">.kbase</span></a></td><td width="15%" valign="top"><li><a href='/id/683817' >Kniznica</a></td><td width="13%" valign="top"><li><a href='/id/683643' >Sklad</a></td><td width="12%" valign="top"><li><a href='/id/1446809' >Share</a></td><td width="14%" valign="top"><li><a href='/id/1392818' >Katalog</a></td><td width="16%" valign="top"><li><a href='/id/978453' >Pripomienky</a></td><td width="15%"><li><a href='/id/63532'>L:teratura</a></td></tr></table></div>
</td></tr></table>
<!--end of central column-->
</td></tr></table>

{include file="modules/footer.tpl"}