<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
{if $node.node_name eq 'mail'}
<script>
function vymena() {ldelim}
document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}

function chngto(name,id) {ldelim}
document.formular.mail_to.value = name ;
name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}
</script>
{/if}
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<!--<link rel='stylesheet' type='text/css' href='id/1402531/download'>-->
<style>
body
{
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 11px;
	background: #f4f4f4;
	color: #000000;
}
table
{
	background: #f4f4f4;
}
td
{
	font-size: 11px;
	text-align: left;
}
a
{
	color: #505050;
	text-decoration: none;
}
a:hover
{
	color: #005EB9;
	text-decoration: underline;
}
input, select, option, textarea
{
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 11px;
	background: #ffffff;
	color: #505050;
	margin: 0px;
}

.active_users
{
	background: #f4f4f4;
}
.active_user
{
	float: left;
}
.important
{
	font-weight: bold;
	padding: 20px;
	clear: both;
}
.most_important
{
	color: #c00000;
	font-size: 10px;
}
#dmenu
{
	float: right;
	border: 1px solid #505050;
	position: fixed;
	right: 5px;
	z-index: 5;
}
#dmenu div
{
	padding: 5px;
	text-align: right;
}
img
{
	padding: 2px;
	border: 1px solid #505050;
	margin: 2px;	
	background: #a0a0a0;
}
img:hover
{
	background: #00BFFF;
	padding: 2px;
	border: 1px dashed #c00000;
	margin: 2px;	
}
div:hover
{
	background: #F5F5DC;
}
#dmenu div:hover, a:hover
{
	background: #F0F8FF;
}
input, textarea
{
	border: 1px solid #000000;
}
input[type=hidden]
{
	visibility: hidden;
	display: none;
}
textarea
{
	width: 90%;
	height: 120px;
}
table td table td table
{
	border: 1px dashed #c0c0c0;
	border-collapse: collapse;
	padding: 4px;
}
table td table td table:hover
{
	background: #F5F5DC;
	border: 1px dashed #c00000;
	border-collapse: collapse;
}
table td table td table td
{
	padding: 4px;
}
input[type=button], input[type=submit]
{
	border: 1px solid #505050;
	background: #F0F8FF;
}
input:hover, textarea:hover
{
	border: 1px dashed #c00000;
}
input:focus, textarea:focus
{
	border: 1px solid #c00000;
}
.header
{
	border-bottom: 1px dashed #c00000;
}
#dmenu
{
	background-image: url(http://www.kyberia.sk/id/1402466/download);
	width: 140px;
}
#dmenu:hover
{
	border: 1px solid #c00000;
}
#bdy
{
	padding-right: 160px;
}
#bdy inner:hover, #bdy:hover
{
	background-color: #f4f4f4;	
}
font
{
	color: #505050;
	size: 11px;
}
</style>
<title>{$user_id}@{$node.node_name}</title>
</head>
<body>
<div id="dmenu">
	<div><a href='/id/1/'>MAIN</a></div>
	<div><a href='/id/101/'>CATS</a></div>
	<div><a href='/id/19'>BOOK</a></div>
	<div><a href='/id/24'>MAIL</a></div>
	<div><a href='/id/23'>LAST</a></div>
	<div><a href='/id/15'>TOP K</a></div>
	<div><a href='/id/27'>PEOPLE</a></div>
	<div><a href='/id/21'>BLOGZ</a></div>
	<div><a href='/id/{$user_id}/'>ME</a></div>
	<div><a href='/id/{$user_id}/configure'>CONF</a></div>
{if $user_id eq '1371'}
	<div><a href='/id/1401906/configure'>TPLCONF</a></div>
	<div><a href='/id/1402531/configure'>CSSCONF</a></div>
{/if}
	<div>
		<form enctype="multipart/form-data" action='/id/24/' method='post'>
			<input type='hidden' name='event' value='logout'>
			<input type='submit' value='LOGOUT' tabindex='23'>
		</form>
	</div>
</div>
<div>
{if $new_mail eq true}
<center><a href='/id/24'><b>u have {$new_mail} new mail,last from {$new_mail_name}</b></a></center>
{/if}

{if $error eq true}
<center><span align='center' class='most_important'>{$error}</span></center>
{/if}
</div>
<div id=bdy>
<div class=inner>


