<form action='<? echo SCRIPT; ?>' method='post'>
<table class='box'><tr><td><font color='red'><center><b>Pozor, ziadas o
vstup do autonomnej zony!</b></font></center><br><br>Kyberia je komunita
ludi ktori mozu byt roztruseni po celom svete a predsa vedia ze su sucastou
toho isteho naroda. Nie naroda Cechov alebo Slovakov, ale naroda bytosti,
ktore chcu byt stastne a slobodne, s vysokou mierou respektu voci ostatnym a
hladom po novych zazitkoch a informaciach.  </td></tr></table>
<BR><BR><table>
<tr><td colspan=4 align=center><font color=white><b>Ak si myslis ze si
schopny rozhodnut sam za seba co je dobre a co zle a mas zaujem o vstup do
nasej
zony, <font color=red>pokus sa co najuprimnejsie odpovedat na nasledujucich
par otazok</font> a v priebehu
par hodin ti prijde rozhodnutie Konzilia Kyberie pre Byrokraticky Bullshit
(KKpBB) o tom ci si bol zaregistrovany
alebo nie.</font></b><BR></td></tr>
<tr><td colspan=4>
1. Co vidis na tomto obrazku :<br>
<img src='http://kyberia.sk/images/maxula.jpg'>
<textarea rows='5' name='otazka_1'><?=$_POST['otazka_1']?></textarea><br><br>
</td></tr>
<tr><td colspan=4>
2. Si dusevne zdravy? Preco?<br>
<textarea rows='5' name='otazka_2'><?=$_POST['otazka_2']?></textarea><br><br>
</td></tr>
<tr><td colspan=4>
3. Este stale chces ist dnu? Preco?<br>
<textarea rows='5' name='otazka_3'><?=$_POST['otazka_3']?></textarea><br><br>
</td></tr>
<tr><td colspan=4>
4. Napis nejake info o sebe:<br>
<textarea rows='5' name='user_info'><?=$_POST['user_info']?></textarea><br><br>
</td></tr>
<tr><td colspan=4 align=center>
<br><br>A este zopar oficialit<br><br><br>
</td></tr>
<tr><td>login:</td><td><input type='text' name='login'
value='<?=$_POST['login']?>'><td colspan='2'></td>
<tr>
<td>email:</td><td><input value='<?=$_POST['email']?>' name=email
type=text></td>
<td>icq:</td><td><input value='<?=$_POST['user_icq']?>' name='user_icq'
type=text></td>
</tr>
<tr>
<td>www:</td><td><input value='<?=$_POST['user_www']?>' name='user_www'
type=text></td>
<td>reklama?</td><td>
ano<input class='checkbox' type='radio' name='user_ad' value='yes' <?php
if($_POST['user_ad']=='yes') echo 'checked';?>>
nie<input type='radio' class='checkbox' name='user_ad' value='no' <?php
if($_POST['user_ad']=='no') echo 'checked';?>>
</td>
</tr>
<tr>
<td>heslo:</td><td><input name='password1' type='password'></td>
<td>zopakuj heslo:</td><td><input name='password2' type='password'></td>
</tr>
<tr><td colspan='4' align='center'><i>A este jedna lahodka pre prudicov typu
cinny organ alebo puritansky rodic.V pripade
ze stlacis tlacitko "register" stavas sa automaticky <b>SPOLUZODPOVEDNYM ZA
VSETKY PRISPEVKY</b> ktore boli a budu ulozene v databazi kyberie. Bez
vynimky.</i>
<tr>
<td align='center' colspan='4'><input type='hidden' name='action'
value='register'><input type='submit' value="register"
name='event'></td></tr>
</table>
</form>