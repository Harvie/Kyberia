<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{if $template_event eq 'preview'}
<div class='sub{$user_id}' style='margin-top: 10px;'>
  <img width='50' hspace='5' src='{get_image_link id=$user_id}' alt='' style='float:left; margin-right:5px;' class='icon' />
  <div class='th_header' style='background:#333;'>
    PREVIEW
  </div>
  <div class='th_content' style='margin-top: 5px;'>
    {$post_vars.node_content|preview}
  </div>
</div>
{* end of preview *}

{elseif $template_event eq 'filter_by'}
{get_threaded_children listing_amount=23232322323 offset=$offset types=$children_types search_type=$post_vars.search_type search=$post_vars.node_content}
{elseif $user_id neq true}
{get_threaded_children offset=0 listing_amount=232 orderby="asc"}
{elseif $node.node_user_subchild_count eq true}
{get_threaded_children offset=0 listing_amount=232 time=$node.last_visit time=$node.last_visit orderby=$listing_order types=$children_types}

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

<div class='thread'>
  <div class='sub{$user_id}' style='margin-top: 10px;'>
    {*if $child.node_created > $node.last_visit and $child.depth>$node.vector_depth*}
    <a href='/id/{$child.node_parent}' class='th_vector'>{$child.node_vector}</a>
    {*/if*}
    <div class='th_margin' style='float:left;' width='{math equation="(x-y)-9" x=$child.depth y=$node.vector_depth}%'>
    </div>
    <div {if $child.node_created > $node.last_visit} class='th_body_new' {else} class='th_body' {/if}>
      <img width='50' hspace='5' src='{get_image_link id=$child.node_creator}' alt='' style='float:left; margin-right:5px;' class='icon' />
      <div class='th_header' style='background:#333;'>
        <a href='/id/{$child.node_creator}'>{$child.login}</a>
        <input type='checkbox' value='{$child.node_id}' name='node_chosen[]'> 
        {$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
        {if $child.node_created > $node.last_visit}
          <span class='most_important'>NEW</span>
        {/if}
        {if $child.node_status eq 'linked'}
          <span class='most_important'>LINKED</span>
        {/if}
        <div class='header_button' style='text-align:center;'>
          {if $child.node_name eq ''}
            <a href='/id/{$child.node_id}'>{$child.node_created|date_format:"%d.%m.%Y.-%H:%M:%S"}</a>
          {else}
            <a href='/id/{$child.node_id}'>{$child.node_name}</a>
          {/if}
          | <a href='/id/{$child.node_id}/configure'>conf</a>
        </div>
      </div>
      <div class='th_content' style='margin-top: 5px;'>
        {$child.node_content|stripslashes|nl2br}
      </div>
    </div>
  </div>
</div>
{/if}
{/foreach}

<div class='list'>
<input type='hidden' name='get_children_offset' value='{$offset}'> 
<input type='submit' name='get_children_move' value='<'>
<input type='submit' name='get_children_move' value='<<'>
<input name='get_children_move' type='submit' value='>>'>
<input type='submit' name='get_children_move' value='>'>
</div>