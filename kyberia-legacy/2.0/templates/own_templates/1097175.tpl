<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<html>
<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='/id/1079588/download'>
<title>komunitny diskusny system alternativa.sk</title>
</head>
<body>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}' method='post'>
{$error}
{if $permissions.r neq true}Prosim prihlas sa do systemu alternativa.sk{/if}
{if $user_id eq false}
<table><tr><td>login::</td><td> <input tabindex=1 accesskey=l type='text' name='login'></td>
<td>&nbsp;password::</td><td><input tabindex=2 accesskey=p type='password' name='password'></td><td>
<input tabindex=3 type='submit' name='event' value='login'></td></tr></table>
<script language="JavaScript" type="text/javascript">
<!--
document.write("<input type='hidden' name='screen_width' value='" + screen.width +
"'><input type='hidden' name='screen_height' value='" +
screen.height + "'>");
// -->
</script>
{else}
<center>Bol si úspešne prihlásený. <a href='/alternativa.sk'>Prosím vstúp.</a></center>
{/if}

</form>
</body>
</html>







