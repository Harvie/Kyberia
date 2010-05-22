

<table><form method='post'>
<tr><td>owner::</td><td><input type='text' name='forum_owner'></td></tr>
<tr><td>nazov fora::</td><td><input type='text' name='forum_text'></td></tr>
<tr><td>zorad podla::</td><td><select name='forum_order'>
<option value='id_asc'>id fora vzostupne (najstarsie)</option>
<option value='id_desc'>id fora zostupne (najnovsie)</option>
<option value='last_submission'>najstarsieho casu posledneho prispevku </option>
<option value='last_owner_access'>najstarsieho pristupu ownera do fora</option>
<option value='submission_count_asc'>poctu prispevkov vzostupne </option>
<option value='submission_count_desc'>poctu prispevkov zostupne </option>
</td></tr>
<tr><td valign='top'>kategoria::</td><td valign='top'>
<?php
$set=$kyberia->query("select * from category order by category_tree");
$selectstring="<select name='forum_category'>";
$selectstring.="<option value='all'>vsetky kategorie</option>";
while ($set->next()) {
	$count=substr_count($set->getString('category_tree'),";");
	$selectstring.="<option value='".$set->getString('category_id')."'";
	if ($forum['forum_category']==$set->getString('category_id')) $selectstring.= " selected ";
	$selectstring.= ">";
	if ($count) {
		$selectstring.="|";
		for ($i=0;$i<$count;$i++) $selectstring.="----";
	}
	$selectstring.=$set->getString('category_name')."</option>";
}
$selectstring.="</select>";
echo $selectstring;
?>
</td></tr><td><td colspan='2' align='center'><input type='submit' name='forum_list' value='list'></tr>
</form></table>
<br><br>
<?php

if (!empty($_POST['forum_list'])) {
	$q="select * from forum left join category on forum.forum_category=category.category_id left join user_forum as owner_access on (forum.forum_id=owner_access.forum_id and forum.forum_owner=owner_access.user_id) where 1=1 ";
    if (!empty($_POST['forum_owner'])) {
    	$forum_owner=$_POST['forum_owner'];
        if (!Is_numeric($forum_owner)) {
        	$set=$kyberia->query("select id from user where login='$forum_owner'");
	        $set->next();

            $forum_owner_id=$set->getString('id');
        }
        else $forum_owner_id=$forum_owner;
        $q.=" and forum_owner='$forum_owner_id' ";
   	}

    if (!empty($_POST['forum_text'])) {
        $q.=" and forum_name like '%".$_POST['forum_text']."%' ";
   	}

    if ($_POST['forum_category']!='all') {
        $forum_category=$_POST['forum_category'].";";
        $q.="and category_tree like '$forum_category' ";
    }

   $forum_order=$_POST['forum_order'];
    if ($forum_order=="id_desc") {
    	$q.="order by forum.forum_id desc";
    }
   	if ($forum_order=="id_asc") {
    	$q.="order by forum.forum_id asc";
    }
   	if ($forum_order=="last_owner_access") {
    	$q.="order by owner_access.last_visit asc";
    }

   	if ($forum_order=="last_submission") {
    	$q.="order by last_submission asc";
    }
   	if ($forum_order=="submission_count_asc") {
    	$q.="order by submission_count asc";
    }
    if ($forum_order=="submission_count_desc") {
    	$q.="order by submission_count desc";
    }
    echo $q;
    $set=$kyberia->query($q);

    while($set->next()) {
    	echo "forum::".$set->getString('forum_name')."<br>";
        echo "owner::".$set->getString('forum_owner')."<br>";
        echo "pocet prispevkov::".$set->getString('forum_submissions')."<Br>";
        echo "posledny prispevok::".$set->getString('last_submission')."<br>";
        echo "ownerova posledna navsteva fora::".$set->getString('owner_access.last_visit')."<br>";

    	echo "<br><br>";
    }

}

?>