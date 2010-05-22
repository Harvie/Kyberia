<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
	<meta http-equiv="Default-Style" content="kyberia">
	<meta http-equiv="Cache-Control" content="Public">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
	<link rel='stylesheet' title="kyberia" type='text/css' href='http://www.hladat.sk/xyzz/data/style.css'>
	<title>{$node.node_name|strip_tags}</title>
	<script type="text/javascript" src="http://www.hladat.sk/xyzz/data/script.js"></script>
</head>
<body>
<form enctype="multipart/form-data" action='/id/2240/' method='post'>
	<ul id="menu">
		<li><a href='/id/1/'>main</a> | <a href='/id/101/'>kyberia</a> | <a href='/id/1141046'>search</a></li>
		<li><a href='/id/1451158'>bookmarks</a></li>
		<li><!--<a href='/id/1453990'>--><a href='/id/24'>
	{if $new_mail eq true}
		<strong>{$new_mail} ({$new_mail_name})</strong>
	{else}
		posta
	{/if}</a></li>
		<li><a href='/id/23'>posledne</a></li>
		<li><a href='/id/1451091'>k</a></li>
		<li><a href='/id/27'>ludia</a></li>
		<li><a href='/id/21'>denniky</a></li>
		<li><a href='/id/{$user_id}/configure'>nastavenie</a> | <a href='/id/{$user_id}/'>profile</a> | <a href='/id/1635488/forum'>tmp</a></li>
		<li><a href='/id/{$node.node_id}/configure'>E </a>|<a href='/id/{$node.node_id}/forum'> F </a>|<a href='/id/{$node.node_id}/stats'> S</a></li>
		<li><input type='submit' value='logout' name='event' tabindex='23'></li>
	</ul>
</form>