<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<!-- PHP code and design stolen from "frr", "MARIN" and "hromi" || regards & thanks -->

{include file="modules/header.tpl"}
{if $error eq true}

<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>

{else}



{get_userlist}
<br>
<a href="/configure">conf</a>
<br>
::<span class='important'> friendz</span>
<br><br>

{foreach name=friends from=$active_friends item=active_friend}
{if $smarty.foreach.friends.iteration is div by 3}{/if}
<a href='/id/{$active_friend.user_id}/'>
<img border='0' name='{$active_friend.login}' width='40' height='40' alt='{$node_visitor.login}' src='{get_image_link id=$active_friend.user_id}'></a>
<br><br>
{/foreach}







<br>



<!--
>><span class='important'> friendz</span>
<table width='100' style="border-bottom:1px solid #6dae42;"><tr><td>
{foreach name=friends from=$active_friends item=active_friend}
<div style=" clear:left; margin-bottom:15px">
<a href='/id/{$active_friend.user_id}/' style="float:left;">
<img width='23' height='23' alt='{$node_visitor.login}' src='{get_image_link id=$active_friend.user_id}' border='0'></a></font>
 {$active_friend.login}
[<a href='/id/{$active_friend.user_action_id}'>{$active_friend.user_action}</a></b></font>] {$active_friend.idle_time_minutes}m {$active_friend.idle_time_seconds}s 
</div>                
{/foreach}
</td></tr></table><br>
--> 








<td valign='top'>

<!--
<form method='post'>
<table align='center'><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table>
</form>
-->






{/if}


{include file="modules/footer.tpl"}




























































