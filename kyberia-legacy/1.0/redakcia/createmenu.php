<?php
echo "<pre>";
include("../inc/redakce.inc");
$redakce=new CLASS_REDAKCE();
include("../inc/form.inc");
$redakce->createMenu();
echo "</pre>";
?>
