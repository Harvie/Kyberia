






























<?php
include('kyberia.inc');
class CLASS_HYPERTEXT extends CLASS_KYBERIA {


function CLASS_HYPERTEXT() {
	$this->CLASS_KYBERIA();
} 

function explodeText($id) {
	$set=$this->query("SELECT text1 from articles where id_article='$id'");
	$set->next();
	$text=$set->getstring("text1");
	$text=str_replace("."," ",$text);
	$text=str_replace(","," ",$text);
	$text=str_replace("?"," ",$text);
	$bomb=explode(" ",$text);
	foreach ($bomb as $slovo) {
		if (strlen($slovo)>4 AND !strstr($slovo,">") AND !strstr($slovo,"<"))$slova[]=$slovo;
	}
	echo "<table>";
	foreach ($slova as $slovo) {
		echo "<tr><Td>$id</td><Td>$slovo</td></tr>";
	} 
}
// >------------------------------koniec metod---------------<
}
?>