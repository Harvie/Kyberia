<?php
$set=$kyberia->query("select * from category order by category_tree");
$selectstring="<select name='forum_category'>";
while ($set->next()) {
	$count=substr_count($set->getString('category_tree'),";");
	$selectstring.="<option value='".$set->getString('category_id')."'>";
	if ($count) {
		$selectstring.="|";
		for ($i=0;$i<$count;$i++) $selectstring.="----";
	}
	$selectstring.=$set->getString('category_name')."</option>";
}
$selectstring.="</select>";
	
$set=$kyberia->query("select user.login as login,forum.forum_name,forum_info.* from forum_info left join forum on forum_info.forum_id=forum.forum_id left join user on user.id=forum.forum_owner where forum_info.forum_id>500 order by forum_id");

echo "<table>";
while ($set->next()) {
	echo "<form action='".SCRIPT."?action=admin' method='post'>";
	echo "<tr>";
	echo "<td valign='top'><input type='text' name='forum_id' value='",$set->getString('forum_id'),"'></td>";
	echo "<td valign='top'><input class='longtext' type='text' name='forum_name' value='",$set->getString('forum_name'),"'></td>";

	echo "<td valign='top'><input type='text' name='forum_owner' value='",$set->getString('login'),"'></td>";
	echo "<td valign='top'>",strip_tags($set->getString('forum_info')),"'></td>";
	echo "<td>",$set->getString('forum_submissions'),"</td>";
	echo "<td>";
//	if ($set->getString('forum_category')=='' )echo "$selectstring";
	echo "</td>"; 
	echo "<td><input type='submit' name='event' value='update forum'><input type='hidden' name='forum_id' value='".$set->getString('forum_id')."'>";
	echo "</tr>";
	echo "</form>";
}

echo "</table>";
?>
