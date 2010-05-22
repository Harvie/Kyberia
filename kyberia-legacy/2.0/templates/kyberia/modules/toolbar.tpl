<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
<center>
<a href='/id/1/'>main</a> ----
<a href='/id/101/'>kyberia</a> ----
<a href='/id/102/'>hysteria</a> ----
<a href='/id/19'>bookmarks</a> ----
<a href='/id/24'>posta</a> ----
<a href='/id/23'>posledne</a> ----
<a href='/id/15'>k</a> ----
<a href='/id/27'>ludia</a> ----
<!--  <a href='/id/20'>clanky</a> ---- -->
<a href='/id/21'>denniky</a> ----
<a href='/id/29'>news</a> ----
<a href='/id/25'>search</a> ----
<a href='/id/{$user_id}/configure'>nastavenie</a> -----
<a href='/id/1017832'>help</a> ----
<input type='submit' value='logout' name='event' tabindex='23'>
</center>
</form>
