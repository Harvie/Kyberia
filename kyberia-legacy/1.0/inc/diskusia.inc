<?php
// requires: Email, String


include_once("database.inc");
include_once("string.inc");
include_once("email.inc");
class Diskuse extends CLASS_DATABASE {

	function Diskuse() {
		$this->CLASS_DATABASE();

	}
	
    function addPost($dennik,$id_clanku,$nazov,$id_diskuse, $jmeno = "",$email = "",$telo = "",$thread_prev = "",$posli_email = "",$znamka = 0,$nodouble = "") {
	
    	if ($id_diskuse && ($titulek || $telo)) {
    		if ($nodouble) {
    			$q = "SELECT id_prispevku FROM prispevky WHERE duplicita = '$nodouble'";
    			$set = $this->executeQuery($q);
    			if ($set->getNumRows()) return false;
    		}
    		$diskuseinfo = $this->getDiskuseInfo($id_diskuse);
    		if (strlen($telo) > 25 && strpos($telo," ",25)) {
    			$titulek = substr($telo,0,strpos($telo," ",25))."...";
    		} else {
    			$titulek = $telo;
    		}
    		$jmeno = strip_tags($jmeno);
    		$email = strip_tags($email);
    		$telo = strip_tags($telo,'<a><b><i><u>');
    		$telo = nl2br($telo);
    		if ($thread_prev) {
    			$q = "SELECT thread FROM prispevky WHERE id_prispevku = '$thread_prev' AND id_diskuse = '$id_diskuse'";
    			$r = $this->executeQuery($q);
    			if ($r->getNumRows()) {
    				$r->next();
    				$t = $r->getRecord();
    				$thread = $t[thread];
    				$len = strlen($thread);
    			} else {
    				$len = -1;
    			}
    		} else {
    			$len = -1;
    		}
    		if ($len > 0) {
    			$q = "SELECT MAX(SUBSTRING(thread FROM ".($len+2)." FOR 4)) AS max ";
    		} else {
    			$q = "SELECT MAX(SUBSTRING(thread FROM 1 FOR 4)) AS max ";
    		}
    		$q.= "FROM prispevky WHERE id_diskuse = '$id_diskuse'";
    		if ($len > 0) {
    			$q.= " AND SUBSTRING(thread FROM 1 FOR ".$len.") = '$thread'";
    		}
    		$r = $this->executeQuery($q);
    		$r->next();
    		$s = $r->getRecord();
    		$telo = wordwrap($telo,50," ",1);
    		$newthread = $thread.($thread?".":"").sprintf("%04s",$s[max]+1);
    		if ($posli_email) {
    			$posli_email = 'ano';
    		} else {
    			$posli_email = 'ne';
    		}
		$telo = AddSlashes(EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank' href=\"\\6\\7\">\\6\\7</a>",$telo));
		$titulek = AddSlashes(EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank' href=\"\\6\\7\">\\6\\7</a>",$titulek));

		$q = "INSERT INTO prispevky (id_diskuse,vlozeno,jmeno,email,titulek,telo,thread,email_upozorneni,znamka,duplicita) ";
    		$q.= "VALUES ('$id_diskuse', NOW(), '$jmeno', '$email', '$titulek', '$telo', '$newthread', '$posli_email', '$znamka', '$nodouble')";
    		$this->executeUpdate($q);
    		$dskn=$this->getLastInsertId();
		$q="UPDATE user_discussion set submission_count=submission_count+1 where user_id!='$user_id' and discussion_id= '$id_diskuse'";
		$this->query($q);
		if (!$dennik) $q ="UPDATE articles set prispevky=prispevky+1 where id_diskuse='$id_diskuse'";
		else $q ="UPDATE dennik set prispevky=prispevky+1 where id_diskuse='$id_diskuse'";
    		$this->executeUpdate($q);
		$this->updatePostsCount($id_diskuse); // prepocitat_pocet_prispevku

    	   	$r = $this->getEmailSubscriptions($id_diskuse);
    		if ($r->getNumRows()>0) {
			$link="?action=".$_GET['action']."&node_id=".$_GET['node_id'];
			$mailbody="Do diskusie pribudol novy prispevok.<br>Od: <i>$jmeno</i><br><b>$telo</b><br><br>Zareagovat mozes <a href='".SCRIPT.$link."'>tu</a>.<br>";
			while ($r->next()) {
					$row = $r->getRecord();
					
					if ($user_id != $row["user_id"]) {
						global $kyberia;
					
						$kyberia->ubikMail($row['user_id'],$mailbody);
						//mail($row["email"],'prispevok do fora na kyberia.sk',$mailbody,"From: forum@kyberia.sk\nReturn-path: forum@kyberia.sk");
					}
				}
			}
		}
    }

	function getEmailSubscriptions($id_diskuse) {
		$q = "SELECT prispevky.jmeno,user.id as user_id FROM prispevky left join user on prispevky.jmeno=user.login WHERE id_diskuse = '$id_diskuse' AND email_upozorneni = 'ano' GROUP BY user.login";
		
		return $this->executeQuery($q);
	}

	function getDiskuseInfo($id_diskuse) {
		$set = $this->executeQuery("SELECT * FROM diskuse WHERE id_diskuse = '$id_diskuse'");
		$set->next();
		return $set->getRecord();
	}
    
    function updatePostsCount($id_diskuse) {
		$r = $this->executeQuery("SELECT COUNT(*) AS pocet FROM prispevky WHERE id_diskuse = '$id_diskuse'");
		$r->next();
		if ($r->getInt("pocet") > 0)
		{
			$this->executeUpdate("UPDATE diskuse SET pocet_prispevku = '".$r->getInt("pocet")."' WHERE id_diskuse = '$id_diskuse'");
		}
    }
    
    function getDiskuses($parameters = "") {
    	$q = "SELECT id_diskuse,kat,titulek,url,pocet_prispevku FROM diskuse";
    	if ($parameters[where]) $q.= " WHERE ".$parameters["where"];
    	if ($parameters[order]) $q.= " ORDER BY ".$parameters["order"];
    	if ($parameters[limit]) $q.= " LIMIT ".$parameters["limit"];
    	return $this->executeQuery($q);
    }
    
    function getPosts($id_diskuse,$prispevky = "") {
    	$q = "SELECT user.login as login, prispevky.*,DATE_FORMAT(prispevky.vlozeno,'%e.%c. %H:%i') AS f_vlozeno FROM prispevky LEFT join user ON prispevky.jmeno=user.login WHERE id_diskuse = '$id_diskuse'  ";
	if (is_array($prispevky)) {
    		$q.= " AND ( 1=0 ";
    		while (list($x,$a) = each($prispevky)) {
    			$q.= "OR id_prispevku = '$a' ";
    		}
    		$q.= " ) ";
    	}
	if ($prispevky) $q.=" AND id_prispevku='$prispevky' ";
    	$q.= "group by id_prispevku  ORDER BY CONCAT(thread,vlozeno) DESC";
    	return $this->executeQuery($q);
    }
    
    function createDiskuse($titulek="title",$kat = "") {
    	$q = "INSERT INTO diskuse (id_diskuse,kat,zalozeno,titulek) VALUES (0,'$kat',NOW(),'$titulek')";
    	$this->query($q);
    	return ($this->getLastInsertId());
    }
    
    function getPostsCount($id_diskuse) {
    	$row = $this->getDiskuseInfo($id_diskuse);
    	return $row["pocet_prispevku"];
    }

	function getTitulek($id_diskuse,$thread_prev) {
		$q = "SELECT titulek FROM prispevky WHERE id_diskuse = '$id_diskuse' AND id_prispevku = '$thread_prev'";
		$r = $this->executeQuery($q);
		$r->next();
		return $r->getString("titulek");
	}
	
}
?>