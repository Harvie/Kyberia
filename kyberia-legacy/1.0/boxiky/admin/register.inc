 <?php
global $kyberia;

echo "<table  border=1><tr><td>login</td><td>web</td><td>info</td><td>change status</td></tr>";
$q="select * from user where user_active='' or user_active='no' order by id desc";
$set=$kyberia->query($q);
while($set->next()) {
echo "<tr><Td><a href='mailto:".$set->getString('email')."'>".$set->getString('login')."</a></td>
<td>".$set->getString('user_www')."</td><td width='230'>".$set->getString('user_info')."</td>
<td><form action='".SCRIPT."?action=admin' method='post'><input type=hidden name='id' value='".$set->getString('id')."'>
<textarea name='message' rows=6 cols=10 style='width: 100pt;'></textarea><br>
<input type=hidden name='email' value='".$set->getString('email')."'>
<input type='hidden' name='login' value='".$set->getString('login')."'>
<input type='hidden' name='user_info' value='".$set->getString('user_info')."'>
<input type='hidden' name='action_parameter' value='".$set->getString('id')."'>
<select name='action_result'><option value='accept'>accept</option><option value='refuse'>refuse</option><option value='delete'>delete</option></select>
<input type='submit' value='register' name='event'>
</form></tr>";
}

echo "</table>";
	
?>
