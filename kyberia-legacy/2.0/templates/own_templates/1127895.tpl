<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
<title>{$user_id}@kyberia.sk</title>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<style type="text/css">
body {
 color : #1d42ae;
 font-size: 8pt;
 font-family: Verdana;
 text-decoration: none; 
 margin: 0px;
 background-color: #000000;
}
.t1 {
 position: fixed;
 top: 0px;
 left: 0px;
 text-align: center;
 background-color: transparent;
 width: 100%;
 height: 20px
}
inframe {
 width: 90%;
 height:230px
}
textarea.small {
 width: 90%;
 height : 42px;
 border-color: #1d42ae;
 background-color: transparent;
 overflow: hidden;
 font-color: white;
 color: white
}
a {
 color: white;
 font-size: 8pt;
 font-family: Verdana;
 text-decoration: none
}
a:hover {
 color: white;
 font-size: 8pt;
 font-family: Verdana;
 text-decoration: none;
 border-bottom: 1px solid red
}
td {
 font-size: 8pt;
 font-family: Verdana;
 wordwrap: break-word
}
table[width="666"] {background: #111}
.bordered, .bordered2 {
 border: solid 0px #1d42ae;
 border-bottom: solid 1px #333333;
 background: #000000
}
input {
 color: white;
 font-size: 8pt;
 font-family: Verdana;
 background-color: transparent;
 vertical-align: middle;
 border: solid 1px #1d42ae; height: 18px
}
input.small {
 color: white;
 font-size: 8pt;
 font-family: Verdana;
 background-color: transparent;
 width: 50px;
 vertical-align: middle;
 border: solid 1px #1d42ae;
 height: 18px
}
select {
 color: white;
 font-size: 8pt;
 font-family: Verdana;
 background-color: #000000;
 width: 80px;
 vertical-align: middle;
 border: solid 1px #1d42ae; height: 18px
}
.header {
 background: #020202;
 border-bottom: solid 1px #1d42ae;
 height: 100%;
 width: 100%;
 vertical-align: top;
 align: left;
 padding: 0pt; width: 100%
}
.important {
 font-weight: bold;
 text-align: center
}
.most_important {
 font-weight: bold;
 font-color: red;
 color: red
}
textarea {
 width: 666px;
 height: 123px;
 background-color: transparent;
 border: 1px solid #1d42ae;
 color: white;
 font-family: monospace;
 font-size: 8pt
}
</style>
{if $node.node_name eq 'mail'}
<script>
function vymena() {ldelim}
document.formular.mail_to.value=document.formular.mail_to.value.toLowerCase();
document.images['fricon'].src='/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}
function chngto(name,id) {ldelim}
document.formular.mail_to.value=name;
name=name.toLowerCase();
document.images['fricon'].src='/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}
</script>
{/if}
</head>
<body>
<form enctype="multipart/form-data" action='/id/{$user_id}/' method='post'>
<div class="t1">
<a href='/id/1/'>main</a> ---
<a href='/id/101/'>kyberia</a> ---
<a href='/id/19'>bookmarks</a> ---
<a href='/id/24'>posta</a> ---
<a href='/id/23'>posledne</a> ---
<a href='/id/15'>k</a> ---
<a href='/id/27'>ludia</a> ---
<a href='/id/21'>denniky</a> ---
<a href='/id/25'>search</a> ---
<a href='/id/1127895/configure'>layout_edit</a> ---
<a href='/id/{$user_id}/configure'>{$user_id}/conf</a> -----
<input type='submit' value='isc het' name='event' tabindex='23'>
</div>
</form>
