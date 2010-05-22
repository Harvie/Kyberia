<?php
if ($user_id) {
	$userset=$kyberia->query("select * from user where id='$user_id'");
	$userset->next();
	$userdata=$userset->getRecord();
}
?>

<br><br>
<center>
<form enctype="multipart/form-data" method=post action='<?=SCRIPT?>?action=personalize'>
<table width=300 class=box>
<tr><td align='center' colspan='2'><font color='white'><b>zmena ikony</b></td></tr>
<tr><td>ikona:</td><td><input name='icon' class='file' type='file'><font color=red>&nbsp;*&nbsp;</td></tr>
<tr><td align='center' colspan='2'><input type='submit' value="zmen ikonu" name=event></td></tr>
<tr><td colspan='2'><font color=red>*&nbsp;Mozete pouzit ikonu vo formate .gif alebo .jpg.Jej velkost bude automaticky zmenena na sirku 50 pixelov.</td>
</tr></table><br><br>
<table width=600 class=box>

<tr><td colspan=4 align=center><font color=white><b>osobne informacie</font></b></td></tr>
<tr>
<td>email:</td><td><input value='<?=$userdata['email']?>' name=email type=text></td>
<td>icq:</td><td><input value='<?=$userdata['user_icq']?>' name='user_icq' type=text></td>
</tr>
<tr>
<td>www:</td><td><input value='<?=$userdata['user_www']?>' name='user_www' type=text></td>
<td>reklama?</td><td>
ano<input class='checkbox' type='radio' name='user_ad' value='yes' <?php if($userdata['user_ad']=='yes') echo 'checked';?>>
nie<input type='radio' class='checkbox' name='user_ad' value='no' <?php if($userdata['user_ad']=='no') echo 'checked';?>>
</td>
</tr>
<tr><td>info:</td><td colspan=3><textarea rows='10' name='user_info'><?=$userdata['user_info']?></textarea></td>
<tr><td align='center' colspan='4'><input type='submit' value="zmen data" name=event></td></tr>
</table><br><br>
<table width=600 class=box>

<tr><td colspan=4 align=center><font color=white><b>systemove nastavenia</font></b></td></tr>
<tr>
<td>zobrazovat ikonky v zozname<br>prihlasenych uzivatelov</td><td><input type="radio" value="yes" name="user_active_icons" <? if ($userdata['user_active_icons'] == 'yes') echo 'checked'; ?>> ano
<input type="radio" value="no" name="user_active_icons" <? if ($userdata['user_active_icons'] == 'no') echo 'checked'?>> nie</td>
</tr>
<tr>
<td>zobrazovat ikonky userov vo forach</td><td><input type="radio" value="yes" name="user_icons_in_forum" <? if ($userdata['user_icons_in_forum'] == 'yes') echo 'checked'; ?>> ano
<input type="radio" value="no" name="user_icons_in_forum" <? if ($userdata['user_icons_in_forum'] == 'no') echo 'checked'?>> nie</td>
</tr>

<tr>
<td>pocet prispevkov:</td><td><input value='<?=$userdata['user_amount']?>' name='user_amount' type=text ></td>
<tr><td>stastny:</td><td><input value='<?=$userdata['user_happy']?>' name='user_happy' type=text class='longtext'></td>
<tr><td>depresia:</td><td><input value='<?=$userdata['user_sad']?>' name='user_sad' type=text class='longtext'></td>
<tr><td>LASKA:</td><td><input value='<?=$userdata['user_love']?>' name='user_love' type=text class='longtext'></td>
<tr><td>vykaleny:</td><td><input value='<?=$userdata['user_drugged']?>' class='longtext' name='user_drugged' type=text></td>
<tr><td>nasrany:</td><td><input value='<?=$userdata['user_agressive']?>' class='longtext' name='user_agressive' type=text></td>
</tr>
<!--
<tr>
<td>www:</td><td><input value='<?=$userdata['user_www']?>' name='user_www' type=text></td>
<td>reklama?</td><td>
ano<input class='checkbox' type='radio' name='user_ad' value='yes' <?php if($userdata['user_ad']=='yes') echo 'checked';?>>
nie<input type='radio' class='checkbox' name='user_ad' value='no' <?php if($userdata['user_ad']=='no') echo 'checked';?>>
</td>
</tr>
<tr><td>info:</td><td colspan=3><textarea rows='10' name='user_info'><?=$userdata['user_info']?></textarea></td>
-->
<tr><td align='center' colspan='4'><input type='submit' value="zmen nastavenie" name=event></td></tr>
</table><br><br>
<table width=600 class=box>
<tr><td colspan=4 align=center><font color=white><b>zmena hesla</font></b></td></tr>

<tr>
<td>stare heslo:</td><td><input name='oldpassword' type='password'></td>
<td colspan=2>&nbsp;</td>
</tr>
<tr>
<td>nove heslo:</td><td><input name='password1' type='password'></td>
<td>zopakuj heslo:</td><td><input name='password2' type='password'></td>
</tr>
<tr>
<td align='center' colspan='4'><input type='submit' value="zmen heslo" name=event></td></tr>
</table>
</center>
</form><br>
<?php
//include_once("friends.inc");
?>