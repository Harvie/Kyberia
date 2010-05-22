<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{if $node.node_system_access neq 'public'}
<textarea class='small' name='access'>{$access}</textarea>
<br>
<center><input type='submit' name='event' value='accesslist'></center>
<br>
{/if}
{include file="modules/banlist.tpl"}



