<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
<META http-equiv="Default-Style" content="kyberia">
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='/id/1530392/download'>
<title>summer||sun</title> 
</head>
<body> 
    <div style="margin-left:7px" class="headermnu">
       <form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
       
       <a href='/id/1/'>main</a>|
       <a href='/id/101/'>kyberia</a>|
       <a href='/id/19'>bookmarks</a>|
       <a href='/id/24'>posta</a>|
       <a href='/id/23'>posledne</a>|
       <a href='/id/15'>k</a>|
       <a href='/id/27'>ludia</a>|
       <a href='/id/21'>denniky</a>|
       <a href='/id/25'>search</a>|
       <a href='/id/1017832'>help</a>|
       <a href='/id/{$user_id}/configure'>nastavenie</a>|
       <input type='submit' value='logout' name='event' tabindex='23' style="border:0; color:#c90; background:#fff;">
       
       </form>

    </div>
    <div class="head"></div>
    <div id="fotky">
    <img src="http://x86.sk/~marin/summer/nfarkt.png">
    <img src="http://x86.sk/~marin/summer/lvnn.png">

    <img src="http://x86.sk/~marin/summer/lvn.png">
    <img src="http://x86.sk/~marin/summer/pha.png">
    <img src="http://x86.sk/~marin/summer/mr.png">
    <img src="http://x86.sk/~marin/summer/ml.png">
    <img src="http://x86.sk/~marin/summer/ostnd2.png">
    <img src="http://x86.sk/~marin/summer/ohshiit.png">
    <img src="http://x86.sk/~marin/summer/antw.png">
    <img src="http://x86.sk/~marin/summer/ostnde.png">
    <img src="http://x86.sk/~marin/summer/antwp.png">

    <img src="http://x86.sk/~marin/summer/amster.png">
    <img src="http://x86.sk/~marin/summer/goa.png">
    <img src="http://x86.sk/~marin/summer/gla.png">
    <div id="gsa"></div>
    <div id="lk"></div>
    <img src="http://x86.sk/~marin/summer/tnan.png">
    <img src="http://x86.sk/~marin/summer/DSC0837tr3.png">
    </div>
    <div class="header"><h1>SUMMER<span class="nd" style="margin-right: 20px;">04</span> |fragments<span class="nd">from</span>the<span class="nd">broken</span>segments</h1></div>

    <div class="top a"></div>
    <div id="cnt">posledny
vecer v bruseli rastovi ukradli tasku... bola tam cokolada,
komixy bunda naake veci a fotak s celym prislusenstvom, filmami... cize
toto su fotky z mojho a matusovho digitalu ale ja som fotil len obcas a
tak vselijak<span style="color: black;">pod niektorymi fotkami su ine obrazky ale pod vecinou nie =]</span></div>
<div id="cnt1">
<div style="float: left;">
node: <a href='/id/{$node.node_id}'>{$node.node_name}</a><br>
parent:</td><td><a href='/id/{$node.node_parent}'>{$node.node_parent_name}</a><br>
owner: <a href='/id/1538'>MARIN</a>
<span class="stats"><br><br>
<a href='/id/{$node.node_id}/neurons'>neurons</a>|

<a href='/id/{$node.node_id}/1961037'>statistics</a>|
<a href='/id/{$node.node_id}/links'>links</a>|
<a href='/id/{$node.node_id}/print'>print</a>|
<a href='/id/15/000000000000{$node.node_id}'>k</a></div><div class="butt">
<form action='/id/{$node.node_id}/' method='post'></span>
{if $node.node_bookmark neq 'yes'}
<input type='submit' name='event' value='book'>
{else}
<input type='submit' name='event' value='unbook'>
{/if}
<input type='submit' name='event' value='K'>
</form>
</div><br style="clear:left;">
</div>

<div id="sub">{include file="modules/get_threaded_children.tpl"}</div>
<div id="add">{if $permissions.w eq true}
<form enctype="multipart/form-data" action='/id/{$node.node_id}/
' method='post' name='formular'>
title or keywords:: <input type='text' name='node_name'> <input type='checkbox' name='no_html' value='yes'><td valign='middle'>&nbsp;NO HTML<br>
<textarea name='node_content'></textarea><br>
<input type='submit' name='event' value='add'><input type='submit' name='template_event' value='preview'>

<input type='hidden' name='get_children_offset' value='0'><input type='submit' name='get_children_move' value='&lt;'><input type='submit' name='get_children_move' value='&lt;&lt;'><input class='small' name='listing_amount' type='text' value='42'>
<input name='get_children_move' type='submit' value='&gt;&gt;'><input type='submit' name='get_children_move' value='&gt;'><input type='submit' name='template_event' value='filter_by'><select name='search_type'><option value='user'>user</option><option value='content'>content</option>

</select><input type='hidden' name='node_parent' value='{$node.node_id}'></form>
{/if}</div>
    </body></html>
  





