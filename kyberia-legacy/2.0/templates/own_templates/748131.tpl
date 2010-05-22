<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="1549864.tpl"}
{if $user_id eq false}
<center>{include file="1549885.tpl"}</center><br><br>
{/if}

{get_stats user_id=$node.node_id offset=$offset listing_amount=$listing_amount}

{merge_arrays array1=$get_stats sort_by='visits' orderby=$listing_order}


<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="1549925.tpl"}

{* showing poll *}
{include file="1549834.tpl"}
<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=66% valign='top'>
sort_by visits::
<table class='bordered'>
{foreach from=$merged item=stat}
<tr><td>
{counter}_ <img width='25' height='25' src='{get_image_link id=$stat.user_id}' border=0></td><td>
<a href='/id/{$stat.user_id}'>{$stat.login}</a>
&nbsp;({$stat.last_visit|date_format:"%d.%m.%Y. - %H:%M:%S"})
&nbsp;({$stat.node_user_subchild_count}) NEW
{if $stat.node_bookmark eq 'yes'},booked{/if}
{if $stat.given_k eq 'yes'},K{/if}
, {$stat.visits} visitz
</td></tr>
{/foreach}
</table>
{include file="1549377.tpl"}
</td></tr></table>
