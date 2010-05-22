<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}
{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if} 

{*
<div style="position:fixed; width:250px;">

<center>{include file="modules/node_settings.tpl"}

{include file="modules/get_bookmark_statistics_box.tpl"}</center>
</div> *}

<div style="text-align:center; width:100%; position:relative;">
<div style="position:relative; text-align:left; margin:auto; width: 930px;">
  <div style="width:100%; background: #111; margin: 10px 0 0 0; position:relative;">
  tu sa nachadzaju nody mimo <a href="/id/101">stromu kyberie</a>; [ehm este to treba doladit(uh naka neplaech s listing amountom; vteddy to bolo nahodene narychlo a teraz ni cas)]</div>
  <div style="position:relative; margin-top:4px; width:100%;">
    <div style="float:left;">
    <form action='/id/{$node.node_id}/' method='post'>
    {if $node.node_bookmark neq 'yes'}
    <input type='submit' name='event' value='book'>
    {else}
    <input type='submit' name='event' value='unbook'>
    {/if}
    <input type='submit' name='event' value='K'>
    </form>

    <a href='/id/{$node.node_id}/neurons'>neurons</a> |
    <a href='/id/{$node.node_id}/stats'>statistics </a>|
    <a href='/id/{$node.node_id}/links'>links</a> |
    <a href='/id/{$node.node_id}/print'>print</a> |
    {if $node.node_creator eq $user_id or $node.node_permission eq 'master' or $node.node_permission eq 'op'}<a href='/id/{$node.node_id}/configure'>configure</a>{/if} |
    <span class='most_important'>{$node.k} K</span>
    
    
    </div>

<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
    <div style="float:right; margin: 10px 0;">
    <input type='text' name='node_content' style="width:123px; padding-left:5px; height:20px; background: #111; height:20px; border:0; border-left:1px solid #6dae42;"><input type='submit' name='template_event' value='filter_by' style="height:20px; border:1px solid #6dae42;"><select name='search_type' style="height:20px; border-top:1px solid #6dae42;"><option value='user' style="border:0;">user</option><option value='content' style="border:0;">content</option></select><input type='hidden' name='node_parent' value='{$node.node_id}'></div><br style="clear:both;">
  </div>
  


  <div style="float:left;"><span class="important">nodes::</span><br>
    {get_nodes_by_parent parent=0 listing_amount=300 offset=$offset}
   {foreach from=$get_nodes_by_parent item=child}
    {if $child.external_link neq "db://user"}
    <div style="clear:both; background: #111; width:280px; margin-bottom:5px; padding-left:23px;">[<a href='/id/{$child.node_id}'>{$child.node_id}</a>] owner[<a href='/id/{$child.node_creator}'>{$child.login}</a>]</div>
    {/if}
   {/foreach}
   ...
  </div>

  <div style="float:left; margin-left:10px;"><span class="important">forums::</span><br>
    {get_nodes_by_parent parent=0 listing_amount=800 offset=$offset}
    {foreach from=$get_nodes_by_parent item=child}
    {if $child.template_id eq 3}
    <div style="clear:both; background: #111; width:280px; margin-bottom:5px; padding-left:23px;">[<a href='/id/{$child.node_id}'>{$child.node_name|strip_tags}</a>] owner[<a href='/id/{$child.node_creator}'>{$child.login}</a>]</div>
    {/if}
   {/foreach}
   ...
  </div>

  <div style="float:right;"><span class="important">users::</span><br>
    {get_nodes_by_parent parent=0 listing_amount=20 offset=$offset}
    {foreach from=$get_nodes_by_parent item=child}
     {if $child.template_id eq 7 || $child.external_link eq "db://user"}
     <div style="clear:left; background: #111; width:280px; margin-bottom:5px; padding-left:23px;"><a href='/id/{$child.node_id}'>{$child.node_name}</a> :: id/{$child.node_id}</div>
     {/if}
    {/foreach}
    ...
 </div>
<br style="clear:both;">
</div>
</div>
<center>{include file="modules/movement.tpl"}</center>
</form>


{include file="modules/footer.tpl"}


