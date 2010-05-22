<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}

<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
<table width='70%'>
<tr><td>name/keywordz: 
<td><input type='text' name='node_name' value='{$node.node_name}'>
<td>system_access
<td><select name='node_system_access'>
<option value='public' {if $node.node_system_access eq 'public'}selected{/if}>public</option>
<option value='moderated' {if $node.node_system_access eq 'moderated'}selected{/if}>moderated</option>
<option value='private' {if $node.node_system_access eq 'private'}selected{/if}>private</option>
<option value='cube' {if $node.node_system_access eq 'cube'}selected{/if}>cube</option>
<!--<option value='crypto' {if $node.node_system_access eq 'crypto'}selected{/if}>crypto</option>-->
</select></td>

<td align='left'>
<td>external_access<td><input name='node_external_access' type='checkbox' value='yes' {if $node.node_external_access eq 'yes'}checked{/if}>
<tr><td>image</td><td><input type='file' name='description_image'>
<td>template_id</td><td><input type='text' name='template_id' value='{$node.template_id}'>
<tr><td colspan='6' align='center'><input type='submit' name='event' value='configure'>&nbsp;<input type='submit' name='event' value='delete'></td></tr></table>
</form>

<form action='/id/{$node.node_id}/' method='post'>
<table>
<tr><td colspan='2'>vector: {$node.node_thread_vector} </td></tr>
<tr><td>
<input type='text' name='new_parent' value='{$node.node_parent}'>
</td><td>
<input type='submit' name='event' value='set_parent'>
</td></tr>
</table>
</form>

<form action='/id/{$node.node_id}/' method='post'>
<table>
<tr><td><input type='text' name='owner' value='{$node.owner}'><input type='submit' name='event' value='set_creator'>
</table>
</form>

<form action='/id/{$node.node_id}/' method='post'>
<table><tr><td>
<select name='node_type'>
{foreach key=key from=$types item=node_type}
<option value='{$key}'>{$node_type}</option>
{/foreach}
</select>
</td>
<td>
<input type='submit' name='event' value='set_type'>
</td></tr></table>
</form>

<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
{if $node.node_system_access eq 'crypto'}crypto password: {$crypto_pass}{/if}
{if $node.node_type=='data'}
<input type='file' name='data_file'>&nbsp;&nbsp;<input type='submit' name='event' value='upload_data_file'><br><br>
{/if}
</form>

{if $user_id eq $node.node_id}
<form action='/id/{$node.node_id}/' method='post'>
<table align='center'>
<tr><td><input type='text' name='header_id' value='{$header_id}'></td><td><input type='submit' name='event' value='set_header_template'></td></tr>
<tr><td><input type='text' name='listing_amount' value='{$listing_amount}'></td><td><input type='submit' name='event' value='set_listing_amount'></td></tr>
<tr><td><select name='listing_order'>
<option value='desc'  {if $smarty.session.listing_order eq 'desc'}selected{/if}>najnovsie hore</option>
<option value='asc' {if $smarty.session.listing_order eq 'asc'}selected{/if}>najstarsie hore</option>
</select>
<td><input type='submit' name='event' value='set_listing_order'></td></tr>
</table>
</FORM>
{/if}