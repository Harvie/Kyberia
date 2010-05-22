<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{$node.node_content}

{get_threaded_children listing_amount=$listing_amount offset=$offset types=$children_types orderby=$smarty.post.orderby}

{get_linked_nodes}

{merge_arrays array1=$get_threaded_children array2=$get_linked_nodes sort_by='node_id'}