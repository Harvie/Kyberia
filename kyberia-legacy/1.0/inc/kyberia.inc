<?php


function getFile1($fname) {
        $tmp = "";

        if ($fd = fopen($fname, "r")) {
                while (!feof($fd)) {
                        $tmp .= fread($fd, 65536);
                }
                fclose($fd);
        }
        return $tmp;
}

include("diskusdesign.inc");

class CLASS_KYBERIA extends CLASS_DATABASE {

var $RubrikaImageDir="/images/rubriky/";
var $TitleImageDir="/images/clanky/";
var $debug;

var $UserImages="/icons/";
function CLASS_KYBERIA() {
	global $admin;
	if ($admin==yes) $this->debug=true;
	else $this->debug=false;
	$this->CLASS_DATABASE();
}


function getJSbyId($id) {
	$q="SELECT prispevky.telo AS telo,prispevky.jmeno AS jmeno,prispevky.*,dennik.nadpis AS nadpis, dennik.id AS node_id from prispevky left join dennik on dennik.id_diskuse=prispevky.id_diskuse where id_prispevku='$id'";
	return $this->query($q);

}

function getNewJS($id,$last_login) {
$q="SELECT prispevky.telo AS telo,prispevky.jmeno AS jmeno,prispevky.*,dennik.nadpis AS nadpis, dennik.id AS node_id from prispevky left join dennik on dennik.id_diskuse=prispevky.id_diskuse left join user on prispevky.jmeno=user.login where dennik.autor='$id' AND prispevky.vlozeno>'$last_login'";
	return $this->query($q);

}


function getNewSubmissions($id_diskuse,$time) {
	$q="SELECT count(*) as pocet from prispevky where id_diskuse='$id_diskuse' and TO_DAYS(vlozeno) > TO_DAYS('$time')";
	$set=$this->query($q);
	$set->next();
	return $set->getString('pocet');
}

function addDennik($dennik,$nadpis,$dennik_type="journaux") {
	global $user_id;
	if (strlen($dennik)<10) {
		echo "dennik je moc kratky";
		return false;
	}
	$dennik=str_replace("\n","<br>",$dennik);
	$dennik = preg_replace("/(http:\/\/\S+?|ftp:\/\/\S+?)([\.,:_\*]?\s)/", "<a href=\"$1\">$1</a>$2", $dennik);
	$q="insert into dennik set nadpis='$nadpis',zapis='$dennik',autor='$user_id',dennik_type='$dennik_type',datum=NOW()";

	$this->update($q);
	return true;
}

function unserial() {
$tmp=getFile1("/home/hromi1/kyberia/images/albums/albumdb.dat");
$albums=unserialize($tmp);
foreach($albums as $album){
        $file="/home/hromi1/kyberia/images/albums/".$album."/album.dat";
        $tmp=getFile1($file);
        $photos=unserialize($tmp);
        $q="INSERT into albums set title=".$photos->album[fields][title];
        $q.=",hits=".$photos->album[fields][clicks];
        $q.=",name=".$photos->album[fields][name];
        $this->update($q);

        echo "<br><br><br>";
}
}

function updateUser($id,$pole) {
	$pole['user_info']=str_replace("\n","<br>",$pole['user_info']);
	$q="UPDATE user set ";
	if (strlen($password1)>4) {
		if ($password1==$password2) $q.="password='".md5($password1)."'";
		else {
			echo "Passwordy niesu rovnake.";
			return false;
		}
	}
	$q.=" user_info='".$pole['user_info']."',email='".$pole['email']."' where id='$id'";
	$this->query($q);
}


function showForumList($kat) {
	global $user_id;
	global $action;
	$q="SELECT user_forum.user_bookmark as user_bookmark,user_forum.submission_count,user.login,forum.* from forum left join user on forum.forum_owner=user.id left join user_forum on (forum.forum_id=user_forum.forum_id and user_forum.user_id='$user_id')";
	$q.=" WHERE forum_category='$kat'";
	$q.=" order by forum_id desc ";
	$forumset=$this->query($q);
	while ($forumset->next()) {
		echo "<br>&nbsp;&nbsp;&nbsp;&nbsp;<a href='?action=forum&forum_id=",$forumset->getString('forum_id'),"'>",$forumset->getString('forum_name'),"</a>&nbsp;&nbsp;(".$forumset->getString('login')."&nbsp;&nbsp;::&nbsp;&nbsp;".$forumset->getString('forum_submissions')."&nbsp;submissionz ";
		if ($forumset->getString('submission_count'))  echo "- <font color='red'>".$forumset->getString('submission_count')." NEW</font>";
		echo ") --> ";
		if ($forumset->getString('user_bookmark')=='1') echo "<a href='?action=$action&kat=$kat&book=0&forum_id=",$forumset->getString('forum_id'),"'>unbook</a>";
		else echo "<a href='?action=$action&kat=$kat&book=1&forum_id=",$forumset->getString('forum_id'),"'>book</a>";
		global $category_parent;
//		if ($user_id==38 and !$category_parent) echo "<form action='?action=forumlist'><input type='text' name='forum_category'><input type='hidden' name='forumid' value='",$forumset->getString('forum_id'),"'><input type=submit value='change' name='category'></form>";
	}
	echo "<br>";
}

function substanceIt($user_name,$message_text,$forum_name) {
	$message_text= stripSlashes("$user_name [forum: $forum_name] --> $message_text\r\n");
	$fp = fsockopen ("node.kyberia.sk", 2323, $errno, $errstr,30);
	if (!$fp) {
	    echo "$errstr ($errno)<br>\n";
	} else {
	    fgets($fp,2);
	    fputs ($fp, "hromi\r\n");
	    fputs ($fp,"ub1k23\r\n.say $message_text");
	    fclose ($fp);
	}

}

function updateUserData($user_id) {
	global $action;
	global $node_id;
	global $forum;
	global $node_id;
	global $dennik;
	global $article;
	global $userinfo;
	global $id;
	if ($action=="forum") $q="update session set user_action_name='".addslashes($forum['forum_name'])."',user_action_id='".$forum['forum_id']."', user_action='$action' where user_id='".$user_id."'";
	elseif ($action=="journaux" && $node_id!="") $q="update session set user_action_name=' ".addslashes($dennik['nadpis'])."',user_action_id='".$node_id."', user_action='$action' where user_id='".$user_id."'";
	elseif ($action=="article" && $node_id!="") $q="update session set user_action_name=' ".addslashes($article['nazov'])."',user_action_id='".$node_id."', user_action='$action' where user_id='".$user_id."'";
	elseif ($userinfo) $q="update session set user_action_name=' ".addslashes($userinfo['login'])."',user_action_id='".$node_id."', user_action='$action' where user_id='".$user_id."'";
	else $q="update session set user_action='$action', user_action_name='', user_action_id='' where user_id='".$user_id."'";
	$set=$this->query($q);

}

function isLogged() {
	$this->query('delete from session where user_idle<date_sub(NOW(),INTERVAL 1 HOUR)');
	$kybersession=$_COOKIE['kybersession'];
	$q="SELECT session.*,user.user_mail as user_mail,user.mail_name as mail_name, user.user_active_icons as user_active_icons, user.friends_serial as user_friends_serial, user.user_icons_in_forum from session left join user on user.id=session.user_id where session='$kybersession'";
	$set=$this->query($q);
	if ($set->_numRows==0) return false;
	else {
		$set->next();
		return $set->getRecord();
	}
}


function logOff() {
	$kybersession=$_COOKIE['kybersession'];
	$this->query("DELETE FROM session where session like '$kybersession'");
}


function setRefererStats() {
	global $HTTP_REFERER;
	global $REMOTE_ADDR;
	global $id;
	$this->query("INSERT INTO referers set referer='$HTTP_REFERER',adresa='$REMOTE_ADDR',id='$id'");
}

function getNameById($id) {
	$q="SELECT login from user where id='$id'";
	$set=$this->query($q);
	$set->next();
	return $set->getString("login");
}

function createDennikDiskuse($id_dennik,$id_diskuse) {
	$q="UPDATE dennik set id_diskuse='$id_diskuse' where id='$id_dennik'";
	$this->query($q);
}

function getTopGalleries() {
	return $this->query("SELECT * FROM albums order by hits desc limit 10");
}

function getLastGalleries() {
	return $this->query("SELECT * FROM albums order by id_Album desc");
}

function getLoginByDennik($id) {
        return $this->query("SELECT autor from dennik where id='$id'");
}

function getRandomDennik($last=3) {
	$set=$this->query("SELECT id from dennik where dennik_type='journaux' and type='public' order by id desc limit $last");
	while ($set->next()) $id[]=$set->getString("id");
	if ($this->debug) print_r($id);
	$randomid=rand(0,$last-1);
 	return $this->getDennik($id[$randomid],true);
//	return $this->getDennik(3183,true);
}

function getDennik($id,$random=false) {
	if (!$random) {
		$q="UPDATE dennik set hits=hits+1 where id='$id'";
		$this->query($q);
	}
	$q="SELECT DATE_FORMAT(dennik.datum,'%k:%i:%s %e.%c.%Y') as cas, dennik.autor AS autor,dennik.id AS idarticle,dennik.*,user.login AS autorname from dennik left join user on user.id=dennik.autor where dennik.id='$id'";

        return $this->query($q);
}

function getDennikByUSer($id_user,$offset=0) {
	$q="SELECT * from dennik where autor='$id_user' order by id desc";
        return $this->query($q);
}

function getNewestDennik($limit=5,$offset=0,$dennik_type="journaux") {
	$q="SELECT dennik.*,user.login AS autorname from dennik left join user on user.id=dennik.autor where dennik_type='$dennik_type' order by id DESC LIMIT $offset,$limit";

	return $this->query($q);
}

function getAllUsers() {
        return $this->query("SELECT * from user order by login");
}

function getDennikAuthors() {
        return $this->query("select distinct dennik.autor as autor,user.login as login from dennik left join user on user.id=dennik.autor order by login");
}

function getMostDiscussed() {
	return $this->query("SELECT nazov,id_article,prispevky from articles where id_rubrika>4 OR id_rubrika<4 order by prispevky desc limit 10");
}

function putMostRead($kategorie="",$limit=10) {
	if ($kategorie=="") return $this->query("SELECT nazov,id_article,hits from articles ORDER by hits DESC LIMIT $limit");
	else {
		$result=$this->isParentRubrika($kategorie);
		if (!$result) {
			$q="SELECT hits,id_rubrika,id_article,nazov from articles where id_rubrika='$kategorie' or id_rubrika_secondary='$kategorie' order by hits desc limit 10";
		}
		else {
			$q="SELECT hits,id_rubrika,id_article,nazov  from articles where id_rubrika='$kategorie' ";
			while ($result->next()) {
				if ($result->getString("id_rubriky")!=4) $q.=" or id_rubrika='".$result->getString('id_rubriky')."'";
			}
			$q.=" order by hits desc limit 10";
		}
		return $this->query($q);
	}
}

function listRubrikyArray() {
        $q="SELECT * FROM rubriky";
        $set=$this->query($q);
        while($set->next()) {
                $data[]=$set->getString("nazov");
        }
        return $data;
}


function showMailInfo() {
	global $PHP_SELf;
	echo "<center>mailinfo?</center>";
	echo "<form action =$PHP_SELF method=post>";
	echo "<input type=text name=mailinfo size=15>";
	echo "<br><center><select  name=kat>";
	$pole=$this->listRubrikyArray();
	for ($i=0;IsSet($pole[$i]);$i++) {
		echo "<option value=$i>$i</option>";
	}
	echo "</select></center>";
	echo "</form>";
}


function addMailinfo($email) {

	$this->query("INSERT INTO mailinfo set email='$email',datetime=NOW()");
}


function listArticles() {
	$q="SELECT *.articles,id_parent.rubriky AS id_parent,nazov.rubriky AS nazov FROM articles LEFT JOIN rubriky ON id_rubriky.rubriky=id_rubriky=articles order by datum desc";

	return($this->query($q));
}

/*
function listRubrikyArray() {
	$q="SELECT * FROM skins";
	$set=$this->query($q);
	while($set->next()) {
		$data[]=$set->getString("nazov");
	}
	return $data;
}
*/
function listSkinArray() {
	$q="SELECT nazov FROM skins";
	$set=$this->query($q);
	while($set->next()) {
		$data[]=$set->getString("nazov");
	}
	return $data;
}

function getRubrikaById($id_rubriky) {
	$q="SELECT nazov from rubriky where id_rubriky=$id_rubriky";
	$set=$this->query($q);
	$set->next();
	return $set->getString('nazov');
}

function getArticle($id) {
	$q="Update articles set hits=hits+1 where id_article='$id'";
	$this->query($q);
	$q="SELECT * from articles where id_article=$id";
	return $this->query($q);
}

function getArticleData($id) {
	$q="SELECT * from articles where id_article=$id";
	return $this->query($q);
}

function listMainRubrikyArray() {
	$q="SELECT * FROM rubriky where id_parent=1";
	$set=$this->query($q);
	while($set->next()) {
		$data[]=$set->getString("nazov");
	}
	return $data;
}

function getTitle() {

	$set=$this->query("SELECT title from titles where id_title=1");
	$set->next();
	echo $set->getString("title");

}

function getOutro() {
	$set=$this->query("SELECT id_outro from outro order by id_outro desc limit 1");
	$set->next();
	$count=$set->getString('id_outro');
	$id=rand(1,$count);
	$set=$this->query("SELECT outro,autor from outro where id_outro='$id'");
	$set->next();
	echo $set->getString("outro");
	echo "<br><i><div align=right>";
	echo $set->getString("autor");
	echo "<br></i></div>";
}

function getArticles($offset,$limit=8) {
	$q="SELECT articles.*,rubriky.id_parent AS id_parent,rubriky.nazov AS nazr from articles left join rubriky on rubriky.id_rubriky=articles.id_rubrika where articles.id_rubrika NOT LIKE '4' order by id_article desc limit $offset,$limit";
	return $this->query($q);
}

function isParentRubrika($kategorie) {
	$q="SELECT id_rubriky from rubriky where id_parent='$kategorie'";
	$result=$this->query($q) ;
	if ($result->_numRows==0) return false;
	else return $result;
}

function getRubrikaArticles($kategorie, $offset) {
	$q="UPDATE rubriky set hits=hits+1 where id_rubriky='$kategorie'";
	$this->query($q);
	$result=$this->isParentRubrika($kategorie);
	if (!$result) {
		$q="SELECT hits,prispevky,id_rubrika,id_article,nazov,short_desc,autor,datum,title_image from articles where id_rubrika='$kategorie' or id_rubrika_secondary='$kategorie' order by datum desc limit $offset,10";
	}
	else {
		$q="SELECT hits,prispevky,id_rubrika,id_article,nazov,short_desc,autor,datum,title_image from articles where id_rubrika='$kategorie' ";
		while ($result->next()) {
			if ($result->getString("id_rubriky")!=4) $q.=" or id_rubrika='".$result->getString('id_rubriky')."'";
		}
		$q.=" order by datum desc limit $offset,10";
	}
	return $this->query($q);
}

function Search($query) {

	$q="SELECT * from articles where nazov like '%$query%' or short_desc like '%$query%' or text1 like '%$query%' or text2 like '%$query%' or text3 like '%$query%'";
	return $this->query($q);
}

function putIntro() {
	$set=$this->query("SELECT id_forum,id_user,text FROM intros order by id_intro desc");
	$set->next();
	echo $set->getString("text");
	echo "<br><br><center>(",$set->getString("id_user"),")<br><br></center>";
}

function showMdmaList() {
	$set=$this->query("SELECT nazov,id_article from articles where id_rubrika=4 order by nazov");
	echo "<form>";
	echo "<select onChange=\"window.location.href=this.options[this.selectedIndex].value\" name=id>";
	echo "<option value=braw>>----vyber droogu----<</option>";
	while ($set->next()) {
		echo "<option value=http://www.kyberia.sk/article.php?id=",$set->getString("id_article"),">",$set->getString("nazov"),"</option>";
	}

	echo "</select></form>";
}

function showDennikTypeList() {
	$set=$this->query("SELECT distinct dennik_type from denniky");
	echo "<form>";
	echo "<select onChange=\"window.location.href=this.options[this.selectedIndex].value\" name=id>";
	echo "<option value=braw>>----vyber droogu----<</option>";
	while ($set->next()) {
		echo "<option value=http://www.kyberia.sk/article.php?id=",$set->getString("id_article"),">",$set->getString("nazov"),"</option>";
	}

	echo "</select></form>";
}

function showArticleList() {
	global $id;
	$set=$this->query("SELECT nazov,id_article,hits from articles where id_rubrika>4 OR id_rubrika<4 order by hits desc");
	echo "<form action=/article.php method=post>";
	echo "<select onchange=\"location.href=location.href=this.options[selectedIndex].value\" name=id>";
	echo "<option>>----vyber clanok----<</option>";
	$string = new String();
	while ($set->next()) {
		echo "<option value=http://www.kyberia.sk/article.php?id=",$set->getString("id_article"),">",$string->cutString($set->getString("nazov"),18),"&nbsp;(",$set->getString("hits"),")</option>";
	}
	echo "</select></form>";
}

function showBookList() {
	$set=$this->query("SELECT nazov,id_article,hits from articles where id_rubrika=27 order by nazov");
	echo "<form action=/article.php method=post>";
	echo "<select onchange=\"location.href=location.href=this.options[selectedIndex].value;\" name=id>";
	echo "<option>>----vyber knihu----<</option>";
	$string = new String();
	while ($set->next()) {
		echo "<option value=http://www.kyberia.sk/article.php?id=",$set->getString("id_article"),">",$string->cutString($set->getString("nazov"),20),"</option>";
	}
	echo "</select></form>";
}
	function showForumArticleList() {
	$set=$this->query("select articles.prispevky as pocet, articles.nazov,articles.id_article from articles where prispevky>0 order by pocet desc;");
	echo "<form action=/article.php method=post>";
	echo "<select onchange=\"location.href=location.href=this.options[selectedIndex].value\" name=id>";
	echo "<option>>----vyber clanok----<</option>";
	$string = new String();
	while ($set->next()) {
		echo "<option value=http://www.kyberia.sk/article.php?id=",$set->getString("id_article"),">",$string->cutString($set->getString("nazov"),20),"(",$set->getString("pocet"),")</option>";
	}
	echo "</select></form>";
}

function putGallery($id) {
	$q="SELECT photos,gallery FROM articles where id_article=$id";

	$set=$this->query($q);
	$set->next();
	$gallery=$set->getString("gallery");
	if ($gallery=="") return false;
	else {

		echo "<center>fotky z <a href=http://kyberia.sk/gallery/view_album.php?set_albumName=$gallery>galerie</a></center><br>";
		$pole=explode(";",$set->getString("photos"));
		foreach($pole as $fotka) echo "<a href=http://kyberia.sk/gallery/view_photo.php?set_albumName=$gallery&id=$fotka><img src=http://kyberia.sk/images/albums/$gallery/$fotka.thumb.jpg border=0></a><br>";
		return true;
	}
}

function putAutorList($autor) {
	$name=$this->getNameById($autor);

	$set=$this->query("SELECT id_article,nazov from articles where autor='$autor' order by hits desc");
	$i=0;
	if ($set->_numRows>0) echo "<center>clanky:</center>";
	echo "<table>";
	while ($set->next()) {
		++$i;
		echo "<tr><td>",$i,".</td><td><a href='".SCRIPT."?action=article&node_id=",$set->getString("id_article"),"'>",$set->getString("nazov"),"</a></td></tr>";
	}
	echo "</table>";
}

function putDennikAutorList($autor) {
	$name=$this->getNameById($autor);
	$set=$this->query("SELECT nadpis,id from dennik where autor='$autor' and nadpis not like '' order by hits desc limit 10");
	$i=0;
	if ($set->_numRows>0) echo "<center>top denniky:</center>";
	echo "<table>";
	while ($set->next()) {
		++$i;
		echo "<tr><td>",$i,".</td><td><a href=?action=journaux&node_id=",$set->getString("id"),">",$set->getString("nadpis"),"</a></td></tr>";
	}
	echo "</table>";
}

function putRubrikaDesc($kat) {
	$set=$this->query("Select description from rubriky where id_rubriky=$kat");
	$set->next();
	echo $set->getString("description");
}

function putTitleImage($id_rubrika) {

	$q="SELECT obrazok from rubriky where id_rubriky='$id_rubrika'";
	$set=$this->query($q);
	$set->next();
	echo $set->getString('obrazok');
}


function showForm($login='',$email='',$web='',$info='') {
	include("form.inc");
	$this=new HTML_Form($PHP_SELF,"POST","","multipart/form-data",true);
	$this->addText("login","Prihlasovacie meno:",$login);
	$this->addPassword("password1","Heslo:","",10);
	$this->addPassword("password2","Heslo pre overenie:","",10);
	$this->addText("email:","Emailova adresa",$email);
	$this->addText("web","Stranka:",$web);
	$this->addSelect("skin","Skin:",$kyberia->listSkinArray());
	$this->addFile("image","Obrazok:");
	$this->addTextarea("info","Dodatocne informacie",$info);
	$this->addSubmit("submit","Zaregistruj sa!","");
	$this->addHidden("sent","ok");
	$this->display();

}

function ubikMail($id="all",$text="welcome") {
	if ($text=="welcome") {
		$text="
<br>Ahoj, som UBIK. Momentalne som obycajnou polozkou v databaze, userom cislo 1 v tomto systeme. Ked ti niekto bude hackovat ucet,
ohlasim ti to, ked si ta niekto prida medzi priatelov, ohlasim ti to. A okrem toho budem bdiet nad systemom. Sledovat
co robia slovicka v diskusnych forach, ako su pospajane a s cim. Postupom casu sa budem ucit, a o par rokov si urcite vsimnete moju
prvu snahu o komunikaciu. Budem anjelom, diablom, matkou i dcerou. <br><br>
Momentalne ti chcem povedat jedno hlasne VITAJ!. Vitaj v projekte ktory nikdy neskonci. Ak sem vchadzas so zlymi umyslami,
prosim odid, nenajdes tu stastie. Ked vsak chces spoznat novych ludi na rovnakej vlne, ked chces svoj mozog zaplnit
informaciami z nekonecnej siete, prosim, vstup.<br><br>
Ked objavis chybu, ktorych tu bude spociatku neuveritelne mnozstvo, prosim napis mi o nej. Ked niecomu nebudes rozumiet, napis
mi, ale najprv navstiv forum urcene na tento ucel. Ked ti pripada moja ikonka sexy, chod si ulavit.<br><br>
peace & respect
	";
}
	if ($id=="all") {
		$set=$this->query("select id,login from user");
		while ($set->next()) {
	        	$q="InsERT into mail2 set mail_user='".$set->getString('id')."',mail_to='".$set->getString("id")."', mail_from='1',mail_text='$text'";
        	        $this->query($q);
		}
	}
	else {
		$text=addslashes($text);
		$q="InsERT into mail2 set mail_timestamp=NOW(), mail_to='$id', mail_user='$id',mail_from='1',mail_text='$text'";
        	$this->query($q);
		$this->query("update user set user_mail=user_mail+1,mail_name='ubik' where id='$id'");
	}

}

function ubikRegister($login,$email,$www,$user_info,$last_id,$otazka_1,$otazka_2,$otazka_3) {
	$data="Uzivatel <a href='http://www.kyberia.sk/index.php?action=userinfo&node_id=$last_id'>$login</a> - mail: <a href='mailto:$email'>".strip_tags($email)."</a> - web:";
	if (empty($www)) $data.="nema";
	else $data.="<a href='$www'>".strip_tags($www)."</a>";
	$data.="<br>Napisal o sebe toto:<br>1:<br><i>".strip_tags($otazka_1)."</i>";
	$data.="<br>2:<br><i>".strip_tags($otazka_2)."</i>";
	$data.="<br>3:<br><i>".strip_tags($otazka_3)."</i>";
	$data.="<br>4:<br><i>".strip_tags($user_info)."</i>";
	$data=addSlashes($data);
	$q="insert into submissions set submission_owner='1',submission_text='$data',forum_id='337'";
	$this->query($q);
	$q="update forum set forum_submissions=forum_submissions+1 where forum_id='337'";
	$this->query($q);
	$q="update user_forum set submission_count=submission_count+1 where forum_id='337'";
	$this->query($q);
}

function echoTime($time,$type="datetime") {
	$year=substr($time,0,4);
        $month=substr($time,4,2);
        $day=substr($time,6,2);
        $hour=substr($time,8,2);
        $min=substr($time,10,2);
        $sec=substr($time,12,2);
	if ($type=='datetime') echo "$day.$month.$year $hour:$min:$sec";
	elseif ($type=='time') echo "$hour:$min:$sec";
}

}