<table width=100% class=box><tr><td>
<?
global $mailinfo;
if (IsSet($mailinfo)) {
	$kyberia->addMailinfo($mailinfo);
}
else {
	$kyberia->showMailinfo($mailinfo);
}

?>
</td></tr></table>
