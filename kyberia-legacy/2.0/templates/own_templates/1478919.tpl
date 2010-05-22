<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->


{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}
<div class="position:absolute;left:10px;top:10px;text-align:left">
{if $error eq true}
{$error}
{/if}
{if $user_id eq false}
{include file="modules/loginbox.tpl"}
{/if}
</div>
<div class="position:absolute;left:10px;top:20px;text-align:right">
{*showing node_content*}                   {* show node info *} 
{include file="modules/node_content.tpl"}  
</div>
<div class="position:absolute;top:20;left: 70%;text-align:right">
{include file="modules/node_settings.tpl"}

                                             {* showing poll *}
                                             {include file="modules/get_poll_box.tpl"}
                                             {*showing bookmark_statistics*}
                                  {include file="modules/get_bookmark_statistics_box.tpl"}
</div>
<div class="text-align:left">
{*showing form for adding child node*}
{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}
{include file="modules/get_threaded_children.tpl"}
</div>
{include file="modules/footer.tpl"}



