<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<table>
<tr>
<td width=66 valign='top'>
<img src="/images/users/{$new_mail_name}.gif" name="fricon" border='0'><br>
<input style='width: 50px' type='text' name='mail_to' value='{$new_mail_name}' onmouseout="vymena()">
</td>
<td align='left' width=555 valign='top'><textarea name='mail_text'>{$post_vars.mail_text}</textarea></td>
</tr>
<tr>
<td><td>
	<table><tr>
	<td><input type='submit' name='event' value='send'></td>
	<td><input type='submit' name='template_event' value='preview'></td>
	<td>{include file="modules/movement.tpl"}</td>
	<td><input type='submit' name='event' value='delete_mail'></td>
	<td align='left'><input type='submit' name='template_event' value='filter_by'>
	 <td align='left'><select name='search_type'>
<option value='mail_text'>text:</option>
<option value='mail_from'>from:</option>
<option value='mail_to'>to:</option>
</select>

	</tr></table>
</td>
</tr>
</table>