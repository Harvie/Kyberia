<?php

// test
//
//hromi is an asshole mothafooka programma'
//toto je nejake zujimave prekonvertovanie odkazovania
//z id na node_id
if ($_GET['id']) {
	if ($_GET['action']=='article') $_GET['node_id']=$_GET['id'];
	if ($_GET['action']=='forum') $_GET['node_id']=$_GET['forum_id'];
}

//inicializacia stopiek vzniku stranky
$timer_start=Time()+SubStr(MicroTime(),0,8);
//nastavenie ciest
ini_set("include_path","./inc:./boxiky/:./config:../inc:../boxiky/:../config");

//tu je umiestnena hlavna class kyberia
include("kyberia.inc");
//tu su rozne zobrazovacie funkcie
include("showz.inc");
//nastavenie databaze
include("configdb.inc");

//nastavenia banerov a title
include("config_texts.inc");
//cesty na ukladanie napr obrazkov
include("config_pathz.inc");

//definicia hlavnej najpouzivanejsej class
$kyberia=new CLASS_KYBERIA();

//ak sa niekto snazil podstrcit prihlasenie cez GET
if(IsSet($user_id)) {
	$kyberia->ubikMail("38","Bastard to skusal z $REMOTE_ADDR");
	echo "Hmmm nepokusaj sa o blbosti. Tvoja ip mi bola prave odoslana do posty.";
	die();
}

//pokial neexistuje cookie tak ho vytvori
if (empty($_COOKIE['kybersession'])) {
	$id=md5(MicroTime());
	Setcookie("kybersession",$id,0,"/");
}

//posiela hlavicku aby nic necachovalo
Header("Cache-control: no-cache");
Header("Expires:".gmdate("D, d M Y H:i:s")." GMT");
header("Last-Modified: ".gmdate("D, d M Y H:i:s")." GMT");

//neviem na co je tato premenna, ak viete tak napiste
if (!$offset) $offset=0;
//odhlas ma
if ($action=="logoff") {
	$kyberia->logOff();
	unset($action);
}

//user data caching
if ($user=$kyberia->isLogged()) {
	$user_id=$user['user_id'];
	$user_mode_message=$user['user_mode_message'];

	if ($user['admin']=='yes') define ('ADMIN',true);
	else define ('ADMIN',false);
	$user_name=$user['user_name'];
	$user_status=$user['user_mode'];
	$user_amount=$user['user_amount'];
	$user_mail=$user['user_mail'];
	$user_active_icons=$user['user_active_icons'];
	$user_icons_in_forum=$user['user_icons_in_forum'];
	$mail_name=$user['mail_name'];

	$kyberia->query("UPDATE user SET last_click=NOW() WHERE id=$user_id");

	// friends
	$fr_array = explode(";", $user['user_friends_serial']);
	foreach($fr_array as $frid)
		if (is_numeric($frid)){
			$friend_array[$frid] = $frid;
		}
}

//toto uz nejak nepouzivame
//turns on error reporting for mr. admin
if ($user_id!=38 && $_GET['debug']) error_reporting(0);


//veci ak sa pristupuje do fora
if ($action=='forum') {
//tu sa jedna o opravnenie na pristup do fora
	$access_type = '';
	$set=$kyberia->query("select access_type from node_access where node_type='forum' and node_id='$node_id' and user_id='$user_id'");
	if ($set->next()) {
		$access_type=$set->getString('access_type');
	}

//brutalne query na zistenie vsetkeho o fore a userovy
	$forumset=$kyberia->query("select user_forum.submission_count,forum_info.forum_info,category.category_name as category,user.login as owner_name,forum.*,user_forum.user_bookmark as bookmark from forum left join user_forum on (user_forum.forum_id=forum.forum_id and user_forum.user_id=$user_id) left join category on (category.category_id=forum.forum_category) left join user on (user.id=forum.forum_owner) left join forum_info on (forum_info.forum_id=forum.forum_id) where forum.forum_id='$node_id'");
	$forumset->next();
	$forum=$forumset->getRecord();

//hehe you don't have access
	if ($forum['forum_public']=='private' and !($forum['forum_owner']==$user_id OR $access_type=='access' or $access_type=='master' or $access_type=='op')) {
	        echo "toto forum je privatne. sorry";
          echo "<br>Ak chces pristup napis vlasnikovi fora";
          echo "<br>mal by to byt ".$forum['forum_owner'];
	        return;
	}

//ak uz mal pristup vo fore tak sa zapisalo bookmark
	if ($forum['bookmark']=='no' or $forum['bookmark']=='yes') {
//zapise sa "0 novych prispevkov"
		$q="UPDATE user_forum set submission_count=0,last_visit=NOW() where forum_id='$node_id' and user_id='$user_id'";
		$rows=$kyberia->update($q);
	}
//alebo sa vytvori zaznam v user_forum ak pristupuje do fora prvy krat
	else $kyberia->query("INSERT INTO user_forum set submission_count=0,forum_id='$node_id',user_id='$user_id'");
}

//db query ak bude vypis user info
elseif ($action=='userinfo') {

	$userinfoset=$kyberia->query("select * from user where id='$node_id'");
	$userinfoset->next();
	$userinfo=$userinfoset->getRecord();

}

//db query ak bude otvoreny dennik
elseif ($action=='journaux' && !empty($_GET['node_id'])) {

	$dennikset=$kyberia->query("select * from dennik where id='$node_id'");
	$dennikset->next();
	$dennik=$dennikset->getRecord();
}

//db query na otvorenie clanku
elseif ($action=='article' && !empty($node_id)) {
	$articleset=$kyberia->query("select * from articles where id_article='".$node_id."'");
	$articleset->next();
	$article=$articleset->getRecord();
}

//get_event sa asi pouziva na zmenu nalady
if ($_GET['get_event']) { include_once("get_eventz.inc"); }
//named butons event
if ($_POST['event']) { include("{$action}_eventz.inc"); }
//tomuto nechapem
if ($action=="session") $node_id=158;

// tiez neviem na co to tu je
$kyberia->updateUserData($user_id);

//ak sa ide registrovat novy user
include("header.inc");
if($action=='register') {
	echo "<table><tr><td width='125' valign='top'>";
	echo "</td><td width='600' valign='top'>";
	include_once("register.inc");
	echo "</td></tr></table>";
	die();
}


//ak nie je prihlaseny tak zobrazi ten velky obrazok kyberia
if (!$user_id) {
	echo "<a href=http://kyberia.sk/><img src=http://kyberia.sk/images/top.gif border=0></a><br>";
}

else echo "<br><br>";


?>

<table cellspacing=0 cellpadding=0>
<tr>
<td  align=right valign=top width=5>&nbsp;</td>
<!-- lavy stlpec -->

<?php
//nastavenia tabuliek
if ($action=="posta") echo "<td  align='left' valign='top' width='160'>";
elseif ($user_id AND $action!="journaux" AND $action!="listarticle") echo "<td  align='left' valign='top' width='150'>";
elseif ($action!="ludia") echo "<td  align='left' valign='top' width='150'>";

//ak nie je prihlaseny a neprezera si clanok
if (!$user_id AND $action!='article') {
//prida nahodny dennik
	include("randomzurno.inc");
	echo "<br>";
//najcitanejsie galerie
	include("top10galleries.inc");
	echo "<br>";
//neni toto blbost? alebo som si to nikdy nevsimol
//preco by sa tam mala zobrazovat anketa?
	include("poll.inc");
	echo "<br>";
//hladaj
	include("searchbox.inc");
	echo "<br>";
//najcitanejsie clanky
	include("mostread.inc");
	echo "<br>";
	include("outrobox.inc");
}

//zobrazenie zoznamu userov v dennikoch
elseif($action=='journaux') {
//	include("dennik_type.inc");
	include("allusers.inc");
}

//ak si prezera clanok
elseif($action=='article') {
//hlavicka clanku
	include("shortdesc.inc");
	echo "<br>";
//dalsie clanky v rubkike
	include("rubrikalist.inc");
	echo "<br>";
	$clanky=$kyberia->getArticle($_GET['node_id']);
	$clanky->next();
//zobrazi jednu fotku z galerie
	include("fotobox.inc");
	if ($clanky->getInt('autor')) {
	        $autor=$clanky->getInt('autor');
//zobrazi info o autorovi ak je nejake info k dispozicii
       		 include("userinfobox.inc");
	}

}

//ak sa zobrazuje forum
elseif($action=="forum") {
//zistenie ci nema ban
	if ($access_type=="ban" && $forum['forum_owner']!=$user_id) {
		$error=" V tomto fore si bol zabanovany. Smola.<br>";
	}

//inak pridaj info, anketu a statistiky
	else {
		include("foruminfo.inc");
		include("poll.inc");
		include("forumstats.inc");
	}

}

//zoznam clankov
elseif($action=="listarticle") {
	include("articles.inc");
}

//vstupny blabol pri registracii
elseif($action=="register") {
	include("registerinfo.inc");
}

//zobrazeni poslednych klubov v poslednych ;))
elseif($action=="posledne") {
	include("lastforum.inc");
}

//to je len smajlik
elseif($action=="karma") {
	include("karmabox.inc");
}


//userinfo ;)
elseif($action=="userinfo") {
	include("userinfobox.inc");
}

//adminove zalezitosti
elseif($action=="admin" && ADMIN) {
	include("admin/module_list.inc");
}

//to je prepinac v zobrazeni ludi
elseif($action=="ludia" || $action=="friends") {
	include("searchforumbox.inc");
	include("count.inc");
	echo "<br><br>";
	include("people_modules.inc");
}

else {
//ak sa nesplnila podmienka ani jednoho z predchadzajucich
//pridaj hladanie
	include("searchforumbox.inc");
//ak je to nieco ohladom bookmarkov pridaj odkaz na editaciu
	if ($action=="b00kmarkz" or $action=="b00kedit" or $action=="pridaj.b00kcat" or $action=="movebook"){
		echo ("<a href='?action=b00kedit'>editacia kategorii</a><br><br>");
	}
//ak niesu zobrazeny ludia tak pridaj zoznam aktivnych
	if($action!="ludia") include("active.inc");
}

?>

<!-- koniec laveho stlpca -->
<td  align=right valign=top width=10>&nbsp;</td>

<? if (!$user_id AND $action!="article") { ?>
<td align=left valign=top width=498>
<? } ?>

<? if (!$user_id AND $action=="article") { ?>
<td align=left valign=top width=598>
<? } ?>

<? if ($user_id) { ?>
<td align=left valign=top width='698'>
<? }

//ak nie je prihlaseny a je v registracii noveho uzivatela
if ($action=='register' AND (!$user_id)) {

	include("register.inc");
	echo "</td>";

}
?>

<?php
//statusbox je to male policko kde sa vzdy vypisuju chyby
include_once("statusbox.inc");

//v pripade ze je prihlaseny
if ($user_id) {

//tu sa zobrazuje oznamenie novych mailov
//a navigacna lista umiestnena hore pomocou css
	include("toolbar.inc");

	if ($action=="posta") include("posta.inc");
	elseif ($action=="b00kmarkz") include("bookmarks.inc");
//pridanie bookmarkovek kategorie
	elseif ($action=="pridaj.b00kcat") {include("addbookcat.inc"); include("bookedit.inc");}
//presun bookmarkov medzi kategoriami
	elseif ($action=="movebook") {include("movebook.inc"); include("bookedit.inc");}
//editacia kategorii
	elseif ($action=="b00kedit") include("bookedit.inc");
	elseif ($action=="newz") include("newz.inc");
	elseif ($action=="posledne") include("last.inc");
	elseif ($action=="karma") include("karma.inc");
	elseif ($action=="dennikadd") include("dennikadd.inc");
	elseif ($action=="searchforum") include("searchforum.inc");
	elseif ($action=="links") include("links.inc");

	elseif ($action=="pridaj.forum") include("addforum.inc");
//toto pouzival iba hromi ked vytvaral katedorie klubov
	elseif ($action=="pridaj.kategoriu") include("addcat.inc");
//nastavenia
	elseif ($action=='personalize') include("personalize.inc");
//registracia
	elseif ($action=='register') include("register.inc");
//adminovske polozky
	elseif ($action=='admin') {
		if ($_GET['subaction']) include("admin/".$_GET['subaction'].".inc");
		else include("admin/admin.inc");
	}

//momentalne nevyuzivana feature na oznamenie 23.2. session
	elseif ($action=='session') include("session.inc");
//priatelia
	elseif ($action=='friends') include("friends.inc");

	elseif ($action=='userinfo') include("userinfo.inc");
	elseif ($action=='ludia') {
//		include ("friends.inc");
		include("people.inc");
}

//vypis klubov
	elseif ($action=="list") include("forumlist.inc");
//vypis clanku
	elseif ($action=="article") include("show_article.inc");
//vo vyvoji?
	elseif ($action=="irc") {
		include("irc_form.inc");
		include("irc.inc");
	}
//vypis fora
	elseif ($action=='forum') include("forum.inc");
//vypis dennika
	elseif ($action=='journaux') include("journaux.inc");

	elseif ($action=='listarticle' or $action=='rubrika') include("list_articles.inc");

	else include("forumlist.inc");
}
//tieto tri riadky su uz ak je neprihlaseny
elseif ($action=='journaux') include("journaux.inc");
elseif ($action=='article') include("show_article.inc");
else include("list_articles.inc");

//nasleduje pravy stlpec
//myslim ze sa zobrazuje len na uvodnej stranke
?>

</td>

<? if (!$user_id AND $action!="article") { ?>
	<td align=right valign=top width=10>&nbsp;</td>
	<td height=100 style="border-color: #6dae42; border-width: 1pt;" height=100% valign=top width=100>
	<?php include("loginbox.inc"); ?>
	<?php include("navbox.inc"); ?>
	<?php include("mame_radi_box.inc"); ?>
	</td>
	</tr>
	<tr><td colspan=3><td align=right><?php include("next.inc"); ?>
	<tr><td colspan=6  align=center><?php //include("z.inc"); ?></td></tr>
<? }
//vypis casu tvorby stranky
echo "<tr><td colspan=9 align='center'>".SubStr((Time()+SubStr(MicroTime(),0,8)-$timer_start),0,7)."</td></tr>"; ?>
<tr><td colspan=9  align=center><?php include("tiraz.inc"); ?></td></tr>
</table>
</table>
</body>
</html>