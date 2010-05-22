<?php
$thread_offset="0";
include_once("diskusia.inc");

class DiskuseDesign extends Diskuse {
	
	function DiskuseDesign() {
		$this->Diskuse();
	}

	function printDiskuse($id_diskuse,$getstring = "") { // zobraz_diskusi
	   global $id,$dskn,$ds_j,$ds_e,$ds_x,$dstp,$ds_s,$dssa,$dsks,$dspe,$dvta,$nodouble,$action,$node_id;
		global $PHP_SELF;
		if ($ds_s) {
		if ($action=="articles") {
			$set=$this->query("SELECT nazov from articles where id_article=$id");
			$set->next();
			$nazov=$set->getString("nazov");
			$dennik="false";
		}
		elseif ($action=="journaux") {
			$set=$this->query("SELECT nadpis from dennik where id='$node_id'");
			$set->next();
			$nazov=$set->getString("nadpis");
			$dennik="false";
		}

			$this->addPost($dennik,$id,$nazov,$id_diskuse,$ds_j,$ds_e,$ds_x,$dstp,$dspe,$dvta,$nodouble); // pridat_prispevek
	}				
	if ($dskn) {
		$this->printPosts($id_diskuse,$dskn);
		$this->printAddPostForm($id_diskuse,$dskn); // pridat_prispevek_form
	}
	else {
		$this->printAddPostForm($id_diskuse,$dskn); // pridat_prispevek_form
		$this->printPosts($id_diskuse,""); // vypsat_prispevky
	
	}
}
	function printListing($id_diskuse,$getstring = "") {
	
		$width = 400;
	
		$r = $this->getPosts($id_diskuse);
?>
<table border="0" cellpadding="0" cellspacing="0">
<tr><td>
<form action="<?echo SCRIPT."?action=$action"; ?>" method=post>
<table border="0" cellpadding="0" cellspacing="0">

</tr>
<tr><td height="5" colspan="2"></td></tr>
</table>
</td></tr>
<tr><td>
<table border="0" cellpadding="0" cellspacing="0">
<tr><td>
<?php
		if ($r->getNumRows() < 6) {
			$size = 6;
		} else {
			$size = $r->getNumRows();
			if ($size > 20) {
				$size = 20;
			}
		}
?>
<select name='dsks[]' multiple style='font-family: Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size: 11px; width: <?= $width ?>;' size='<?= $size ?>'>
<?php
		if ($r->getNumRows() > 0) {
			while ($r->next()) {
				$t = $r->getRecord();
				$l = strlen($t[thread]);
				$zub = ($l+1)/5;
				for ($x = 1; $x < $zub; $x++) {
					$t[titulek] = "&nbsp;&nbsp;&nbsp;".$t[titulek];
				}
				echo "<option value='$t[id_prispevku]'>$t[f_vlozeno] &nbsp; $t[titulek] &nbsp;&nbsp;&nbsp;";
				if ($t[jmeno]) echo " ($t[jmeno])";
				echo "</option>\n";
			}
		} else {
			echo "<option>".str_repeat("&nbsp;",50)."</option>\n"; // Netscape suxx oprcavka
		}
?>
</select>
</td>
<td><img src="http://gfx.volny.cz/trans.gif" width="8" height="1" alt="."></td>
<td valign="top"><img src='/images/kyb106small.gif' border=0><br><input type="image" src='/images/selected.gif' name="Vybrane" class=noborder vspace="2" border="0"><br>
<a href="<? global $id;  echo $PHP_SELF,"?dssa=true&node_id=$node_id";?>"><img src='/images/all.gif' vspace="2" border="0" alt="Vypisat vsetko"></a><br>
<a href="<? echo $PHP_SELF,"?dskn=new&node_id=$node_id"; ?>"><img src='/images/add.gif' alt="Pridat novy prispevoký" vspace="2" border="0"></a><br>
</td>
</tr>
</table>
</td></form></tr>
</table>
<?php
	}

    function printPosts($id_diskuse,$prispevky = "") {
    	// $prispevky = array of id_prispevku'z
    	$r = $this->getPosts($id_diskuse,$prispevky);
    	if ($r->getNumRows()>0) {
    		echo "<br>";
    		echo "<big class=titulek><br>Prispevky</big><br><br>";
		
    		while ($r->next()) {
    			$thread_offset=0;
			$t = $r->getRecord();
				$zub = (strlen($t[thread])+1)/5;
    			$counter++;
    			for ($x = 1; $x < $zub; $x++) $thread_offset+=40;

    			if ($counter > 1) {
    				echo "<hr size=1 color='#6dae42'>";
    			}
    			echo "<table cellspacing=0 cellpadding=0 border=0><tr>";
			echo "<td width='$thread_offset'></td>";
			echo "<td>";
			if ($t[login]) echo "<img src=http://kyberia.sk/images/users/",strtolower($t[jmeno]),".gif border=0 hspace=5 align=left >";
			echo "<i>Od: $t[jmeno]";
    			if ($t[email]) {
    				echo " &lt;<a class=text href='mailto:$t[email]'>$t[email]</a>&gt;";
    			}
    			if ($t[www]) {
    				echo " <a class=text href='$t[www]'>$t[www]</a>";
    			}
    			global $id;
			global $node_id;
			global $action;
			if ($action=="article" ) echo " [<a href='$PHP_SELF?action=article&node_id=".$_GET['node_id']."&dskn=".$t[id_prispevku]."' class=text>Odpovedat</a>] z $t[f_vlozeno]</i>";
			else echo " [<a href='$PHP_SELF?action=journaux&node_id=$node_id&dskn=".$t[id_prispevku]."' class=text>Odpovedat</a>] z $t[f_vlozeno]</i>";
    			echo "<br>\n";
    			echo StripSlashes($t[telo]);
			echo "</td></tr></table>";
    		}
    	}
    }

	function printAddPostForm($id_diskuse, $thread_prev = "") {
		global $_COLOR,$_SELF,$_UINFO,$id;
		$j = trim($_UINFO->_currentRecord[login]);
		$e = $_UINFO->_currentRecord[email];


		if ($thread_prev && $thread_prev != "new") {
			$topiq = $this->getTitulek($id_diskuse,$thread_prev);
			if (!is_int(strpos(strtolower($topiq),"re:"))) {
				$topiq = "Re: ".$topiq;
			}
		}
		if ($IDC) {
			global $SESSION_VETA;
			session_register("SESSION_VETA");
			$znamka = $SESSION_VETA[$IDC];
		}

global $user_id;
if ($user_id) {	
	echo "<br><form action='";
	global $action;
	global $dstp;
	global $id;
	global $node_id;
	echo $PHP_SELF;
	echo "?action=$action";
	if ($thread_prev) echo "&dstp=$thread_prev"; 
	if ($node_id) echo "&node_id=$node_id"; 


	?>' method='post'>
	<input type=hidden name=nodouble value='<?= md5(time()) ?>'>
	<input type=hidden name=id value=<?=$_GET['id']?>>
	<table border="0" cellspacing="0" cellpadding="2">
	<tr><td colspan=2><textarea name='ds_x' cols=60 rows=5></textarea><br></td></tr>
	<input type='hidden' name='ds_j' value='<? global $user_name; echo $user_name;?>'><input type='hidden' name='id' value='<? global $user_id; $user_id;?>'>
	<tr><td class=mini colspan=2><input class=noborder type=checkbox name=dspe> pošli mi postu na kyberke, ked niekto dalsi prispeje do diskusie</td></tr>
	<tr><td colspan=2 align=center><input type='submit' name='ds_s' value='Vložit prispevok'></td></tr></form>
	</table>
<?php
}
else echo "<br><br><center><b>Z dovodu primitivizmu niektorych jedincov a mojich nevyburenych fasizoidnych tendencii mozu pridavat prispevky iba <a href='".SCRIPT."?action=register'>zaregistrovany</a> a prihlaseny uzivatelia.Pokial si zaregistrovany zaloguj sa dnu & sorry<br><form method='post'>login: <input type='text' name='login'>  heslo: <input type='password' name='password'>  <input type='submit' name='event' value='login'><input type='hidden' name='action' value='login'><input type='hidden' name='node_id' value='$node_id'></form></b></center>";
}

}
?>