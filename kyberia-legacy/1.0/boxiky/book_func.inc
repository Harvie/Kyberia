<?php
function listbookforum($parid){
	global $user_id;
	global $bookcat_name;
	global $f_id;
	global $f_name;
	global $f_sub;
	global $f_subc;
	global $f_parent;
	global $f_owner;
	for($j=0;$j<count($f_id);$j++){
		if ($f_parent[$j]==$parid){
			echo "\n<br><input size='0' style='border : 0;width : 10;height : 10;' type='checkbox' name='move[]' value='".$f_id[$j]."'>&nbsp;&nbsp;<a href='?action=forum&node_id=",$f_id[$j],"'>",$f_name[$j],"</a>";
			if ($f_subc[$j])  echo "- <font color='red'>".$f_subc[$j]." NEW</font>";
			echo "&nbsp;&nbsp;&nbsp;(".$bookcat_name[prevod($parid)].")";
			if ($f_owner[$j]!=$user_id) {echo "<a href='?action=b00kmarkz&book=1&node_id=",$f_id[$j],"' onClick=\"return confirm('Chces si unbooknut tento klub?')\"> :: unbook</a>";}
		}
	}
	if ($j>0){echo "<br>";}
}
function listbookforum1($parid){
	global $user_id;
	global $bookcat_name;
	global $bookcat_open;
	global $bookcat_parent;
	global $bookcat_id;
	global $f_id;
	global $f_name;
	global $f_login;
	global $f_sub;
	global $f_subc;
	global $f_parent;
	global $f_owner;
	for($j=0;$j<count($f_id);$j++){
		if ($f_parent[$j]==$parid){
			echo "\n<br>&nbsp;&nbsp;<a href='?action=forum&node_id=",$f_id[$j],"'>",$f_name[$j],"</a>";
			if ($f_subc[$j])  echo "- <font color='red'>".$f_subc[$j]." NEW</font>";
			echo "&nbsp;&nbsp;&nbsp;(".$bookcat_name[prevod($parid)].")";
			if ($f_owner[$j]!=$user_id) {echo "<a href='?action=b00kmarkz&book=1&node_id=",$f_id[$j],"' onClick=\"return confirm('Chces si unbooknut tento klub?')\"> :: unbook</a>";}
		}
	}
}


//old for edit
function listbookcat($catid){
	global $bookcat_name;
	global $bookcat_open;
	global $bookcat_parent;
	global $bookcat_id;
	for($i=0;$i<=count($bookcat_id);$i++){
		if ($bookcat_parent[$i]==$catid){
			echo "\n<a href='?action=b00kedit&editcat=".$bookcat_id[$i]."'>- ".$bookcat_name[$i]."</a>";
			if (isSet($lasti)){
				echo "&nbsp;&nbsp;<a href='?action=b00kedit&editcat=". $bookcat_parent[prevod($i)] ."&movecat=". $bookcat_id[$i] ."&upcat=". $bookcat_id[$lasti] ."'>^UP^</a>";
			}
			echo "<br>";
			$lasti=$i;
		}
	}
}
//new for edit
function listbookcat3($catid,$edc){
	global $bookcat_name;
	global $bookcat_open;
	global $bookcat_parent;
	global $bookcat_id;
	global $bookcat_subc;
	for($i=0;$i<=count($bookcat_id);$i++){
		if (($bookcat_parent[$i]==$catid)){
			echo "<table border='0'><tr><td width='15'>&nbsp;</td><td>";
			if ($edc==$bookcat_id[$i]){
				echo "\n<b>- ".$bookcat_name[$i]."</b>";
			}else{
				echo "\n<a href='?action=b00kedit&editcat=".$bookcat_id[$i]."'><b>- ".$bookcat_name[$i]."</b></a>";
			}
			if (isSet($lasti)){
				echo "&nbsp;&nbsp;<a href='?action=b00kedit&editcat=". $edc ."&movecat=". $bookcat_id[$i] ."&upcat=". $bookcat_id[$lasti] ."'>^UP^</a>";
			}
			echo "&nbsp;&nbsp;::&nbsp;&nbsp;<a href='?action=b00kedit&delete=".$bookcat_id[$i]."'>delete</a>";
//			echo "<br>";
			if(($edc!='0')&&($bookcat_id[$i]==$edc)){
				echo "&nbsp;&nbsp;::&nbsp;&nbsp;<input class='bigtextinput' type='text' name='bookcatname'>";
				echo "<input type='submit' value='pridaj.b00kcat' name='action' class='bigtextinput'>";
			}
			listbookcat3($bookcat_id[$i],$edc);
			echo "</td></tr></table>";
			$lasti=$i;
		}
	}
}


function listbookforum2($parid){
	global $user_id;
	global $f_id;
	global $f_name;
	global $f_login;
	global $f_sub;
	global $f_subc;
	global $f_parent;
	global $f_owner;
	for($j=0;$j<count($f_id);$j++){
		if ($f_parent[$j]==$parid){
			echo "\n<br>&nbsp;&nbsp;<a href='?action=forum&node_id=",$f_id[$j],"'>",$f_name[$j],"</a> (".$f_sub[$j]."&nbsp;subz ";
			if ($f_subc[$j])  echo "- <font color='red'>".$f_subc[$j]." NEW</font>";
			echo ")";
			if ($f_owner[$j]!=$user_id) {echo "<a href='?action=b00kmarkz&book=1&node_id=",$f_id[$j],"'  onClick=\"return confirm('Chces si unbooknut tento klub?')\"> :: unbook</a>";}
//			echo "<a href='?action=b00kmarkz&book=1&node_id=",$f_id[$j],"' onClick=\"return confirm('Chces si unbooknut tento klub?')\"> :: unbook</a>";
		}
	}
}


function listbookcat2($catid){
	global $bookcat_name;
	global $bookcat_open;
	global $bookcat_parent;
	global $bookcat_id;
	global $bookcat_subc;
	for($i=0;$i<=count($bookcat_id);$i++){
		if (($bookcat_parent[$i]==$catid)){
			echo "<blockquote>";
			if ($bookcat_open[$i]=="no") {echo "\n<a href='?action=b00kmarkz&openswich=".$bookcat_id[$i]."&swichto=yes'><b>- ".$bookcat_name[$i]."@";}
			if ($bookcat_open[$i]=="yes") {echo "\n<a href='?action=b00kmarkz&openswich=".$bookcat_id[$i]."&swichto=no'><b>- ".$bookcat_name[$i]."^";}
			if (($bookcat_subc[$i]>'0') and ($bookcat_open[$i]=="no")){echo "(<font color='red'>".$bookcat_subc[$i]." NEW</font>)";}
			echo "</b></a>";
			if (($bookcat_open[$i]=="yes")){
				listbookforum2($bookcat_id[$i]);
				listbookcat2($bookcat_id[$i]);
			}
			echo "</blockquote>";
		}
	}

}




function bookfmove($del_id){
	global $user_id;
	global $f_id;
	global $f_parent;
	global $qf;
	global $if;
	for($j=0;$j<count($f_id);$j++){
		if ($f_parent[$j]==$del_id){
			if ($if=='0') {$qf.=" (user_id='$user_id' and forum_id='".$f_id[$j]."')";}
			else{$qf.=" or (user_id='$user_id' and forum_id='".$f_id[$j]."')";}
			$if++;
		}
	}
}




function bookcatdel2($del_id){
	global $user_id;
	global $bookcat_parent;
	global $bookcat_id;
	global $qf;
	global $if;
	global $qc;
	for($i=0;$i<=count($bookcat_id);$i++){
		if (($bookcat_parent[$i]==$del_id)){
				$qc.=" or (user_id='$user_id' and bookcat_id='$bookcat_id[$i]')";
				bookfmove($bookcat_id[$i]);
				bookcatdel2($bookcat_id[$i]);
		}
	}
}




function bookcatdel($del_id){
	global $user_id;
	global $bookcat_id;
	global $qf;
	global $if;
	global $qc;
	global $kyberia;
	$qf="update user_forum set parent_id='0' where";
	$if='0';
	$qc="delete from user_bookcat where (user_id='$user_id' and bookcat_id='$del_id')";
	bookfmove($del_id);
	bookcatdel2($del_id);
	$kyberia->query($qc);
	if ($if>'0') {$kyberia->query($qf);}
}



function prevod($id){
global $bookcat_id;
	if ($id=='0'){$id='-1';}
	for($i=0;$i<count($bookcat_id);$i++){
		if (($bookcat_id[$i])==$id){$id=$i; break;}
	}
	return $id;
}



function readbookdb(){
	global $user_id;
	global $bookcat_name;
	global $bookcat_open;
	global $bookcat_parent;
	global $bookcat_id;
	global $f_id;
	global $f_name;
	global $f_login;
	global $f_sub;
	global $f_subc;
	global $f_parent;
	global $f_owner;
	global $kyberia;
	global $bookcat_subc;

	$q="select * from user_bookcat where user_id='".$user_id."' order by bookcat_id";
	$bset=$kyberia->query($q);
	$label='0';
	while ($bset->next()){
		$bookcat_name[$label]=$bset->getString('bookcat_name');
		$bookcat_open[$label]=$bset->getString('is_open');
		$bookcat_parent[$label]=$bset->getString('parent_id');
		$bookcat_id[$label]=$bset->getString('bookcat_id');
		$label++;
	}
	$q="SELECT user_forum.submission_count,user_forum.parent_id as fparent_id,user.login,forum.* from forum left join user on forum.forum_owner=user.id left join user_forum on (forum.forum_id=user_forum.forum_id and user_forum.user_id='$user_id')";
	$q.=" WHERE forum.forum_owner='$user_id'";
	$q.=" order by forum_name ";
	$forumset=$kyberia->query($q);
	$i=0;
	while ($forumset->next()){
		$f_id[$i]=$forumset->getString('forum_id');
		$f_name[$i]=$forumset->getString('forum_name');
		$f_login[$i]=$forumset->getString('login');
		$f_sub[$i]=$forumset->getString('forum_submissions');
		$f_subc[$i]=$forumset->getString('submission_count');
		$f_parent[$i]=$forumset->getString('fparent_id');
		$f_owner[$i]=$forumset->getString('forum_owner');
		$i++;
	}

	$q="SELECT user_forum.submission_count,user_forum.parent_id as fparent_id,user.login,forum.*";
	$q.=" from forum left join user on forum.forum_owner=user.id";
	$q.=" left join user_forum on (forum.forum_id=user_forum.forum_id and user_forum.user_id='$user_id')";
	$q.=" WHERE user_forum.user_bookmark='yes' and forum.forum_owner != '$user_id'";
	$q.=" order by forum_name ";
	$forumset=$kyberia->query($q);
	while ($forumset->next()){
		$f_id[$i]=$forumset->getString('forum_id');
		$f_name[$i]=$forumset->getString('forum_name');
		$f_login[$i]=$forumset->getString('login');
		$f_sub[$i]=$forumset->getString('forum_submissions');
		$f_subc[$i]=$forumset->getString('submission_count');
		$f_parent[$i]=$forumset->getString('fparent_id');
		$f_owner[$i]=$forumset->getString('forum_owner');
		$i++;
	}

	$bookcat_subc['-1']=countnew('0');
}

function countnew($catid){
	global $bookcat_parent;
	global $bookcat_id;
	global $bookcat_subc;
	global $bookcat_name;

	for($i=0;$i<=count($bookcat_id);$i++){
		if (($bookcat_parent[$i]==$catid)){
			$bookcat_subc[prevod($catid)] += countnew($bookcat_id[$i]);
		}
	}
	countnewforum($catid);
	return $bookcat_subc[prevod($catid)];
}
function countnewforum($catid){
	global $user_id;
	global $f_id;
	global $f_subc;
	global $f_parent;
	global $bookcat_subc;
	global $bookcat_name;
	for($j=0;$j<count($f_id);$j++){
		if ($f_parent[$j]==$catid){
			if ($f_subc[$j]) {$bookcat_subc[prevod($catid)]+=$f_subc[$j];}
		}
	}
	return $bookcat_subc[prevod($catid)];
}
?>