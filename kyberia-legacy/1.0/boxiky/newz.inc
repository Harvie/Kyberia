<center><b>pure beta version. syndicating Internet sources</b></center><br> 
<?php
$q="select * from rss_news order by news_id desc";
$set=$kyberia->query($q);
while ($set->next()) {
	echo "<table><tr><td><img width='73' src='".$set->getString('news_image')."'></td>";
	echo "<td valign='top'><a target='_blank' href='".$set->getString('news_url')."'>".$set->getString('news_title')."</a><br>";
	if ($set->getString('news_desc')) echo $set->getString('news_desc');
	echo "</td>";
	echo "</table>";
}
?>