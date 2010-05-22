<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}
{include file=&quot;modules/header.tpl&quot;}

{if $error eq true}
&lt;center&gt;&lt;font style='error'&gt;{$error}&lt;/font&gt;&lt;/center&gt;
{/if}

{if $user_id eq false}
&lt;center&gt;{include file=&quot;modules/loginbox.tpl&quot;}&lt;/center&gt;&lt;br&gt;&lt;br&gt;
{/if}

&lt;table width='100%'&gt;&lt;tr&gt;

&lt;!--left column--&gt;
&lt;td valign='top' align='center' width='23%'&gt;
{* show node info *}
{include file=&quot;modules/node_settings.tpl&quot;}

{* showing poll *}
{include file=&quot;modules/get_poll_box.tpl&quot;}
&lt;br&gt;
{*showing bookmark_statistics*}
{include file=&quot;modules/get_bookmark_statistics_box.tpl&quot;}
&lt;/td&gt;
&lt;!--end of left column--&gt;

&lt;!--main central column--&gt;
&lt;td valign='top'&gt;
{*showing node_content*}
{include file=&quot;modules/node_content.tpl&quot;}
{*showing form for adding child node*}
&lt;form enctype=&quot;multipart/form-data&quot; action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'&gt;
{if $permissions.r eq true}{include file=&quot;modules/addnode.tpl&quot;}{/if}
{include file=&quot;modules/get_threaded_children.tpl&quot;}
&lt;/form&gt;
&lt;!--end of central column--&gt;

&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;

{include file=&quot;modules/footer.tpl&quot;}


