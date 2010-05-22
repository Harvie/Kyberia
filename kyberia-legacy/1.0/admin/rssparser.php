<?php
ini_set("include_path","/home/hromi1/kyberia/inc:/home/hromi1/kyberia/boxiky/");
include_once("kyberia.inc");
$kyberia = new CLASS_KYBERIA();

function strip_http_headers($text) {
   $text = str_replace("\r\n","\n",$text);
   $pozice = strpos($text,"\n\n");
   $text = trim(substr($text,$pozice+0,strlen($text)));
   return $text;
}

function unhtmlspecialchars($str) {
        $trans = get_html_translation_table(HTML_SPECIALCHARS);
        $trans = array_flip($trans);
        return strtr($str, $trans);
}


function steal($url) {
	$url=str_replace("http://","",$url);
	$i=strpos($url,"/");
	$hostname=substr($url,0,$i);
	$filename=substr($url,$i);
	$fp = fsockopen ($hostname, 80, $errno, $errstr, 30);
	if (!$fp) {
	    echo "$errstr ($errno)<br>\n";
	} else {
	    fputs ($fp, "GET /$filename HTTP/1.0\r\nHost: $hostname\r\n\r\n");
	    while (!feof($fp)) {
	        $rssdata.= fgets ($fp,128);
	    }
        fclose ($fp);
	return $rssdata;
	}
	
}

$rssdata=steal($_GET['datafeed']);
$rssdata=strip_http_headers($rssdata);
$rssdata=urldecode($rssdata);
include_once("xml/xmlarray.inc");

if (strstr($rssdata,"<rss")) $capsule="rss";
if (strstr($rssdata,"<rdf:RDF")) $capsule="rdf:RDF";
$parser = new xmlarray("",$capsule);
$pole=$parser->parse($rssdata);
print_r($pole);
if (empty($pole['channel']['item'])) $pole['channel']['item']=$pole['item'];
foreach ($pole['channel']['item'] as $item) {
	echo $item['title']."<br>";		
		if (! empty($item["link"])) {
			$md5=md5($item['link']);
			$set=$kyberia->executeQuery("select * from rss_news where news_md5='$md5'");
			if (!$set->getNumRows()) {
				$q="INSERT INTO rss_news set news_source='3',";
				$q.="news_title='".addSlashes(unhtmlspecialchars($item["title"]))."',";
				$q.="news_url='".addSlashes(unhtmlspecialchars($item["link"]))."'";
				$q.=",news_md5='$md5'";
				echo "<br>";
				echo "<a class=box href='",$item["link"],"'>";
				echo $item["title"],"</a>\n";
				if (!empty($item["description"])) {
				
					$q.=",news_desc='".addSlashes(strip_tags(unhtmlspecialchars($item['description'])))."'";
					echo "<br><b>",$item['description'],"</b><br>";
				}
				if (!empty($item['image'])) {
						if (!empty($item['image']['title'])) $q.=",news_image_title='".addSlashes(unhtmlspecialchars($item['image']['title']))."'";
					
						if (!empty($item['image']['link'])) $q.=",news_image_link='".addSlashes(unhtmlspecialchars($item['image']['link']))."'";
						if (!empty($item['image']['url'])) $q.=",news_image='".addSlashes(unhtmlspecialchars($item['image']['url']))."'";
				}

				elseif (!empty($pole['image'])) {
					$q.=",news_image_title='".addSlashes(unhtmlspecialchars($pole['image']['title']))."'";
					$q.=",news_image_link='".addSlashes(unhtmlspecialchars($pole['image']['link']))."'";
					$q.=",news_image='".addSlashes(unhtmlspecialchars($pole['image']['url']))."'";
				}
				else {
					$q.=",news_image_title='".addSlashes(unhtmlspecialchars($pole['channel']['image']['title']))."'";
					$q.=",news_image_link='".addSlashes(unhtmlspecialchars($pole['channel']['image']['link']))."'";
					$q.=",news_image='".addSlashes(unhtmlspecialchars($pole['channel']['image']['url']))."'";
				}
				
	
				$kyberia->executeUpdate($q);
	
			}
		}
}



?>
