<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<!--
<table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr class="BgLogin">
          <td rowspan="2"><img src="/images/sv/spacer.gif" width="11" height="11" style="border: 0px none"></td>
          <td width="26" height="26">login</td>
          <td width="124"><p align="center"><input class="bgLogin" style="FONT-SIZE: 11px; WIDTH: 70px; FONT-FAMILY: Arial,Helvetica, sans-serif" size="7" name="T1" size="20"></td>
          <td rowspan="2"><img src="/images/sv/spacer.gif" width="11" height="11" style="border: 0px none"></td>
          <td align="right">&nbsp;</td>
          <td width="11">&nbsp;</td>
        </tr>
        <tr class="BgLogin">
          <td width="26" height="26">heslo</td>
          <td width="124"><p align="center"><input class="bgLogin" style="FONT-SIZE: 11px; WIDTH: 70px; FONT-FAMILY: Arial,Helvetica, sans-serif" size="7" name="T2" size="20"></td>
          <td align="right"><img border="0" src="/images/sv/arrow.gif" width="9" height="9"></td>
          <td width="11"><img src="/images/sv/bottom.gif" style="border: 0px none" width="11" height="26"></td>
        </tr>
      </table>
<br>
-->

{get_children_by_type parent_id=103 type=2 listing_amount=10 offset=$offset}
<table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr class="BgMenu">
          <td colspan="2" ><img src="/images/sv/spacer.gif" width="11" height="11" style="border: 0px none"></td>
          <td width="124">&nbsp;</td>
          <td width="1"><img src="/images/sv/spacer.gif" width="1" height="11" style="border: 0px none"></td>
          <td width="9" align="right">&nbsp;</td>
          <td width="11"><img src="/images/sv/top.gif" style="border: 0px none" width="11" height="26"></td>
        </tr>
{foreach from=$get_children_by_type item=child}
        <tr style="background-color: #FFFFFF">
          <td width="150" colspan="6"><img src="/images/sv/spacer.gif" width=1 height=1 style="border: 0px none"></td>
        </tr>
        <tr class="BgMenu">
          <td width="1" height="26"><img src="/images/sv/spacer.gif" width="1" height="11" style="border: 0px none"></td>
          <td><img src="/images/sv/spacer.gif" width="11" height="11" style="border: 0px none"></td>
          <td width="124"><b><a class="odkaz" href="/id/{$child.node_id}">{$child.node_name}</a></b></td>
          <td width="1"><img src="/images/sv/spacer.gif" width="1" height="11" style="border: 0px none"></td>
          <td width="9" align="right"><img border="0" src="/images/sv/arrow.gif" width="9" height="9"></td>
          <td width="11" class="BgMenu">&nbsp;</td>
        </tr>
{/foreach}
        <tr style="background-color: #FFFFFF">
          <td width="150" colspan="6"><img src="/images/sv/spacer.gif" width=1 height=1 style="border: 0px none"></td>
        </tr>
        <tr class="BgMenu">
          <td colspan="2" ><img src="/images/sv/spacer.gif" width="11" height="11" style="border: 0px none"></td>
          <td width="124">&nbsp;</td>
          <td width="1"><img src="/images/sv/spacer.gif" width="1" height="11" style="border: 0px none"></td>
          <td width="9" align="right">&nbsp;</td>
          <td width="11"><img src="/images/sv/bottom.gif" style="border: 0px none" width="11" height="26"></td>
        </tr>
</table>