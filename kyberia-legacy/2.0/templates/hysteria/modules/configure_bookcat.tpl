<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_bookmarks node_id=$node.node_id}
{foreach from=$get_bookmarks item=bookmark}
<input type='checkbox' name='bookmark[{$bookmark.node_id}]'
{if $bookmark.bookmark_category eq true}checked{/if}
>&nbsp;&nbsp;{$bookmark.node_name}<br>
{/foreach}
<br>
<input type='submit' name='event' value='configure_bookmarks'>