<?
include_once("./inc/kyberia.inc");

$set=$kyberia->query("INSERT INTO category set category_name='$category_name',category_parent='$category_parent',category_owner='$user_id'");
$lastid=$kyberia->getLastInsertId();
?>
