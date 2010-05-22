<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

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
				<td height="56" valign="bottom" class="BgTitle"><IMG height=30 alt="" src="/images/sv/pruh.gif" width=11 align=left border=0><span class="title">Èlánky</span></td>
				<td height="56" width="300"><IMG height="56" alt="" src="/images/sv/head_l.jpg" width="300" border="0"></td>
			  </tr>
			  <tr>
				<td valign="bottom" colspan="2">&nbsp;</td>
			  </tr>
			</table>
			<table border="0" style="border-collapse: collapse" width="470" id="table11" cellpadding="0">
		      <tr><td height="20" valign="bottom" bgcolor="#FFFFFF"><img border="0" src="//images/sv/reklama.gif" width="470" height="8"></td>
		      </tr>
		      <tr><td>
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="468" height="60">
<param name="movie" value="/upload/slobodnavolba.swf">
<param name="quality" value="high">
<embed src="slobodnavolba.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="468" height="60"></embed>
</object>
</td>
			  </tr>
			</table>
			<br>

{get_nodes_by_type type=5 vector=;1;103 listing_amount=23 offset=$offset}
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
{$child.node_content|truncate:320}<br><br>
<center>sekcia: <a href='/id/{$child.node_parent}'>{$child.parent_name}</a>
&nbsp;&nbsp;{$child.node_views} zobrazení, {$child.node_children_count} príspevkov
</center>
</td>
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
<br><br>
{get_poll poll_id=103}
{include file="modules/show_poll.tpl" get_poll=$get_poll}
<br>
<table>
<tr>
	<td class="BgTitleContent" colspan="3">mailing list 
	<form method="POST" action="http://web.changenet.sk/cgi-bin/send.pl">
	<input type="hidden" name="redirect" value="http://www.slobodnavolba.sk/">
	<input type="hidden" name="recipient" value="slobodnavolba-request@list.changenet.sk">
	<input type="hidden" name="subject" value="subscribe">
	<input type="hidden" name="required" value="email"></td>
</tr>
<tr>
	<td>email:</td>
	<td><input type="text" name="email" size="7" value=""></td>
	<td align="left" width="40"><input type="submit" value="OK"><Br><br></td>
</tr>
<tr><td class="BgTitleContent" colspan="3">správy zo sveta</tr>
<tr><td colspan='3'>
{get_creation_by_type type=13 creator_id='621089' listing_amount=23 offset=0}
{foreach from=$get_creation_by_type item=child}
{$child.node_content}<br><br>
{/foreach}

</td></tr>
</table>
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
  <td style="background-color: #FFFFFF" colspan="7"><IMG height=14 src="/images/sv/pruh.gif" width=1></td>
</tr>

</table>
</td>
</tr>