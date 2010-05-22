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
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="modules/node_settings.tpl"}
<font color=red>Pünk is not dëd!</font><br>

{* showing poll *}
{include file="modules/get_poll_box.tpl"}
<br>
{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}

</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>
{*showing node_content*}

<div style="margin-left: 10px; margin-right: 10px; list-style-type: square;">
{get_bookmarks}
{foreach from=$get_bookmarks item=bookmark_category}
{* showing bookmark category *}
{if $bookmark_category.node_name neq false}
&nbsp;&nbsp;{$bookmark_category.node_name}<br>
{else}&nbsp;&nbsp;[Nezaradene]<br>
{/if}
{foreach from=$bookmark_category.children item=bookmarks}

{if $bookmarks.node_name}
<code>&#60;a href='/id/{$bookmarks.node_id}/'&#62;{$bookmarks.node_name}&#60;/a&#62;</code>
<br>
{/if}
{/foreach}
<br>

{/foreach}
</div>
</td></tr></table>

{include file="modules/footer.tpl"}
<center>ani prevadzkovatel tohto fora za nic neruci, <font color=red>pünk je pünk</font></center>