<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<table align=center>

<tr>
<td colspan=2>
{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}

{if $error eq true}
     {$error}
{/if}

{if $user_id eq 2133}
LLUUBBOOSSKKOO
{/if}
</td>
</tr>


<tr>
<td align=center valign=top>
{* show node info *}
{include file="modules/node_settings.tpl"}

{* showing poll *}
{include file="modules/get_poll_box.tpl"}

{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td>
 
<td valign=top>
{*showing node_content*}
{include file="modules/node_content.tpl"}
{*showing form for adding child node*}



{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}

{include file="modules/get_threaded_children.tpl"}

</td>
</tr>

<tr>
<td colspan=2>
{include file="modules/footer.tpl"} 
</td>
</tr>

</table>









