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

<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/' class='c_conf1'>
<div id='conf1'>
<input type='text' name='node_name' value='{$node.node_name}'>
<input type='submit' name='event' value='configure_node_name'>
<select name='node_system_access'>
<option value='public' {if $node.node_system_access eq 'public'}selected{/if}>public</option>
<option value='moderated' {if $node.node_system_access eq 'moderated'}selected{/if}>moderated</option>
<option value='private' {if $node.node_system_access eq 'private'}selected{/if}>private</option>
<option value='cube' {if $node.node_system_access eq 'cube'}selected{/if}>cube</option>
<option value='crypto' {if $node.node_system_access eq 'crypto'}selected{/if}>crypto</option>
</select>
<input type='submit' name='event' value='configure_system_access'>
<input name='node_external_access' type='checkbox' value='yes' {if $node.node_external_access eq 'yes'}checked{/if}>
<input type='submit' name='event' value='configure_external_access'>
<input type='file' name='description_image'>
<input type='submit' name='event' value='configure_image'>
<input type='text' name='template_id' value='{$node.template_id}'>
<input type='submit' name='event' value='configure_template_id'>
</div>
apply on vector ??? <input type='checkbox' name='apply_on_vector'>
</form>


<form action='/id/{$node.node_id}/' method='post' class='c_parent'>
vector: {$node.node_vector} 
<input type='text' name='new_parent' value='{$node.node_parent}'>
<input type='submit' name='event' value='set_parent'>
</form>

<form action='/id/{$node.node_id}/' method='post'>
<input type='text' name='owner' value='{$node.owner}'><input type='submit' name='event' value='set_creator'>
</form>

<!--
<form action='/id/{$node.node_id}/' method='post'>
<table><tr><td>
<select name='template_id'>
{foreach key=key from=$types item=template_id}
<option value='{$key}'>{$template_id}</option>
{/foreach}
</select>
</td>
<td>
<input type='submit' name='event' value='set_type'>
</td></tr></table>
</form>
-->
<form method='post' enctype="multipart/form-data" action='/id/{$node.node_id}/'>
{if $node.node_system_access eq 'crypto'}crypto password: {$crypto_pass}{/if}
<input type='file' name='data_file'>&nbsp;&nbsp;<input type='submit' name='event' value='upload_data_file'>
<br><input type='checkbox' name='unzip'>unzip?
<input type='checkbox' name='gallery'>gallery<Br><br>
</form>

{if $user_id eq $node.node_id}
<form action='/id/{$node.node_id}/' method='post'>
<input type='text' name='header_id' value='{$header_id}'><input type='submit' name='event' value='set_header_template'>
<input type='text' name='listing_amount' value='{$listing_amount}'><input type='submit' name='event' value='set_listing_amount'>
<tr><td><select name='listing_order'>
<option value='desc'  {if $smarty.session.listing_order eq 'desc'}selected{/if}>najnovsie hore</option>
<option value='asc' {if $smarty.session.listing_order eq 'asc'}selected{/if}>najstarsie hore</option>
</select>
<td><input type='submit' name='event' value='set_listing_order'>

<br>
<div class='bordered'>
old password<input name='old_password' type='password'>
new password><input name='new_password1' type='password'>
new password (again)<input name='new_password2' type='password'>
<input type='submit' name='event' value='set_password'>
</div>
</FORM>
{/if}

