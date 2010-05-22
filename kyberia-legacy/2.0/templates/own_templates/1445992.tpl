<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_movement_params children_count=$node.node_children_count}
{include file="modules/header.tpl"}

{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center><br><br>
{/if}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>

<table>
<tr><td colspan='2' align='center'>
<img src='/images/nodes/1/4/{$node.node_id}.gif'>
</td></tr>
<tr><td>node:</td><td><a href='/id/{$node.node_id}'>23.02.2005-10:28:34</a></td></tr>
<tr><td>template:</td><td><a href='/id/4'>4</a></td></tr>
<tr><td>parent:</td><td><a href='/id/821926'>N0T3P4D</a></td>
<tr><td>owner:</td><td><a href='/id/1434594'>replica</a></td>
<tr><td>datetime:</td><td>23.02.2005. - 10:28:34</td></tr>
</table>

<br>

<table class='bordered'>
<tr><td colspan='2' align='center' class='important'>permissions</td></tr>
<tr><td>you:</td><td align='center'>
r,w,owner
</a></td>
<tr><td>system:</td><td align='center'>private</a></td>
<tr><td>net:</td><td align='center'>yes</a></td>
</table>
<br>

<center><a href='/id/{$node.node_id}/neurons'>neurons</a></center>
<br>
<center><a href='/id/{$node.node_id}/stats'>statistics</a></center>
<center><a href='/id/{$node.node_id}/offtopic'>offtopic</a></center>
<center><a href='/id/{$node.node_id}/links'>links</a></center>
<center><a href='/id/{$node.node_id}/print'>print</a></center>
<center><a href='/id/15/{$node.node_id}'>k</a></center>


<table>
<tr>

     <td colspan='2' align='center'>
          <br><span class='important'>node viewed 9 times</span>
          <br><span class='important'>total descendants::</span>
          <br><span class='important'>total children::0</span>
     </td>

<form action='/id/{$node.node_id}/' method='post'>

<tr>
     <td colspan='2' align='center'>
          <input type='submit' name='event' value='book'>
          &nbsp;
          <input type='submit' name='event' value='K'>
     </td>
</tr>

</form>
</table>

<center><a href='/id/{$node.node_id}/configure'>configure</a></center><br>
<center><a href='/id/{$node.node_id}/forum'>!!!show flat!!!</a></center>

<br>

{* showing poll *}
{include file="modules/get_poll_box.tpl"}
<br>
{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td>
<!--end of left column-->

<!--main central column-->
<td width=66% valign='top'>
{*showing node_content*}
{include file="modules/node_content.tpl"}

{*showing form for adding child node*}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/
{if $action neq false}{$action}{/if}' method='post' name='formular'>
{if $permissions.w eq true}
{* include file="modules/addnode.tpl" *}

<table>
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;title or keywords::
			<input type='text' name='node_name'>
		</td>
		<td><input type='checkbox' name='no_html' value='yes'><td valign='middle'>&nbsp;NO HTML</td>
	</tr>
</table>

<textarea name='node_content'></textarea>

<table width=666>

<tr><!- -------------------------------------------- -->

<td>

{if $user_id eq 2133}
	<input type='submit' name='event' value='add'>
{else}
	<input type='submit' name='event' value='ass'>
{/if}

<td>
        <select name='template_id'>
	        <option value='4'>submission</option>
	        <option value='3'>forum</option>
	        <option value='2'>nodeshell</option>
	        <option value='12'>data</option>
        </select>
</td>

<td>
	<input type='submit' name='template_event' value='preview'>

<td>

	<table>
		<tr>
			<td><input type='hidden' name='get_children_offset' value='0'></td>
			<td><input type='submit' name='get_children_move' value='<'></td>
			<td><input type='submit' name='get_children_move' value='<<'></td>
			<td><input class='small' name='listing_amount' type='text' value='100'></td>
			<td><select name='listing_order'>
				<option value='desc'  selected >zozadu :-)</option>
				<option value='asc'  >(-: zpredu</option>
			</select></td>
			<td><input name='get_children_move' type='submit' value='>>'></td>
			<td><input type='submit' name='get_children_move' value='>'></td>
		</tr>
	</table>

</td>

<td align='left'><input type='submit' name='template_event' value='filter_by'>
<td align='left'>
<select name='search_type'>
	<option value='user'>user</option>
	<option value='content'>content</option>
</select>
<td align='left'><input type='submit' name='event' value='put'> 
<td align='left'><input class='small' type='text' value='' name='nodeshell_id'>
<td><input type='hidden' name='node_parent' value='{$node.node_id}'>

</tr><!- -------------------------------------------- -->

<tr><!- -------------------------------------------- -->

<td colspan='5' align='center'>
	<table><tr>
		<td colspan='5' align='center'>
			<input type='submit' name='event' value='delete'>
			&nbsp;<input type='submit' name='event' value='set_parent'>
			::<input type='text' name='new_parent'>
		</td>
	</tr></table>

</td>

</tr><!- -------------------------------------------- -->
</table>

<table align='center'><tr>
	<td>u have 23</td>
	<td><input type='submit' value='K' name='event'>&nbsp;&nbsp;</td>
</tr></table>

<br>

<table align='center'>
<tr>
<td><a href='/id/{$user_id}/'>
	<img hspace='0' vspace='0' width='50' height='50' border='0' align='left' name='pwnd' alt='pwnd' src='/images/nodes/{$user_id[0]}/{$user_id[1]}/{$user_id}.gif'>
</a></td>
</tr></table>

{/if}
{include file="modules/get_threaded_children.tpl"}

</form>


<!--end of central column-->

</td></tr></table>

{include file="modules/footer.tpl"}




