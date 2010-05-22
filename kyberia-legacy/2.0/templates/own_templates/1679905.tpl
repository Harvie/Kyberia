<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

<div style='position: fixed;height: 100%;background-color:black;z-index: 2'>
<div class='active_users' style='margin-left: 10px; width: 200px'>
<span class='important'><center>friends</center></span>
{if $action}{get_userlist vector=$action} in vector {$action}
{else}{get_userlist}
{/if}
{foreach name=friends from=$active_friends item=active_friend}<a href="javascript:chngto('{$active_friend.login}','{$active_friend.user_id}')"><img name='{$active_friend.login}' alt='{$active_friend.login}' title='{$active_friend.login}' src='{get_image_link id=$active_friend.user_id}' border='0' height='50' width='50'></a>{/foreach}
</div>


<div style='margin-left: 10px; margin-top: 5px; width: 200px'>
<span class='important'><center>new forums</center></span>
{get_nodes_by_type type=3 listing_amount=10 offset=$offset}
{foreach from=$get_nodes_by_type item=child}
<a href='/id/{$child.node_id}'>{$child.node_name|strip_tags}</a>
{$child.login} ({$child.node_children_count})</a><br>
{/foreach}
</div>



<div style='margin-left: 10px; margin-top: 5px; width: 200px; text-align: justify'>
<span class='important'><center>users online</center></span>
{foreach name=users from=$active_users item=active_user}
<a href="javascript:chngto('{$active_user.login}','{$active_user.user_id}')">{$active_user.login}</a>
{/foreach}
</div>
</div>




<div style='position: absolute; left: 240px; top: 29px;'>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post' name='formular'>
{include file="modules/mailform.tpl"}
{include file="modules/mail.tpl" listing_amount=$listing_amount offset=$offset}
</form>
<br /><br /><br /><br /><br /><br />
{include file="modules/footer.tpl"}
</div>





