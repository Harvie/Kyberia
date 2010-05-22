<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{$error}
{if $permissions.r neq true} you don't have permissions for viewing this data node{/if}
{if $user_id eq false}
<table><tr><td>login::</td><td> <input tabindex=1 accesskey=l type='text' name='login'></td>
<tr><td>heslo::</td><td><input tabindex=2 accesskey=p type='password' name='password'></td>
<tr><td colspan='2' align='center'><input tabindex=3 type='submit' name='event' value='login'></td></tr></table>
{/if}
