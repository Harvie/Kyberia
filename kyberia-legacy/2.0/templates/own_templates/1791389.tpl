<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file=&quot;modules/header.tpl&quot;}

{if $user_id eq false}

{include file=&quot;modules/loginbox.tpl&quot;}



{/if}










{* show node info *}
{include file=&quot;modules/node_settings.tpl&quot;}

{* showing poll *}
{include file=&quot;modules/get_poll_box.tpl&quot;}


{*showing bookmark_statistics*}
{include file=&quot;modules/get_bookmark_statistics_box.tpl&quot;}
	
{*showing node_content*}
{include file=&quot;modules/node_content.tpl&quot;}
{*showing form for adding child node*}


{if $permissions.w eq true}{include file=&quot;modules/addnode.tpl&quot;}{/if}
{include file=&quot;modules/get_threaded_children.tpl&quot; children_type=4}






{include file=&quot;modules/footer.tpl&quot;}
