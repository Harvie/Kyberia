<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="modules/node_settings.tpl"}

{* showing poll *}
{include file="modules/get_poll_box.tpl"}
<br>
{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td>
<td width=666 valign='top'>
{*showing node_content*}
{include file="modules/node_content.tpl"}
<div align=left><form method="GET" action="http://packages.debian.org/cgi-bin/search_packages.pl" target=_debian_forum_node><input type="hidden" name="searchon" value="names" id="onlynames"><input type="hidden" name="subword" value="1">
keywords: <input type="text" size="20" name="keywords" id="kw"> <select name="version">
  <option value="unstable">unstable</option>
  <option value="testing">testing</option>
  <option value="stable" selected="selected">stable</option>
  <option value="oldstable">oldstable</option>
  <option value="all">any</option>
</select> <select name="release">
  <option value="main">main</option>
  <option value="contrib">contrib</option>
  <option value="non-free">non-free</option>
  <option value="non-us">non-US</option>
  <option value="all" selected="selected">any</option>
</select> <input type="submit" value="Search package"></form></div>
<br><br>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'>
{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}
{include file="modules/get_threaded_children.tpl" children_type=4}
</form>
<!--end of central column-->

</td></tr></table>

<center><font size=4>forum about<br><a href="http://www.debian.org/" target=_new><img src="http://hysteria.sk/pyxel/kyberia/forums/debian/debianlogo.gif" border=0></a></center>