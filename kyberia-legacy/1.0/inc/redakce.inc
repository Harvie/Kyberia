<?php
include('kyberia.inc');
class CLASS_REDAKCE extends CLASS_KYBERIA {


function CLASS_REDAKCE() {
	$this->CLASS_KYBERIA();
}

function listArticles() {
	$q="SELECT * FROM articles order by id_article desc";
	return($this->query($q));
}

function getAllGalleries() {
	return $this->query("SELECT * from albums");
}

function getParentCount($id_parent) {
	$q="SELECT COUNT(*) AS pocet from rubriky where id_parent='$id_parent'";
	$set=$this->query($q);
	$set->next();
	return $set->getString("pocet");
}

function getRubrikaCount($id_rubrika) {
	$q="SELECT COUNT(*) AS pocet from articles where id_rubrika='$id_rubrika'";
	$set=$this->query($q);
	$set->next();
	return $set->getString("pocet");
}
function createMenu() {
	$q="SELECT DISTINCT id_parent from rubriky";
	$parents=$this->query($q);
	for ($i=0;$parents->next();$i++) {
		$parent=$parents->getString("id_parent");
		$parentcount=$this->getParentCount($parent);
		$string .= "\nMenu".$i.'=new Array("'.$this->getRubrikabyId($parent).'","http://kyberia.sk/?action=rubrika&kat='.$parent.'","",'.$parentcount.',20,110);';
		$q="SELECT id_rubriky,nazov from rubriky where id_parent=$parent and id_parent>1";
		$rubriky=$this->query($q);
		for ($j=1;$rubriky->next();$j++) {
			$rubrika=$rubriky->getString("id_rubriky");
			$rubrikacount=$this->getRubrikaCount($rubrika);
			$string .=  "\nMenu".$i.'_'.$j.'=new Array("'.$this->getRubrikabyId($rubrika).'","http://kyberia.sk/?action=rubrika&node_id='.$rubrika.'","",'.$rubrikacount.',20,150);';
			$q="SELECT id_article,nazov from articles where id_rubrika=$rubrika";
			$articles=$this->query($q);
			for ($k=1;$articles->next();$k++) {
				$article=$articles->getString("id_article");
				$string .= "\nMenu".$i."_".$j."_".$k.'=new Array("'.$articles->getString("nazov").'","?action=article&node_id='.$article.'","",0,20,250);';;
			}
		}
	}
//	$set = $this->getAllUsers();
//	$pocet=$set->_numRows-1;
	$string .= "\nMenu".$i.'=new Array("journaux","?action=journaux","",0,20,110);';	
/*	for ($l=0;$set->next();$l++) {
		$username=$set->getString("meno");
		$userid=$set->getString("id");
		$string .= "\nMenu".$i.'_'.$l.'=new Array("'.$username.'","http://kyberia.sk/journaux.php?user='.$userid.'","",0,20,115);';			
	} */
	echo $string;
	$i++;
	$string .= "\nMenu".$i.'=new Array("photoz","http://kyberia.sk/gallery","",0,20,118);';	
	$file=fopen("/home/hromi1/kyberia/js/menu.js","w+");
	fputs($file,$string); 
}

function listRubrikyArray() {
	$q="SELECT * FROM rubriky";
	$set=$this->query($q);
	while($set->next()) {
		$data[]=$set->getString("nazov");
	}
	return $data;
}

function listGalleryArray() {
	$q="SELECT * FROM albums";
	$set=$this->query($q);
	$data[]="none";
	while($set->next()) {
		$data[]=$set->getString("name");
	}
	return $data;
}

function addArticle($pole,$timage) {
	$text1=AddSlashes(str_replace("\n","<br>",$pole['text1']));
//	$text1=AddSlashes($pole[text1]);
	$text3=AddSlashes($pole[text3]);
	$text2=AddSlashes($pole[text2]);
	$id_rubrika=$pole[id_rubrika]+1;
	$id_rubrika_secondary=$pole[id_rubrika_secondary]+1;
	$title_image=$pole[title_image];
	$dd= new Diskuse();
	$diskid=$dd->createDiskuse($id_rubrika);
	$q="INSERT INTO articles SET datum=NOW(),";
	$q.="nazov='$pole[nazov]',short_desc='$pole[short_desc]',text1='$text1',text2='$text2',text3='$text3',autor='$pole[autor]',";
	$q.="id_rubrika='$id_rubrika',";
	$q.="id_rubrika_secondary='$id_rubrika_secondary',";
	$q.="id_diskuse='$diskid',title_image='$timage',hits='0'";
	$q.=",gallery='$gallery'";
	$q.=",prispevky='$prispevky'";
	$this->query($q);
	$this->createMenu();
}

function updateArticle($pole) {
	$id_rubrika=$pole[id_rubrika]+1;
	$id_rubrika_secondary=$pole[id_rubrika_secondary]+1;
	$title_image=$pole[title_image];
	$text1=AddSlashes($pole[text1]);
	$text3=AddSlashes($pole[text3]);
	$text2=AddSlashes($pole[text2]);
	$q="update articles SET datum=NOW(),";
	$q.="nazov='$pole[nazov]',short_desc='$pole[short_desc]',text1='$text1',autor='$pole[autor]',";
	$q.="id_rubrika='$id_rubrika',id_rubrika_secondary='$id_rubrika_secondary',keywords='$pole[keywords]'";
	$q.=" where id_article=$pole[id]";
	$this->query($q);
}

function deleteArticle($id) {
	$this->query("DELETE FROM articles where id_article=$id");
}

function addRubrika($pole,$obrazok) {
	$rodic=($pole[id_parent])+1;
	$this->query("INSERT INTO rubriky set nazov='$pole[nazov]',id_parent='$rodic',obrazok='$obrazok',description='$pole[description]'");
}

function addSkin($nazov,$adresa) {
	$rodic=($pole[id_parent])+1;
	$this->query("INSERT INTO skins set nazov='$nazov',adresa='$adresa'");
}

function addIntro($pole) {
	$q="INSERT INTO intros set text='$pole[text]',id_forum='$id_forum',id_user='$pole[id_autor]'";
	echo $q;
	$this->query($q);
}

function addTitle($pole) {
	$this->query("INSERT INTO titles set title='$pole[title]'");
}

 
// >------------------------------koniec metod---------------<
}
?>