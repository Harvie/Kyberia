<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
{if $user_id eq false}
  {include file="modules/loginbox.tpl"}
{/if}
{if $permissions.w eq true}
<table border="0" width="100%"> <tr><td valign="top" align="center" width="150px"> 
{include file="modules/node_settings.tpl"}
{include file="modules/get_poll_box.tpl"}
{include file="modules/get_bookmark_statistics_box.tpl"}
</td><td valign="top">
{include file="modules/node_content.tpl"}
<table border="0px" width="666px" cellpadding="0px" cellspacing="0px" class="bordered"><tr><td>
{php}
  if ($f = fopen("https://www.hysteria.sk/~w/90_list","r")) {
    echo "<small>H-K</small><br>";
  } elseif ($f = fopen("https://www.x86.sk/~w/90_list","r")) {
    echo "<small>X</small><br>";
  } elseif ($f = fopen("http://www.gamca.sk/~kewo/90_list","r")) {
    echo "<small>S</small><br>";
  }
  if ($f) {
    echo "  <table border='0px' cellpadding='2px' cellspacing='5px'>    <tr><th>Artist</th><th>Single</th><th>Download</th><th>Provided by:</th></tr>";
    while (($str = fgetcsv($f,4096,"|")) !== FALSE) {
      if (count($str)>3) {
        echo "    <tr><td>" . $str[0] . "</td><td>" . $str[1] . "</td><th><a href='" . $str[2] . "' title='" . $str[0] . " - " . $str[1] . "'>Click!</a></th><td>" . $str[3] . "</td></tr>";
      }
    }
    fclose($f);
    echo "  </table>";
  } else {
    echo "<span style='color: red;'>Houston, Houston, We've got a problem! - no soundlisting available</span>";
  }
{/php}
</td></tr></table>
<form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'>
{include file="modules/addnode.tpl"}
{include file="modules/get_threaded_children.tpl" children_type=4}
</form>
</td></tr></table>
{include file="modules/footer.tpl"}
{/if}
<author>tpl by frr && w</author>