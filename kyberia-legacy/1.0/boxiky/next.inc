<?php
if (IsSet($user)) $cislo=5;
else $cislo=9;
$posun=$cislo+1;
global $offset;
global $clanky;
echo "<table width=100%><tr>";
if ($offset) echo "<td align=left><a href=$PHP_SELF","?offset=",$offset-$posun,$katlink,">
<-- Predchadzajuce clanky</a></td>";
if ($clanky->_numRows>$cislo) echo "<td align=right>
<a href=$PHP_SELF","?offset=",$offset+$posun,$katlink," >Dalsie clanky --></a></td>";
echo "</tr></table><br>";
?>