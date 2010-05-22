<font color='red'><b>cez vikend bude kyberia.sk vypnuta, bude sa nahadzovat nova verzia a prehadzovat DNS zaznam. dakujem za pochopenie</b></font><br><br>
<?php
if ($category=='change') {
	$q="update forum set forum_category='$forum_category' where forum_id='$forumid'";
	$kyberia->query($q);
}


function showForumList($kat,$depth) {
	global $kyberia;
	global $user_id;
	global $action;
	$q="SELECT user_forum.user_bookmark as user_bookmark,user_forum.submission_count,user.login,forum.* from forum left join user on forum.forum_owner=user.id left join user_forum on (forum.forum_id=user_forum.forum_id and user_forum.user_id='$user_id')";
	$q.=" WHERE forum_category='$kat'";
	$q.=" order by forum_id desc ";
	$forumset=$kyberia->query($q);


	while ($forumset->next()) {
		echo "<br>";
		for ($i=0;$i<=$depth;$i++) echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		echo "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?action=forum&node_id=",$forumset->getString('forum_id'),"'>",$forumset->getString('forum_name'),"</a>&nbsp;&nbsp;";
		echo "<br>";
		for ($i=0;$i<=$depth;$i++) echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		echo "(".$forumset->getString('login')."&nbsp;&nbsp;::&nbsp;&nbsp;".$forumset->getString('forum_submissions')."&nbsp;submissionz ";

		if ($forumset->getString('submission_count'))  echo "- <font color='red'>".$forumset->getString('submission_count')." NEW</font>";
		echo ")";
/*		 --> ";
		if ($forumset->getString('user_bookmark')=='1') echo "<a href='?action=$action&kat=$kat&book=0&node_id=",$forumset->getString('forum_id'),"'>unbook</a>";
		else echo "<a href='?action=$action&kat=$kat&book=1&node_id=",$forumset->getString('forum_id'),"'>book</a>";
		global $category_parent;
*/
//		if ($user_id==38) echo "<form action='?action=forumlist'><input type='text' name='forum_category'><input type='hidden' name='forumid' value='",$forumset->getString('forum_id'),"'><input type=submit value='change' name='category'></form>";
	}
	echo "<br>";		
}

function showContent($subset,$pole=false,$depth=0) {
	global $user_id;
	$pole=array_unique($pole);
	foreach($pole as $subcat_id) {

		while ($subset[$subcat_id]->next()) {
			$data=$subset[$subcat_id]->getRecord();
			unset($parameter);
			

			//creating parameter string for href linkz
			$params=$_GET['kat'];
			if (Is_array($params)) {
				$r=0;
				foreach ($params as $key => $value) {
					++$r;
					if ($value && ($r<=$depth)) $parameter.="&kat[$key]=$value";
				}
			}		
			$pocet=count($pole);
			$parameter.= '&kat['.$depth.']='.$data['category_id'];

			//listing subcategories
			if (Is_array($data)) {
				echo "<br>";
				for ($i=0;$i<=$depth;$i++) echo "&nbsp;&nbsp;&nbsp;";
				if($depth) echo "|";
				for ($i=0;$i<$depth;$i++) echo "-";
				echo "<b><a href='?action=list$parameter'>";
				echo $data['category_name']."</a>&nbsp;&nbsp;(";
				echo $data['category_forums'];
				echo " forums :: ".$data['category_subcats']." subcategories)</b>";			
			}		
			//unset($parameter);

			//main recursion sophisticated bitch. leave it. it works somehow 
			$flip=array_flip($pole);			
			if ($flip[$data[category_id]]) {
				//echo "<br>";
				for ($i=0;$i<=$depth;$i++) echo "&nbsp;&nbsp;&nbsp;&nbsp;";
				$new_depth=$depth+1;
				
				$slice=array_slice($pole,1);
				foreach ($slice as $cid) {
					$set[$cid]=$subset[$cid];
					
				}
		
				showContent($set,$slice,$new_depth);
				//echo "<br>";
			}
		
		}	

	global $SHOWN;
	if ($SHOWN!="yes") {
		echo "<br>";
		showForumList($subcat_id,$depth);
		
		if ($depth) {
			echo "<br>";
			for ($i=0;$i<=$depth;$i++) echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			$kat=array_pop($_GET[kat]);
			echo "<a href='".SCRIPT."?action=list&show=newforum&kat=$kat'><b>zalozit nove forum</b></a>";
			echo "<br><br>";
		}


			$SHOWN="yes";	
			$parent=array_pop($pole);
/*
			if ($user_id=='38') {
			echo "<form method='post' enctype='multipart/form-data' action='/'><input type='hidden' name='category_parent' value='$parent'>";
			echo "<table><tr>";
			echo "<td align='left'>Nazov kategorie:</td><td align='left'><input class='bigtextinput' type='text' name='category_name'>";
			echo "<tr><td></td><td align='left'><input type='submit' value='pridaj.kategoriu' name='action' class='bigtextinput'>";
			echo "</table></form>";
			}
*/
	}

}

}

if ($show=="newforum") {
		echo "<br>";		
		echo "<form method='post' enctype='multipart/form-data' action='".SCRIPT."?action=forumlist'>";
		echo "<table><tr>";
		echo "<td align='left'>Nazov klubu:</td><td align='left'><input class='bigtextinput' type='text' name='forum_name'>";
		echo "<tr><td align='left'>Obrazok klubu:</td><td align='left'><input class='bigtextinput' type='file' name='forum_icon'>";

		$set=$kyberia->query("select * from category order by category_tree");
		$selectstring="<select name='forum_category'>";
		while ($set->next()) {
		        $count=substr_count($set->getString('category_tree'),";");
		        $selectstring.="<option value='".$set->getString('category_id')."'";
			if ($kat==$set->getString('category_id')) $selectstring.=" selected ";
			$selectstring.=">";
		        if ($count) {
	        	        $selectstring.="|";
		                for ($i=0;$i<$count;$i++) $selectstring.="----";
        		}
		        $selectstring.=$set->getString('category_name')."</option>";
		}
		$selectstring.="</select>";
		echo "<tr><td align='left'>Kategoria :</td><td align='left'>$selectstring</td>";

		echo "<tr><td align='left'>Dalsie info:</td><td align='left' valign='top'><textarea rows='10' cols='60' name='forum_info'></textarea>";
		echo "<tr><td colspan='2' align='center'>verejne: <input type='radio' name='forum_public' value='public' checked>&nbsp;&nbsp;moderovane:<input type='radio' name='forum_public' value='moderated'>&nbsp;&nbsp;privatne:<input type='radio' name='forum_public' value='private'></td></tr>";
		echo "<tr><td colspan='2' align='center'>normal: <input type='radio' name='forum_type' value='flat' checked>&nbsp;&nbsp;threaded:<input type='radio' name='forum_type' value='threaded'></td></tr>";
		echo "<tr><td></td><td align='left'><input type='submit' value='pridaj.forum' name='event' class='bigtextinput'>";
		$set=$kyberia->query("select * from category order by category_tree");


		echo "</table></form>";
		
}

else {
	if (!Is_array($kat)) $kat=array();
	array_unshift($kat,0);

	if (count($_GET[kat])<1) {	
/*
		echo "<b>1. drzte sa temy jednotlivych klubov </b><br>";
		echo "<b>2. osobne veci si vybavujte v poste</b><br>";
		echo "<b>3. snazte sa ostatnym nieco DAT</b><br>";
		echo "<b>4. pouzivajte nahlad a mazte po sebe bravcoviny</b><br>";
		echo "<b>5. konecne funguju bookmarky tak ako maju. takk bookojte, boha ;]</b><br>";
		echo "<b>6. na chatovacich forach sa chatuje. na diskusnych forach sa diskutuje</b>";
*/

//		echo "<font color='red'>Z dovodu prilisneho pracovneho a spolocenskeho ;] vytazenia vas administrator dnes nechtiac zmazal cast databaze v ktorej boli ulozene nazvy a majitelia klubov. Preto pokial vam nejake kluby zmizli z bookmarkov, kliknite hore na ADMIN, potom na \"auditko\" a tam sa pokuste vas klub najst podla textu ktory ste k nemu zadali a ktory sa nastastie zachoval. V pripade ze ho nedopatrenim dostal do ruk niekto ini, napiste mu nech vam ho odovzda. Robi sa to jednoducho - prepisanim mena majitela v polozke \"zmen nastavenie\" v danom fore. <b>Takisto prosim umiestnite forum do prislusnej kategorie.</b>. Dakujem & pardonne moi.</font>"; 
		echo "<br><br>";
	}	

	//precaching objects for category tree
	$q="SELECT user.login,category.* from category left join user on category.category_owner=user.id where category_parent=0";
	$q.=" order by concat(category_name,category_parent) ";
	$subset[0]=$kyberia->query($q);
	foreach ($kat as $subkat) {
		$q="SELECT user.login,category.* from category left join user on category.category_owner=user.id where category_parent=$subkat";
		$q.=" order by category_name ";	
		$subset[$subkat]=$kyberia->query($q);
	}
	
	//recursive category tree bitch
	showContent($subset,$kat);
	
	if (count($_GET[kat])<1) {	
	?>
		<br><br><center><b>najnovsie kluby</b></center>
		<?php
		$q="SELECT user_forum.submission_count,user.login,forum.* from forum left join user on forum.forum_owner=user.id left join user_forum on (forum.forum_id=user_forum.forum_id and user_forum.user_id='$user_id')";
		$q.=" where forum_public='public' or forum_public='moderated'";
		$q.=" order by forum_id desc limit 10 ";
		$forumset=$kyberia->query($q);
		while ($forumset->next()) {
			echo "<a href='?action=forum&node_id=",$forumset->getString('forum_id'),"'>",$forumset->getString('forum_name'),"</a>(".$forumset->getString('login')."&nbsp;&nbsp;::&nbsp;&nbsp;".$forumset->getString('forum_submissions')."&nbsp;submissionz ";
			if ($forumset->getString('submission_count'))  echo "- <font color='red'>".$forumset->getString('submission_count')." NEW</font>";
			echo ")<br>";
		}
	
		?>
		<br><br><center><b>najnovsie denniky</b></center>
		<?php
		$q="SELECT user_discussion.submission_count as new,dennik.id as id,dennik.nadpis as nadpis,dennik.hits,dennik.prispevky,user.login from dennik left join user on dennik.autor=user.id left join user_discussion on (user_discussion.discussion_id=dennik.id_diskuse and user_id='$user_id')";
		$q.=" order by dennik.id  desc limit 10 ";
		//echo $q;
		$forumset=$kyberia->query($q);
		while ($forumset->next()) {
			echo "<a href='?action=journaux&node_id=",$forumset->getString('id'),"'>",$forumset->getString('nadpis'),"</a>(".$forumset->getString('login')."&nbsp;&nbsp;::&nbsp;&nbsp;".$forumset->getString('hits')."&nbsp;hitz ";
			echo "->",$forumset->getString('prispevky'),"submissions";
			if ($forumset->getString('new')) echo " - <font color='red'>".$forumset->getString('new')." NEW</font>";
			echo ")<br>";
		}
	
	}
}
		if (AD_BANNER_FORUMLIST) { echo AD_BANNER_FORUMLIST; }
?>
