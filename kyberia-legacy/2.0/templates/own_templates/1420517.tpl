<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<form action='/id/21/' method='post'>
{get_threaded_children listing_amount=23232322323 offset=$offset types=$children_types search_type=user search=marin}
{foreach from=$get_threaded_children item=child}

{$child.node_name}

{/foreach}

</form>

pici nechcesa mi to teraz =]