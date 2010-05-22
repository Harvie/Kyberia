<select style='width: 80px;' name='user_status' onChange="window.location.href=this.options[this.selectedIndex].value" >
<?php
$args="&action=".$_GET['action'];
if ($_GET['node_id']) $args.="&node_id=".$_GET['node_id']; 

$statuslist[]="normal";
$statuslist[]="depresia";
$statuslist[]="stastie";
$statuslist[]="LASKA";
$statuslist[]="vykaleny";
$statuslist[]="nasrany";
//$statuslist[]="invisible";
foreach ($statuslist as $option) {
	echo "<option value='".SCRIPT."?get_event=switchstatus&user_status=$option$args' ";
	if ($option=="$user_status") echo "selected";
	echo ">$option</option>";
}
?>
</select>
