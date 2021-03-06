<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}


<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{* show node info *}
{include file="modules/node_settings.tpl"}

{* showing poll *}
{include file="modules/get_poll_box.tpl"}
<br>
{*showing bookmark_statistics*}

{include file="modules/get_bookmark_statistics_box.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=666 valign='top'>
{*showing node_content*}
<table width='666' border=0 style='background:#111;'><tr><td>
{$node.node_content|nl2br}
</td></tr></table><br><br>
{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'>
{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if}

{if $template_event eq 'preview'}
<table>
<tr>
<td valign='top' rowspan='2' ><img hspace='5' src='{get_image_link id=$user_id}'></td>
<td width='100%' valign='top'>
<table width='100%'><tr class='header'>
<td align='center'>PREVIEW

<tr><td>{$post_vars.node_content|preview}</td></tr>
</table>
</table>
{* end of preview *}

{elseif $template_event eq 'filter_by'}
{get_threaded_children listing_amount=23232322323 offset=$offset types=$children_types search_type=$post_vars.search_type search=$post_vars.node_content}
{elseif $user_id neq true}
{get_threaded_children offset=0 listing_amount=232 orderby="asc"}
{elseif $node.node_user_subchild_count eq true}
{get_threaded_children offset=0 listing_amount=232 time=$node.last_visit time=$node.last_visit orderby=$listing_order types=$children_types}
<!--<center><span class='most_important'>pozor doslo k zmene funkcnosti systemu, NEW prispevky (vsetky) sa zobrazuju od najstarsieho k najnovsiemu zhora dolu</span></center>-->
{else}
{get_threaded_children listing_amount=$listing_amount offset=$offset types=$children_types orderby=$listing_order}
{/if}



{*get_linked_nodes time_1=$time_1 time_2=$time_2 orderby=$listing_order*}
{if $user_id neq true}
{merge_arrays array1=$get_threaded_children array2=$get_linked_nodes sort_by='thread' orderby="asc"}
{else}
{merge_arrays array1=$get_threaded_children array2=$get_linked_nodes sort_by='thread' orderby=$listing_order}
{/if}


{foreach from=$merged item=child}
{if $child.template_id eq 11}
     {get_poll poll=$child}
     {include file="modules/show_poll.tpl" get_poll=$get_poll}
     <br>
{else}

<table width='666'>
<tr>
{*if $child.node_created > $node.last_visit and $child.depth>$node.vector_depth*}
<td colspan='3'><a href='/id/{$child.node_parent}'>{$child.node_vector}</a></td>
</tr>
{*/if*}
<td width='{math equation="(x-y)-9" x=$child.depth y=$node.vector_depth}%'></td>
<td valign='top' rowspan='2'><img width='50' hspace='5' src='{get_image_link id=$child.node_creator}'></td>
<td width='{math equation="100-(x-y)" x=$child.depth y=$node.vector_depth}%'>
<table class='bordered' width='100%'><tr class='header'>
<td>
&nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
{if $child.user_action neq false}
&nbsp;[lokacia :: <a href='/{$child.user_actions}/'>{$child.user_action}</a>]
{/if}
&nbsp;&nbsp;<input type='checkbox' value='{$child.node_id}' name='node_chosen[]'>
&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
{if $child.node_created > $node.last_visit}<span class='most_important'>&nbsp;&nbsp;NEW</span>{/if}
{if $child.node_status eq 'linked'}<span class='most_important'>LINKED</span>{/if}

{if $child.node_name eq ''}
<div align='center'><a href='/id/{$child.node_id}'>enter node {$child.node_id}</a></div>
{else}
<div align='center'><a href='/id/{$child.node_id}'>{$child.node_name}</a></div>
{/if}
<tr><td>{$child.node_content|stripslashes|nl2br}</td></tr>
</table>
</table>
{/if}
<br>
{/foreach}

<table align='center'><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table>



</form>
<!--end of central column-->

</td></tr></table>

{include file="modules/footer.tpl"}

