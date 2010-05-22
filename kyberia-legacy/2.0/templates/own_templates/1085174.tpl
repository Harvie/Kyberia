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

&lt;link rel='stylesheet' type='text/css' href='http://freezy.wnet.sk/kyberia/template.css'&gt;
&lt;title&gt;FRZ | &lt;/title&gt;
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

&lt;center&gt;
&lt;a href='http://stupavacrew.wz.cz' target='_blank'&gt;stupava.crew&lt;/a&gt; ::
&lt;br&gt;
&lt;a href='/id/1/'&gt;uvod&lt;/a&gt; ::
&lt;a href='/id/101/'&gt;stromovica&lt;/a&gt; ::
&lt;a href='/id/19'&gt;booknute&lt;/a&gt; ::
&lt;a href='/id/24'&gt;posta&lt;/a&gt; ::
&lt;a href='/id/23'&gt;posledne&lt;/a&gt; ::
&lt;a href='/id/15'&gt;k!&lt;/a&gt; ::
&lt;a href='/id/27'&gt;ludia&lt;/a&gt; ::
&lt;a href='/id/20'&gt;clanky&lt;/a&gt; ::
&lt;a href='/id/21'&gt;denniky&lt;/a&gt; ::
&lt;a href='/id/29'&gt;novinky&lt;/a&gt; ::
&lt;a href='/id/25'&gt;hladat&lt;/a&gt; ::
&lt;a href='/id/64799'&gt;stupava&lt;/a&gt; ::
&lt;a href='/id/{$user_id}/configure'&gt;nastavenia&lt;/a&gt; :::
&lt;input type='submit' value='OFF' name='event' tabindex='23'&gt;
&lt;/center&gt;
&lt;/form&gt;
{if $new_mail eq true}
&lt;center&gt;&lt;a href='/id/24'&gt;&lt;b&gt;u have {$new_mail} new mail,last from {$new_mail_name}&lt;/b&gt;&lt;/a&gt;&lt;/center&gt;
{/if}

{if $error eq true}
&lt;center&gt;&lt;span align='center' class='most_important'&gt;{$error}&lt;/span&gt;&lt;/center&gt;
{/if}
