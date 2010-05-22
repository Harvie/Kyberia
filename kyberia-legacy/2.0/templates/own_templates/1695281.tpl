<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<b>utility: header_template rescue</b> <br/>
{php}
if (isset($_POST['id_usera'])) {
 echo "formular set_header_template pre user id " . $_POST['id_usera']; 
 echo "<form action='/id/";
 echo $_POST['id_usera'];
 echo "' method='post'><input type='text' name='header_id' value='";
{/php}
{$header_id}
{php}
 echo "'><input type='submit' name='event' value='set_header_template'></form>";
} else {
 echo "zadaj ID nody usera ";
}
{/php}
<form action='http://kyberia.sk/id/1695281/' method='post'>
<input type='text' name='id_usera'>
<input type='submit' value='vygeneruj set_header_template formular' name='submit'>
</form>
</body>
</html>

