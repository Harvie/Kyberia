<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}
{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="1549885.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="1549925.tpl"}

{* showing poll *}
{include file="1549834.tpl"}
<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=66% valign='top'>
{*showing node_content*}
{include file="1549916.tpl"}
{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/
{if $action neq false}{$action}{/if}' method='post' name='formular'>

{if $permissions.w eq true}{include file="1548927.tpl"}{/if}
{include file="1549839.tpl"}
</form>
<!--end of central column-->

</td></tr></table>

{include file="1549377.tpl"}







