<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<table><tr>
<td><input type='hidden' name='get_children_offset' value='{$offset}'></td>
<td><input type='submit' name='get_children_move' value='<'></td>
<td><input type='submit' name='get_children_move' value='<<'></td>
<td><input class='small' name='listing_amount' type='text' value='{$listing_amount}'></td>
<td><select name='listing_order'>
<option value='desc' {if $listing_order eq 'desc'} selected {/if}>zozadu :-)</option>
<option value='asc'  {if $listing_order eq 'asc'} selected {/if}>(-: zpredu</option></select></td>
<td><input name='get_children_move' type='submit' value='>>'></td>
<td><input type='submit' name='get_children_move' value='>'></td>
</tr></table>