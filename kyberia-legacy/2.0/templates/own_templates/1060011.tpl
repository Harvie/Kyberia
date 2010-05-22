<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

&lt;html&gt;
&lt;head&gt;
&lt;meta http-equiv=&quot;Cache-Control&quot; content=&quot;Public&quot;&gt;
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=windows-1250&quot;&gt;
&lt;!--
YOU CAN PUT YOUR OWN CSS SKIN HERE!!!
&lt;link rel='stylesheet' type='text/css' href='/data/css/zabke.css'&gt;
--&gt;
&lt;link rel='stylesheet' type='text/css' href='/data/css/kyberia.css'&gt;
&lt;title&gt;kwak&lt;/title&gt;
{if $node.node_name eq 'mail'}
&lt;script&gt;
function vymena() {ldelim}
document.formular.mail_to.value = document.formular.mail_to.value.toLowerCase() ;
document.images['fricon'].src = '/images/users/'+document.formular.mail_to.value+'.gif';
{rdelim}

function chngto(name,id) {ldelim}
document.formular.mail_to.value = name ;
name = name.toLowerCase() ;
document.images['fricon'].src = '/images/nodes/' +id.substr(0,1)+'/'+id.substr(1,1)+'/'+id+'.gif';
{rdelim}
&lt;/script&gt;
{/if}


&lt;/head&gt;

&lt;body&gt;
&lt;center&gt;&lt;span align='center' class='most_important'&gt;23&lt;/span&gt;&lt;/center&gt;

&lt;!-- here you can realize yourself --&gt;
&lt;center&gt;
&lt;a href='/id/1/'&gt;main&lt;/a&gt; ----
&lt;a href='/id/101/'&gt;kyberia&lt;/a&gt; ----
&lt;a href='/id/19'&gt;bookmarks&lt;/a&gt; ----
&lt;a href='/id/24'&gt;posta&lt;/a&gt; ----
&lt;a href='/id/23'&gt;posledne&lt;/a&gt; ----
&lt;a href='/id/15'&gt;k&lt;/a&gt; ----
&lt;a href='/id/27'&gt;ludia&lt;/a&gt; ----
&lt;!-- &lt;a href='/id/20'&gt;clanky&lt;/a&gt; ---- --&gt;
&lt;a href='/id/21'&gt;denniky&lt;/a&gt; ----
&lt;a href='/id/29'&gt;news&lt;/a&gt; ----
&lt;a href='/id/25'&gt;search&lt;/a&gt; ----
&lt;a href='/id/1017832'&gt;ZACINAME S KYBERIOU&lt;/a&gt; ----
&lt;a href='/id/{$user_id}/configure'&gt;nastavenie&lt;/a&gt; -----
&lt;input type='submit' value='logout' name='event' tabindex='23'&gt;
&lt;/center&gt;
&lt;/form&gt;

