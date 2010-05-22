<?php
include_once("./inc/kyberia.inc");
global $user_id;
global $kyberia;
$editcat2=$_POST['parent_id'];
if (!$editcat2){$editcat2='0';}
//$move=$_post['move'];
if ($move){
	$q=("update user_forum set parent_id='$editcat2' where");
	for($i=0;$i<count($move);$i++){
		if($i=='0') {$q.=" (forum_id='".$move[$i]."' and user_id='$user_id')";
		}else{$q.=" or (forum_id='".$move[$i]."' and user_id='$user_id')";}
//		echo $q."<br>\n";
	}
	$kyberia->query($q);
}
global $user_id;
?>