<?php
$set=$kyberia->query("select * from forum where forum_id='$forum_id'");
$set->next();
?>

<form method='post' action='/index.php'>
<input type='hidden' name='action' value='forumedit'>
<input type='hidden' name='forum_id' value='<?=$forum_id?>'>
<input type='text' class='bigtextinput' name='forum_name' value='<?=$set->getString('forum_name')?>'>
<input type='text' class='bigtextinput' name='forum_owner' value='<?=$set->getString('forum_owner')?>'>
<input type='file' class='bigtextinput' name='forum_icon'>
<textarea class='personal' name='forum_info' cols='23' rows='10'><?=$set->getString('forum_info')?></textarea>

<br>
<?php
echo "LALALALA";
include("./polladmin.inc");
?>
