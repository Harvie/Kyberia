<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

<div style="float:left; width:23%;"><br style="clear:left;"><center>{include file="modules/node_settings.tpl"}<br>{include file="modules/get_bookmark_statistics_box.tpl"}</center></div>

<div style="margin-top: 100px; text-align:center; margin-left:23%; width:77%;">
fylter_by in <a href="/id/63802">ziadosti o registraciu</a><br><br>
{if $permissions.w eq true}
<form enctype="multipart/form-data" action='/id/63802/' method='post' name='formular'>
<input type='text' name='node_content' style="width:123px; height:20px; border:1px solid #6DAE42;"><br><br>
<input type='submit' name='template_event' value='filter_by'><br><br><select name='search_type'><option value='content'>content</option><option value='user'>user</option>

</select><input type='hidden' name='node_parent' value='{$node.node_id}'></form>
{/if}</div>
{include file="modules/footer.tpl"}




