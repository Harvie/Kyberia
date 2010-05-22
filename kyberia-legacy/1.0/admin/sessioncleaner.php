<?
include_once("../inc/kyberia.inc");
$database=new CLASS_KYBERIA();
$q="select id_user from sessions where last<date_sub(NOW(),INTERVAL 1 HOUR)";
echo $q;
$set=$database->query($q);
while($set->next()) {
	$q="update user set user_action='',user_mode='off',user_action_param_name='',user_action_param_id='',user_action_param_value='' where id='".$set->getString('id_user')."'";
	echo $q;
	$database->query($q);
	$database->query("delete from sessions where id_user='".$set->getString('id_user')."'");
}
?>
