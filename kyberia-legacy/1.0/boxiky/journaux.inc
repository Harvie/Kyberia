<?php

if ($_POST['k_amount']) {
	if (!is_numeric($k_amount)) {
		$error = "karma je ciselna";
	} else {
	
	if ($k_amount<-1) {
		$error="ale rydaj sa PREC tam kam siel hitler a diablov MEC ti odrazi hlavu ;) ale fakt nevymyslaj bravcoviny karle, oko bez viecka vidi vsecko ;)";
	} elseif ($k_amount > 1) {
		$error = "mozes dat maximalne 1K";
	} else {
	
	$q="select sum(k_amount) as amount from k_logs where donor_id='$user_id' and node_id='$_GET[node_id]' and node_type='dennik'";
	$set=$kyberia->query($q);
	$set->next();
	$amount=$set->getInt('amount');

	if (abs($amount)>=1) {
		$error="tomuto prispevku uz si pridelil maximalny mozny pocet 1 K!";
	} else {
	
	$set2=$kyberia->query("SELECT autor FROM dennik WHERE id='$node_id'");
	$set2->next();
	$acceptor_id=$set2->getString('autor');
	
	if ($acceptor_id == $user_id) {
		$error="egotrip?";
	} else {

	$set3=$kyberia->query("select user_k from user where id='$user_id'");
	$set3->next();
	if ($set3->getInt('user_k') < abs($k_amount)) {
		$error="bohuzial dnes uz ti zostava ".$set3->getString('user_k')." K. zadel menej alebo pockaj do polnoci";
	} else {
 
	$kyberia->query("update user set user_k=user_k-".abs($k_amount)." where id='$user_id'");
	$kyberia->query("update user set user_karma=user_karma+$k_amount where id='$acceptor_id'");
	$kyberia->query("update dennik set karma=karma+$k_amount where id='$node_id'");
	$kyberia->query("insert into k_logs set donor_id='$user_id',acceptor_id='$acceptor_id',k_amount='$k_amount',node_id='$node_id',node_type='dennik'");
}}}}}

	if ($error)
		echo "<center><font color=red><b>$error</b></font></center><p>";
	else {
	//	header("Location: $_SERVER[REQUEST_URI]");
	//	exit();
	}
}

if ($delete) {
	$set = $kyberia->getDennik($delete);
	$set->next();
	
	if ($user_id != $set->getInt('autor'))
		die('wo co go??');
	
	$diskusiaID = $set->getInt('id_diskuse');
	$kyberia->update("delete from prispevky where id_diskuse='$diskusiaID'");
	$kyberia->update("delete from diskuse where id_diskuse='$diskusiaID'");
	$kyberia->update("delete from dennik where id='$delete'");
	
	header("Location: ".SCRIPT."?action=journaux");
	exit();
}

	


function showJournaux() {
	global $kyberia;
	global $set;
	global $user_id;
	global $node_id;
	echo "<table><tr><td>";
	echo "<b><font color=white> ",$set->getString("nadpis"),"</font> ( <a href='".SCRIPT."?action=journaux&dennik_user=",$set->getString("autor"),"'>",$set->getString("autorname"),"</a> )</b> ".$set->getString('cas');

	if ($set->getInt('autor') == $user_id) {
		echo "<br><b><a href=\"".SCRIPT,"?action=journaux&delete=$node_id\" onClick=\"return confirm('Zmazat tento dennik??')\">zmazat</a></b>";
	}
	$karma = $set->getInt('karma');
	if ($karma) {
		echo "<br><font color=red>{$karma}K</font>";
	}
	echo "<br><br>";
	
	echo $set->getString("zapis");
	echo "<br><br>";
	
	$set2=$kyberia->query("select user_k from user where id='$user_id'");
	$set2->next();
	$kamount="Este mas ".$set2->getString('user_k')." K.";
	echo "<form action=\"\" method=\"post\">$kamount <input type=\"text\" name=\"k_amount\" size=\"5\"> <input type=\"submit\" value=\"K!\"></form>";
	

		$dd=new DiskuseDesign();

		if ($set->getString("id_diskuse")==0) {
			$discussion_id=$dd->createDiskuse();
			$kyberia->createDennikDiskuse($set->getString("id"),$discussion_id);
			$dd->printDiskuse($discussion_id);
		}
		else {
		
			$discussion_id=$set->getString('id_diskuse');
			$dd->printDiskuse($discussion_id);
						
		}
	$q="SELECT user_id from user_discussion where user_id='$user_id' and discussion_id='$discussion_id'";
	$discset=$kyberia->query($q);
	if ($discset->getNumRows()) {
		$q="UPDATE user_discussion set submission_count=0,last_visit=NOW() where discussion_id='$discussion_id' and user_id='$user_id'";
		$rows=$kyberia->update($q);
	}
	else $kyberia->query("INSERT INTO user_discussion set submission_count=0,discussion_id='$discussion_id',user_id='$user_id',last_visit=NOW()");
	echo "</td></tr></table>";
}	



$posun=23;
if (!IsSet($offset)) $offset=0;
$dd=new DiskuseDesign();
$string = new String();

if ($user_id) echo "<center><b><a href='index.php?action=dennikadd'>novy dennik</a>";
// karmu ukazovat iba v zozname a registrovanym userom (ok, som lenivy to robit pre neregistrovanych)
if (!isset($node_id) && $user_id)
	echo " | <a href='index.php?action={$_GET[action]}&karmalast=1&dennik_user=$dennik_user'>posledne karmove</a> | <a
href='index.php?action={$_GET[action]}&karmatop=1&dennik_user=$dennik_user'>top karma</a>";
echo "</b></center><br><br>";


if (is_numeric($node_id)) {
	$set=$kyberia->getDennik($node_id);
	$set->next();

	echo "<br><table class=box width='100%'>";
	echo "<tr><td>";
	if (($set->getString('type')=='kyberia' or $set->getString('private')) and !$user_id) {
		echo "<br><br><center><font color='red'><b>Nemate opravnenie na prezeranie tohto denniku.</font></b></center>";
	}
	
	elseif (($set->getString('type')=='private') and ($user_id!=$set->getString('autor'))) {
		$q="select * from node_access where user_id='$user_id' and node_id='$node_id' and access_type='access'";
		$controlset=$kyberia->query("select * from node_access where user_id='$user_id' and node_id='$node_id' and access_type='access' and node_type='journaux'");
		if ($controlset->getNumRows()) {
			showJournaux();
		}
		else {
			echo "<br><br><center><font color='red'><b>Tento dennik je sukromny, nemas opravnenie na jeho prezeranie.</font></b></center>";		
		}
	}
	
	else {
		showJournaux();
		echo "</table>";
	}
	
	return;
}

elseif (is_numeric($dennik_user)) {
	$offset=$_GET['offset'];
	if ($offset==NULL) $offset=0;
	$q="SELECT DATE_FORMAT(dennik.datum,'%k:%i:%s %e.%c.%Y') as cas ,user_discussion.submission_count as new,dennik.id as id,dennik.nadpis as nadpis,dennik.hits,dennik.prispevky,dennik.*,user.login as autorname from dennik left join user on dennik.autor=user.id left join user_discussion on (user_discussion.discussion_id=dennik.id_diskuse and user_discussion.user_id='$user_id')";
	$q.=" where dennik.autor='$dennik_user' ";
	if ($_GET['karmatop'])
		$q .= " AND karma != 0 ORDER BY dennik.karma DESC LIMIT $offset, 23";
	elseif ($_GET['karmalast'])
		$q .= " AND karma != 0 ORDER BY datum DESC LIMIT $offset, 23";
	else
		$q .= " order by dennik.id  desc limit $offset,23 ";
	if ($user_id) $set=$kyberia->query($q);
	else
		$set=$kyberia->query("SELECT dennik.id as id,dennik.nadpis as nadpis,dennik.hits,dennik.prispevky,dennik.*,user.login as autorname from dennik left join user on dennik.autor=user.id  where dennik.autor='$dennik_user' order by dennik.id  desc limit $offset,23");
}
else {
	$offset=$_GET['offset'];
	if ($offset==NULL) $offset=0;
	$q="SELECT DATE_FORMAT(dennik.datum,'%k:%i:%s %e.%c.%Y') as cas ,user_discussion.submission_count as new,dennik.id as id,dennik.nadpis as nadpis,dennik.hits,dennik.prispevky,dennik.*,user.login as autorname from dennik left join user on dennik.autor=user.id left join user_discussion on (user_discussion.discussion_id=dennik.id_diskuse and user_discussion.user_id='$user_id')";
	if ($_GET['karmatop'])
		$q .= " WHERE dennik.karma <> 0 ORDER BY dennik.karma DESC LIMIT $offset,23";
	elseif ($_GET['karmalast'])
		$q .= " WHERE dennik.karma <> 0 ORDER BY datum DESC LIMIT $offset, 23";
	else
		$q.=" order by dennik.id  desc limit $offset,23 ";
	if ($user_id) $set=$kyberia->query($q);
	else $set=$kyberia->query("SELECT dennik.id as id,dennik.nadpis as nadpis,dennik.hits,dennik.prispevky,dennik.*,user.login as autorname from dennik left join user on dennik.autor=user.id  order by dennik.id  desc limit $offset,23");
	
}

// vypis zoznam
while($set->next()) {
                echo "<table class=box width='100%'>";
                echo "<tr><td><img src='/images/users/".strtolower($set->getString('autorname')).".gif' border='0' align='left'>";
                echo "<b><font color=white> ",$set->getString("nadpis"),"</font> ( <a href='".SCRIPT."?action=journaux&dennik_user=",$set->getString("autor"),"'>",$set->getString("autorname"),"</a> )</b> ".$set->getString('cas');
                echo "--->";
                echo "<a href='".SCRIPT."?action=journaux&node_id=",$set->getString("id"),"'>",$set->getString("hits")," hits --> ";
                echo "<a href='".SCRIPT."?action=journaux&node_id=",$set->getString("id"),"'>",$set->getString("prispevky")," prispevok</a>";
                $karma = $set->getInt('karma');
		if ($karma) {
			echo "<br><font color=red>{$karma}K</font>";
		}
                echo "<br><Br>";

                if(($set->getString('type')=='private') and ($user_id!=$set->getString('autor'))) echo "<br><br><center><font color='red'><b>Tento dennik je sukromny, nemas opravnenie na jeho prezeranie.</font></b></center>";
		else echo $string->cutString($set->getString("zapis"),423);
                echo "<div align=right><a href='".SCRIPT."?action=journaux&node_id=",$set->getString("id"),"'>Viac...</div>";
                echo "</td></tr></table><br>";
	}

// strankovanie	
$url1 = isset($dennik_user) ? "&dennik_user=$dennik_user" : "";
$url1 .= $_GET['karmatop'] ? "&karmatop={$_GET[karmatop]}" : "";
$url1 .= $_GET['karmalast'] ? "&karmalast={$_GET[karmalast]}" : "";
echo "<table width=100%><tr>";
	if ($offset) echo "<td align=left><a href=$PHP_SELF","?action=journaux&offset=",$offset-$posun,$katlink,"$url1><-- Predchadzajuce denniky</a></td>";
	if ($set->_numRows>$cislo) echo "<td align=right><a href='".SCRIPT."?action=journaux&offset=",$offset+$posun,$katlink,"$url1' >Dalsie denniky --></a></td>";
	echo "</tr></table><br>";	
?>



