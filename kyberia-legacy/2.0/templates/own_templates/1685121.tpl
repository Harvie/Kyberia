<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

<table width=100%>
<tr><td valign='top' width=23%>
{include file="modules/get_mail_userlist.tpl"}
</td>
<td valign='top'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{include file="modules/mailform.tpl"}
{include file="modules/mail.tpl" listing_amount=$listing_amount offset=$offset}
</form>
</td></tr></table>

{include file="modules/footer.tpl"}
 