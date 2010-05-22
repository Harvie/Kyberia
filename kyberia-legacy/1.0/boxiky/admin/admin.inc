<b>nuz clovece ako vidis, tak si bol vybrany za jedneho z administratorov systemu kyberia. ideme sa tu zahrat taku hru na kyberneticku republiku, ustavu,
referenda, pravo veta a tak...more info coming soon</b>
<br><Br>
<?php
if (!ADMIN) {
	echo "hele wole nejsi admin, toto je prudko elitarska zalezitost takze sbohem";
	die();
}

$set=$kyberia->executeQuery("select admin.*,(admin.action_timestamp + INTERVAL 1 DAY) as action_timestamp ,user.login as login from admin left join user on user.id=admin.admin_id order by action_id desc");
echo "<table border='1' class='box'>";
echo "<tr><th>ID ziadosti<th>ziadatel</th><th>typ</th><th>docasny stav</th><th>vykona sa</th><th>data 1</th><th>data 2</th><th>future";
while ($set->next()) {
	echo "<Tr>";
	echo "<td>".$set->getString('action_id');
	echo "<td>".$set->getString('login');
	echo "<td>".$set->getString('action_name');
	echo "<td>".$set->getString('action_result');
	echo "<td>".$set->getString('action_timestamp');
	echo "<td>".$set->getString('action_data_1');
	echo "<td>".$set->getString('action_data_2');
	echo "<td><form action='".SCRIPT."?action=admin'><input type='hidden' name='action_id' value='".$set->getString('id')."'><input type='submit' value='VETO!' name='event'></form>";
}
echo "</table>";

?>
