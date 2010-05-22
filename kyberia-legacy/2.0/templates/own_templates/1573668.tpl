<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="1549864.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="1549885.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{include file="1549925.tpl"}

<a href='/id/{$node.node_id}/1757900'>nodeshells</a><br />
<a href='/id/{$node.node_id}/1761254'>forums</a><br />
<a href='/id/{$node.node_id}/1573668'>submissions</a><br />
<a href='/id/{$node.node_id}/1773535'>articles</a><br />
<a href='/id/{$node.node_id}/1757556'>blogs</a><br />
<a href='/id/{$node.node_id}/1757626'>datas</a><br />

{* showing poll *}
{*include file="1549834.tpl"*}
<br>
{*showing bookmark_statistics*}
{include file="1549386.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td valign='top'>


{getCreationByTemplateId template_id="4" creator_id=$node.node_creator}

{foreach from=$getCreationByTemplateId item=child}

<div class='bordered' style='margin-bottom:13px'>
   <div class='header' style='text-align:center; height: 3em'>
      <a href='/id/{$child.node_id}'>{$child.node_name}</a>  in  <a href='/id/{$child.node_parent}'>{$child.parent_name}</a> {if $child.user_action neq false} [lokacia :: <a href='/{$child.user_action}/'>{$child.user_action}</a>]{/if}
   <br>&nbsp;&nbsp;{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}
   </div>
   <div>
     {$child.node_content|truncate:230|stripslashes}
   </div>
</div>

{/foreach}

<!--end of central column-->

</td></tr></table>
{/if}








