<?php
include_once("./inc/kyberia.inc");
global $user_id;
include("book_func.inc");
global $kyberia;
if (!$editcat2) {
	$editcat=$_GET['editcat'];
	if (!$editcat){$editcat='0';}
}
else {$editcat=$editcat2;}
$delete=$_GET['delete'];
$movecat=$_GET['movecat'];
$upcat=$_GET['upcat'];
//toto sa vykonava iba ked niekto posuva kategoriu
if (($movecat) and ($upcat)){
	$q11="update user_bookcat set bookcat_id='0' where (user_id='$user_id' and bookcat_id='$upcat')";
	$q12="update user_bookcat set parent_id='-1' where (user_id='$user_id' and parent_id='$upcat')";
	$q13="update user_forum set parent_id='-1' where (user_id='$user_id' and parent_id='$upcat')";
	$q21="update user_bookcat set bookcat_id='$upcat' where (user_id='$user_id' and bookcat_id='$movecat')";
	$q22="update user_bookcat set parent_id='$upcat' where (user_id='$user_id' and parent_id='$movecat')";
	$q23="update user_forum set parent_id='$upcat' where (user_id='$user_id' and parent_id='$movecat')";
	$q31="update user_bookcat set bookcat_id='$movecat' where (user_id='$user_id' and bookcat_id='0')";
	$q32="update user_bookcat set parent_id='$movecat' where (user_id='$user_id' and parent_id='-1')";
	$q33="update user_forum set parent_id='$movecat' where (user_id='$user_id' and parent_id='-1')";
	$kyberia->query($q11);
	$kyberia->query($q12);
	$kyberia->query($q13);
	$kyberia->query($q21);
	$kyberia->query($q22);
	$kyberia->query($q23);
	$kyberia->query($q31);
	$kyberia->query($q32);
	$kyberia->query($q33);
	if ($editcat==$movecat){$editcat=$upcat;}
	elseif ($editcat==$upcat){$editcat=$movecat;}
}

readbookdb();
if ($delete){
	bookcatdel($delete);
	unset ($bookcat_name);
	unset ($bookcat_open);
	unset ($bookcat_parent);
	unset ($bookcat_id);
	unset ($f_id);
	unset ($f_name);
	unset ($f_login);
	unset ($f_sub);
	unset ($f_subc);
	unset ($f_parent);
	unset ($f_owner);
	readbookdb();
}

$bookcat_name['-1']="ROOT";
//if ($editcat=='0')	{echo "<br><b><font size='+1'>ROOT CATEGORY</font></b> ".$bookcat_subc['-1'];}
//else {echo "<br><br><b><font size='+1'>".$bookcat_name[prevod($editcat)]."</font></b>";}
//if ($editcat!='0')	{echo " &nbsp;&nbsp;::&nbsp;<a href='?action=b00kedit&editcat=".$bookcat_parent[prevod($editcat)]."'><b>UP</b>(".$bookcat_name[prevod($bookcat_parent[prevod($editcat)])].")</a>";}
echo "<form method='post' enctype='multipart/form-data' action='/'>";
echo "<input type='hidden' name='bparent_id' value='$editcat'>";
if ($editcat=='0'){
echo "Nova kategoria:<input class='bigtextinput' type='text' name='bookcatname'>";
echo "<input type='submit' value='pridaj.b00kcat' name='action' class='bigtextinput'>";
}

listbookcat3('0',$editcat);
echo "</form><br><br>";
echo "<br><bR><br><br>Kluby v aktivnej kategorii:<br>";
echo "<form method='post' enctype='multipart/form-data' action='/'>";
echo "<blockquote>";
listbookforum1($editcat);
echo "</blockquote>";
echo "<br><bR><br><br>Kluby v inych kategoriach:<br>";

echo "<blockquote>";
if ($editcat!='0'){listbookforum('0');}
for($i=0;$i<=count($bookcat_id);$i++){
	if ($i!=prevod($editcat)){
		listbookforum($bookcat_id[$i]);
	}
}
echo "</blockquote>";
echo "<input type='hidden' name='parent_id' value='$editcat'>";
echo "Oznacene presun do aktivnej kategorie <input type='submit' value='movebook' name='action' class='bigtextinput'>";
echo "</form><br><br>";


?>