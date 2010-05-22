<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
<input type='checkbox' name='no_html' value='yes'>&nbsp;NO HTML<br>
<textarea class=node_content name='node_content'>
{$node.node_content|escape:"html"}
</textarea><br>
<center><input type='submit' name='event' value='configure_content'></center>
</form>
<br><br>
