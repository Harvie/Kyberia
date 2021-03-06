<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{get_children_by_type type=$type listing_amount=$listing_amount offset=$offset orderby=desc}
  {foreach from=$get_children_by_type item=child}
  <table>
    <tr>
      <td valign='top' rowspan='2'><img width='50' hspace='5' src='{get_image_link id=$child.node_creator}'> </td>
      <td valign='top' width='100%'>
      <table width='100%'>
        <tr class='header' valign='top'>
          <td>
            {if $child.template_id eq 6 || $child.template_id eq 5}
              <center><a href='/id/{$child.node_id}' class=important>{$child.node_name}</a></center>
            {else}
              &nbsp;<a href='/id/{$child.node_creator}'>{$child.login}</a>
              {if $child.user_action neq false}
                &nbsp;[lokacia :: <a href='/{$child.user_action_id}/'>{$child.user_action}</a>]
              {/if}
            {/if}
            <br /><center>{$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}</center>
          </td>
        </tr>
        <tr><td>{$child.node_content|truncate:230|stripslashes|nl2br}</td></tr>
      </table></td></tr>
  </table>
{/foreach}
