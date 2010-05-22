<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{if $header_id neq true}
<html>
<head>
<META http-equiv="Default-Style" content="kyberia">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' title="kyberia" type='text/css' href='/data/css/kyberia.css'>
<title>analyza dokazala hovno</title>
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
</head>

<body>
{if $user_id eq true}{include file="modules/toolbar.tpl"}{/if}
{if $error eq true}<center><span class='most_important'>{$error}</span></center>{/if}
{if $new_mail eq true}<center><a href='/id/24/' class='mail'>u have {$new_mail} new mail,last from {$new_mail_name}</a></center>{/if}
<!--<span class='most_important'>dnes v noci od 23:23 bude niekolko hodin kyberia vypnuta, vdaka za pochopenie</span>-->
{/if}


{if $error eq true}
<center><font style='error'>{$error}</font></center>
{/if}

{if $user_id eq false}
<center>{include file="modules/loginbox.tpl"}</center>

{else}

<table width='100%'><tr>

<!--left column-->
<td valign='top' align='center' width='23%'>
{include file="modules/node_settings.tpl"}
{include file="modules/userinfo.tpl"}

</td>
<!--end of left column-->

<td valign='top'>
{get_neurons user_id=$node.node_id}
<table class='bordered'>
{foreach from=$get_dendrites item=synapse}
<tr><td>
<a href='/id/{$synapse.node_id}'>{$synapse.node_name}</a>
</td></tr>
{/foreach}
</table>
</td>
<td valign='top'>
<table class='bordered'>
{foreach from=$get_axons item=synapse}
<tr><td>
<a href='/id/{$synapse.node_id}'>{$synapse.node_name}</a>
</td></tr>
{/foreach}
</table>

</td>

<!--end of central column-->

</td></tr></table>
{/if}

