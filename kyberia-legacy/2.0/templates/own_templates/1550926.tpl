<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<textarea name='node_content'>{$post_vars.node_content}</textarea>
<br>
{if $permissions.w eq true}
<input type='hidden' name='node_parent' value='{$node.node_id}'>
<input type='submit' name='event' value='add'>


	<select name='node_system_access'>
	<option value='public' {if $node.node_system_access eq 'public'}selected{/if}>public</option>
	<option value='moderated' {if $node.node_system_access eq 'moderated'}selected{/if}>moderated</option>
	<option value='private' {if $node.node_system_access eq 'private'}selected{/if}>private</option>
	<option value='crypto' {if $node.node_system_access eq 'crypto'}selected{/if}>crypto</option>
	</select>


        <select name='template_id'>
        {foreach from=$children_types item=template_id}
        <option value='{$template_id}'>{$types[$template_id]}</option>
        {/foreach}
        </select>

 with name:<input type='text' name='node_name'>

{/if}