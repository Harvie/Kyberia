<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{if $permissions.h eq true or $node.node_creator eq $user_id or $node.node_permission eq 'master'}
<table><tr><td colspan='5' align='center'>
<!--<input type='submit' name='event' value='offtopic'>-->
&nbsp;<input type='submit' name='event' value='set_parent'>::<input type='text' name='new_parent'>
</td></tr></table>{/if}
