<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
<table><tr><td width='125' valign='top'></td><td width='600'
valign='top'>
<table class='box'><tr><td><font color='red'><center><b>Pozor, ziadas o
vstup do autonomnej zony!</b></font></center><br><br>Kyberia je komunita
ludi ktori mozu byt roztruseni po celom svete a predsa vedia ze su sucastou
toho isteho naroda. Nie naroda Cechov alebo Slovakov, ale naroda bytosti,
ktore chcu byt stastne a slobodne, s vysokou mierou respektu voci ostatnym a
hladom po novych zazitkoch a informaciach.  </td></tr></table>
<BR><BR><table>
<tr><td colspan=4 align=center><font color=white><b>Ak si myslis ze si
schopny rozhodnut sam za seba co je dobre a co zle a mas zaujem o vstup do
nasej zony, <font class=most_important>pokus sa do zeleneho ramceka co najuprimenejsie
napisat kto si, co od hysterie-kyberie ocakavas, co je zmyslom tvojho zivota
a zivota ako takeho  a snad ti niekedy v buducnosti prijde od
protektorov syndikatu h-k oboznamenie o tom ze si bol
zaregistrovany.</font></b><BR></td></tr>
<tr><td colspan=4>
<textarea rows='5' name='user_info'>{$smarty.post.user_info}</textarea><br><br></td></tr>
<tr><td colspan=4 align=center>
<br>A este zopar oficialit<br>
</td></tr>
<tr><td>login:</td><td><input type='text' name='login'
value='{$smarty.post.login}'><td colspan='2'></td>
<tr>
<td>email:</td><td><input value='{$smarty.post.email}' name=email type=text></td>
<td>icq:</td><td><input value='{$smarty.post.user_icq}' name='user_icq' type=text></td>
</tr>
<tr>
<td>www:</td><td><input value='{$smarty.post.user_www}' name='user_www' type=text></td>
<td>reklama?</td><td>
ano<input class='checkbox' type='radio' name='user_ad' value='yes' >
nie<input type='radio' class='checkbox' name='user_ad' value='no' >
</td>
</tr>
<tr>
<td>heslo:</td><td><input name='password1' type='password'></td>
<td>zopakuj heslo:</td><td><input name='password2' type='password'></td>
</tr>
<tr><td colspan='4' align='center'><br><br><i>A este jedna lahodka pre prudicov typu cinny organ alebo puritansky rodic.V pripade ze stlacis tlacitko "register" stavas sa automaticky <b>SPOLUZODPOVEDNYM ZA VSETKY PRISPEVKY</b> ktore boli a budu ulozene v databazi kyberie. Bez vynimky.</i>
<tr>
<td align='center' colspan='4'><input type='hidden' name='action' value='register'><input type='submit' value="register" name='event'></td></tr>
</table></td></tr></table>
{include file="modules/footer.tpl"}