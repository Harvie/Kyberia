<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}


{get_userlist}
{get_children_by_external_link external_link='session://friend' listing_amount=$listing_amount offset=$offset orderby=desc}
{foreach from=$get_children_by_external_link item=child}
a
{/foreach}



