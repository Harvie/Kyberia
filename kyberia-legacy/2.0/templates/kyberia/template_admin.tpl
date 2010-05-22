<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
{get_nodes_by_type vector=$current_vector type=14 listing_amount=232323223 offset=$offset}
<table align='center'>
<tr>
<td colspan='2' align='center'><input type='submit' value='on_main' name='event'><input type='submit' value='off_main' name='event'></td>
</tr>

{foreach from=$get_nodes_by_type item=article}
	<tr><td><a href='/id/{$article.node_id}'>{$article.node_name}</a></td>
	<td><input type='checkbox' name='chosen[{$article.node_id}]' {if $article.on_main eq 'yes'} checked{/if}></td></tr>
{/foreach}

<tr>
<td colspan='2' align='center'><input type='submit' value='on_main' name='event'><input type='submit' value='off_main' name='event'></td>
</tr>


</table>
{include file="modules/footer.tpl"}