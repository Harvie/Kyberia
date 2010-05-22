<?
function readzion($location)

{
$zion = fsockopen ("www.zion.sk",80);
//$hovno="GET /$location HTTP/1.0\nHost: www.zion.sk\nUser-Agent: Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)\nReferer: http://www.zion.sk/\n\n";
//echo $hovno;
fputs ($zion, "GET /$location HTTP/1.0\nHost: www.zion.sk\nUser-Agent: Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)\nReferer: http://www.zion.sk/\n\n");

while (!feof($zion)):

if (!$body) { if (fgets($zion,30720)=="\r\n") $body=1; }
else echo fgets($zion,30720);

endwhile;
fclose ($zion);

return 0;
}

?>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr align="left" valign="top" background=http://kyberia.sk/images/dole.gif"> 
    <td colspan="9" height="40" background="http://kyberia.sk/images/dole.gif" align="left" valign="top"><img src="http://zion.sk/obrazky/7px.gif" width="20" height="40" align="top"><a href="mailto:hromi@kyberia.sk"><img src="http://zion.sk/obrazky/kyberia/bottom1.gif" width="16" height="25" align="top" alt="kontakt" border="0"></a><img src="http://zion.sk/obrazky/7px.gif" width="5" height="7" align="top"><img src="http://zion.sk/obrazky/kyberia/bottom2.gif" width="16" height="25" align="top" alt="stvorcek zeleny,nahovno stvoreny" border="0"><img src="http://zion.sk/obrazky/7px.gif" width="5" height="8" align="top"><img src="http://zion.sk/obrazky/kyberia/bottom3.gif" width="16" height="25" align="top" alt="stvorcek zelenyyyyyy tiez nahovno stvoreny" border="0"></a></td>
  </tr>
  <tr align="left" valign="top"> 
    <td align=center colspan="3">nove texty na zion.sk</td>
    <td colspan="3" align=center >najdiskutovanejsie clanky na zion.sk</td>
    <td colspan="3" align=center >tlacove zpravy</td>
  </tr>
  <tr align="left" valign="top"> 
    <td width="8"><img src="http://zion.sk/obrazky/7px.gif" width="8" height="7"></td>
    <td width="234"><?php readzion("kyberia/skripty/clankyshow.php");?></td>
    <td width="8"><img src="http://zion.sk/obrazky/7px.gif" width="8" height="8"></td>
    <td width="8"><img src="http://zion.sk/obrazky/7px.gif" width="8" height="7"></td>
    <td width="234"><?php readzion("kyberia/skripty/readart14.php");?></td>
    <td width="8"><img src="http://zion.sk/obrazky/7px.gif" width="8" height="7"></td>
    <td width="8"><img src="http://zion.sk/obrazky/7px.gif" width="8" height="7"></td>
<td width="234">
<?php readzion("kyberia/skripty/tlacshow.php");?>
    <br><img src="http://zion.sk/obrazky/kyberia//anchor.gif" border="0">
 <font class="text"><a href="http://zion.sk/tlacovespravy.php?id=tlacall">vsetky správy</a></font><IMG SRC="http://www.naj.sk/cgi-bin/4web/nvhit.pl?id=00010195" WIDTH="1" HEIGHT="1" ALT="" BORDER="0">
</td>
    <td width="8"><img src="http://zion.sk/obrazky/7px.gif" width="8" height="7"></td>
  </tr>
  <tr align="left" valign="top"> 
