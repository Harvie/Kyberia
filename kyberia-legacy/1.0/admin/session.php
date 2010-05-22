<html><head><title>session</title>

</head>
<body>
<?
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/:/home/hromi1/kyberia/config");
//ini_set("include_path","/var/users/stab/kyberia/inc:/var/users/stab/kyberia/boxiky/:/var/users/stab/kyberia/config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
$set=$database->executeQuery("select user_name, user_action, user_action_id,
user_action_name from session where user_id = '".$user_id."'");

echo "<table border=1>";
echo
"<tr><td>user_name</td><td>user_action</td><td>user_action_id</td><td>user_action_name</td></tr>";
while ($set->next()) {
	echo
"<tr><td>".$set->getString('user_name')."</td><td>".$set->getString('user_action')."</td><td>".$set->getString('user_action_id')."</td><td>".$set->getString('user_action_name')."</td></tr>";
}

echo "</table>";
	
?>
</body></html>