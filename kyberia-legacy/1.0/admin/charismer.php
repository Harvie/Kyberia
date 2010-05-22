<?
echo "updating...";

ini_set("include_path","../inc:../boxiky/:../config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();

// that's all folks
$q4="update user set user_k='3'";
$database->query($q4);

/* inicializacia, uz netreba
$database->query("UPDATE k_logs SET k_amount=sign(k_amount)");

$database->query("UPDATE submissions SET submission_k=0");
$database->query("UPDATE dennik SET karma=0");
$r = $database->query("SELECT * FROM k_logs");
while($r->next()) {
	if ($r->getString("node_type") == 'dennik')
		$database->query("UPDATE dennik SET karma=karma+".$r->getString("k_amount")." WHERE id=".$r->getString('node_id'));
	else
		$database->query("UPDATE submissions SET submission_k=submission_k+".$r->getString("k_amount")." WHERE submission_id=".$r->getString('node_id'));
}
*/
?>


