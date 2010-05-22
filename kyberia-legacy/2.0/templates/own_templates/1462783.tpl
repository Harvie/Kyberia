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

<table width='100%'><tr valign='top'><td width='30%'>

{get_userlist}

<!--left column-->
<!-- taken from '/id/1416619'
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
</td></tr></table><br> -->

::<span class='important'> friendz</span>
<table width='75%' ><tr><td>
{foreach name=friends from=$active_friends item=active_friend}
{if $smarty.foreach.friends.iteration is div by 3}</tr><tr>{/if}
<td width='100%'>
<table><tr><td width='42' align='center'><a href='/id/{$active_friend.user_id}/'>
<img border='0' name='{$active_friend.login}' width='40' height='40' alt='{$node_visitor.login}' src='{get_image_link id=$active_friend.user_id}'></a></td></tr>

        </table>
</td>
{/foreach}
</td></tr>

</table>




<br>


::<span align='center' class='important'> latest forums</span></center><br>
{get_nodes_by_type type=3 listing_amount=10 offset=$offset}
{foreach from=$get_nodes_by_type item=child}
<div style=" clear:left; margin-bottom:4px">
<a href='/id/{$child.node_id}'>{$child.node_name}</a><br>
by <a href='/id/{$child.node_creator}'>{$child.login}</a>
({$child.node_children_count} children)</a><br>
</div>
{/foreach}


<br><br>

::<span class='important'> latest blogs</span><br>
{get_nodes_by_parent parent=21 listing_amount=15 offset=$offset}
{foreach from=$get_nodes_by_parent item=child}
<table width='100%'>
<tr><td>
<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:20:"<br>":true}</a><br>
by <a href='/id/{$child.node_creator}'>{$child.login}</a> ({$child.node_views} views)</td></tr>
</table>
{/foreach}

<br><br>

::<span class='important'> latest data nodes</span></center><br>
{get_nodes_by_type type=12 listing_amount=20 offset=$offset}
{foreach from=$get_nodes_by_type item=child}
<div style=" clear:left; margin-bottom:4px">
<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:40:"<br>":true}</a>
by <a href='/id/{$child.node_creator}'>{$child.login|wordwrap:40:"<br>":true}</a><br>
in <a href='/id/{$child.node_parent}'>{$child.parent_name|wordwrap:40:"<br>":true}</a>
<br>
</div>
{/foreach}

<br><br>

::<span class='important'> latest nodeshells</span></center><br>
{get_nodes_by_type type=2 listing_amount=20 offset=$offset}
{foreach from=$get_nodes_by_type item=child}
<div style=" clear:left; margin-bottom:4px">
<a href='/id/{$child.node_id}'>{$child.node_name|wordwrap:40:"<br>":true}</a>
by <a href='/id/{$child.node_creator}'>{$child.login|wordwrap:40:"<br>":true}</a><br>
in <a href='/id/{$child.node_parent}'>{$child.parent_name|wordwrap:40:"<br>":true}</a>
<br>
</div>
{/foreach}


</td>
<!--end of left column-->

<!--main central colmn-->
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


::<span class='important'> last sumbissions</span><br>
{include file="modules/get_last.tpl" vector=$action listing_amount=$listing_amount}
<!--end of central column-->

</td></tr></table>

{/if}


{include file="modules/footer.tpl"}




















































