<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->


{if $action}{get_userlist vector=$action} in vector {$action}
{else}{get_userlist}
{/if}
{foreach name=friends from=$active_friends item=active_friend}
{if $smarty.foreach.friends.iteration is div by 5}{/if}
---[{$active_friend.login}]:::::[{$active_user.user_action}]<br><br>
{/foreach}

<br><br><br>
{foreach name=activeusers from=$active_users item=active_user}
{if $smarty.foreach.users.iteration is div by 5 }{/if}
---[<a href='/id/{$active_user.user_id}'>{$active_user.login}</a>]:::::[{$active_user.user_action}]<br>
{/foreach}

<br>
<br>
<br>
<br>
<br>
<br>
-------------------------------------------------------------------------------
{foreach from=$users item=user}
{$user.login}
{/foreach}

{include file="modules/get_nodes_by_type_small.tpl" type=7 listing_amount=10000}