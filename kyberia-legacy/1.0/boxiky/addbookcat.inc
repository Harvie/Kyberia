<?
include_once("./inc/kyberia.inc");
global $user_id;
$bookcatname=$_POST['bookcatname'];
$bparent_id=$_POST['bparent_id'];
if ($bookcatname){$kyberia->query("INSERT INTO user_bookcat set user_id='$user_id', bookcat_name='$bookcatname',parent_id='$bparent_id', is_open='yes'");}
$editcat2=$bparent_id;
?>