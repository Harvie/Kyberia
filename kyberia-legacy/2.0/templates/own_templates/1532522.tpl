<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<!-- templajt for /id/1532459 forum ; taken from templajt /id/3 ; --!>
<table width='100%'><tr>
<td width=100% valign='top'>
<table width='100%' class='bordered'><tr><td>

{include file="modules/header.tpl"}
{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'><br />
{* show node info *}<br />
{include file="modules/node_settings.tpl"}<br />
<br />
{* showing poll *}<br />
{include file="modules/get_poll_box.tpl"}<br />
<br><br />
{*showing bookmark_statistics*}<br />
{include file="modules/get_bookmark_statistics_box.tpl"}<br />
</td><br />
<!--end of left column--><br />
<br />
<!--main central column--><br />
<td width=666 valign='top'><br />
{*showing node_content*}<br />
{include file="modules/node_content.tpl"}<br />
{*showing form for adding child node*}<br />
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'><br />
{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}<br />
{include file="modules/get_threaded_children.tpl" children_type=4}<br />
</form><br />
<!--end of central column--><br />
<br />
</td></tr></table><br />
<br />
{include file="modules/footer.tpl"}<br />

</td></tr></table>
