<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

{if $user_id eq false}

{include file="modules/loginbox.tpl"}



{/if}




 
{* show node info *}
{include file="modules/node_settings.tpl"}

{* showing poll *}
{include file="modules/get_poll_box.tpl"}


{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
 



 
{*showing node_content*}
{include file="modules/node_content.tpl"}
{*showing form for adding child node*}


{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}
{include file="modules/get_threaded_children.tpl" children_type=4}



 
<b>dsdasadadas</b>

{include file="modules/footer.tpl"}
