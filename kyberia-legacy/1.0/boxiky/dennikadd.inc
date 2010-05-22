<br><br><form action='<?=SCRIPT?>?action=journaux' method=post>
<table><tr>
<td>nadpis:</td><td><input type='text' name='dennik_title'></td></tr>
<!--<tr><td>obrazok:</td><td><input name='icon' class='file' type='file'><font color='red'>&nbsp;&nbsp;*</font></td>-->
<tr><td valign=top>text:</td><Td><textarea name='dennik_text' rows=23 cols=64></textarea></td></tr>
<tr><td valign='middle' align=center>typ:</td><td valign='middle'><table><tr><td><input class='checkbox' type='radio'
checked name='type' value='public'></td><td>&nbsp;verejny</td><td><input value='kyberia' type='radio' class='checkbox' name='type'></td><td>&nbsp;kyberia users only</td><td><input type='radio' name='type' class='checkbox' value='private'></td><td>&nbsp;sukromny</td></tr></table>
<tr><td>user access:</td><td><input class='longtext' type='text' name='journaux_access'><font color='red'>*</font></td></tr>
<tr><td colspan=2 align=center><input type=submit name='event' value='pridaj dennik'></td></tr>
</table>
</form>

<font color='red'>* pouzivajte iba v pripade ze ste dennik nastavili ako sukromny, mena oddelujte bodkociarkou</font> 