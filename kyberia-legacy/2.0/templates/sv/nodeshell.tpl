<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"} 
<table cellspacing='0' cellpadding='0' width='780' align='left' valign='top'>
<tr><td colspan='2' align='center'>
</td></tr>
<tr>
<td align='center' valign='top' style='width: 230px'>
{include file="modules/loginbox.tpl"}
<br>

{get_children_by_type parent_id=$node.node_id type=2 listing_amount=10 offset=$offset}
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
<br>
</td>
<td>
 <td valign="top"><IMG height=1 src="/images/sv/pruh.gif" width=8></td>
    <td valign="top">
	<div align="right">
		<table border="0" style="border-collapse: collapse" id="table1" cellpadding="0">
			<tr>
				<td>
				<a href='/'><img border="0" src="/images/sv/logo_sv.gif" width="180" height="108"></a></td>
				<td><IMG height=28 src="/images/sv/pruh.gif" width=115></td>
			</tr>
			<tr>
				<td colspan="2">
				&nbsp;</td>
			</tr>
		</table>
	</div>
	
	  <table class="BgContent" border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr valign="top">
          <td><IMG height=4 src="/images/sv/lt.gif" width=4 ></td>
		  <td><IMG height=28 src="/images/sv/pruh.gif" width=462></td>
		  <td align="right"><IMG height=4 src="/images/sv/rt.gif" width=4 ></td>
		  <td style="background-color: #FFFFFF"><IMG height=1 src="/images/sv/pruh.gif" width=8></td>
		  <td><IMG height=4 src="/images/sv/lt.gif" width=4 ></td>
		  <td><IMG height=28 src="/images/sv/pruh.gif" width=148></td>
		  <td align="right"><IMG height=4 src="/images/sv/rt.gif" width=4 ></td>
		</tr>
		<tr>
		  <td colspan="3" valign="top">
		    <table border="0" cellpadding="0" cellspacing="0" width="470">
			  <tr>
				<td height="56" valign="bottom" class="BgTitle"><IMG height=30 alt="" src="/images/sv/pruh.gif" width=11 align=left border=0><span class="title">{$node.node_name}</span></td>
				<td height="56" width="300"><IMG height="56" alt="" src="/images/sv/head_l.jpg" width="300" border="0"></td>
			  </tr>
			  <tr>
				<td valign="bottom" colspan="2">&nbsp;</td>
			  </tr>
			</table>
			<table border="0" style="border-collapse: collapse" width="470" id="table11" cellpadding="0">
		      <tr><td height="20" valign="bottom" bgcolor="#FFFFFF"><img border="0" src="/images/sv/reklama.gif" width="470" height="8"></td>
		      </tr>
		      <tr><td><p align="center"><a href='http://www.konopa.cz'><img src="http://sv.somastudio.sk/dopln/konopaczfull.gif" width="468" height="60" style="border-left: 1px solid #6E6695; border-right: 1px solid #6E6695; border-bottom: 1px solid #6E6695"></a></td>
			  </tr>
			</table>
			<br>
{$node.node_content}
<br>
{get_nodes_by_type type=5 vector=$current_vector listing_amount=10 offset=$offset}
{foreach from=$get_nodes_by_type item=child}
<table border="1" style="border-collapse: collapse" width="470" cellpadding="0" bordercolor="#6E6695">
<tr><td>
<table border="0" style="border-collapse: collapse" width="100%" cellpadding="6" bgcolor="#FFFFFF" id="table13" class="BgTitleContent">
<tr><td><b><a href='/id/{$child.node_id}'>{$child.node_name}</a></b></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table border="0" style="border-collapse: collapse" width="100%" cellpadding="6" bgcolor="#FFFFFF" id="table12">
<tr><td>
<img border="0" src="{get_image_link id=$child.node_id}" align="left">
{$child.node_content|truncate:230}</td>
</tr>
</table>
</td></tr></table>
{/foreach}

</td>

<td  style="background-color: #FFFFFF"><IMG height=1 src="/images/sv/pruh.gif" width=8></td>
<td colspan="3" valign="top">

<table border="0" cellpadding="0" cellspacing="0" width="154">
  <tr>
    <td height="56" valign="bottom"><IMG height="56" alt="" src="/images/sv/head_r.jpg" width="155" border="0"></td>
  </tr>
</table>
{include file="modules/get_poll_box.tpl"}

</td>
</tr>
<tr valign="bottom">
  <td><IMG height=4 src="/images/sv/lb.gif" width=4 ></td>
  <td><p align="center"><IMG height=28 src="/images/sv/pruh.gif" width=1>. o.z. slobodna volba, <a href="mailto:info@slobodnavolba.sk">info@slobodnavolba.sk</a><br><br></td>   <td align="right"><IMG height=4 src="/images/sv/rb.gif" width=4 ></td>
  <td style="background-color: #FFFFFF">&nbsp;</td>
  <td><IMG height=4 src="/images/sv/lb.gif" width=4 ></td>
  <td>&nbsp;</td>
  <td><IMG height=4 src="/images/sv/rb.gif" width=4 ></td>
</tr>


<tr>
  <td style="background-color: #FFFFFF" colspan="7"><IMG height=14
src="/images/sv/pruh.gif" width=1></td>
</tr>

</table>
</td>
</tr>
</table>
</body>
</html>