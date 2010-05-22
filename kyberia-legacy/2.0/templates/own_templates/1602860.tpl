<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}


<br><br><br>

{assign var="cislo" value="450"}

<div style="margin-left:100px; background:#555; height:{$cislo}px; width:{math equation="((sqrt(5) + 1)/2)*x" x=$cislo}px; position: relative;">
   <div style="width:{$cislo}px; height:{$cislo}px; background:#111; float:left;"></div>
   <div style="width:{math equation="(((sqrt(5) + 1)/2)*x) - x" x=$cislo}px; height:{math equation="(((sqrt(5) + 1)/2)*x) - x" x=$cislo}px; background:#222;  float:right;"></div>
   <div style="width:{math equation="x - ((((sqrt(5) + 1)/2)*x) - x)" x=$cislo}px; height:{math equation="x - ((((sqrt(5) + 1)/2)*x) - x)" x=$cislo}px; background:#333;  float:right;"></div>
   <div style="width:{math equation="((((sqrt(5) + 1)/2)*x) - x) - (x - ((((sqrt(5) + 1)/2)*x) - x))" x=$cislo}px; height:{math equation="((((sqrt(5) + 1)/2)*x) - x) - (x - ((((sqrt(5) + 1)/2)*x) - x))" x=$cislo}px; background:#444; position:absolute; top: {math equation="x - (((((sqrt(5) + 1)/2)*x) - x) - (x - ((((sqrt(5) + 1)/2)*x) - x)))" x=$cislo}px; left:{$cislo}px;"></div>
</div>

<br><br>


<b>source::</b><br>
{literal}

{assign var="cislo" value="450"}<br>
<br>
&lt;div style=&quot;margin-left:100px; background:#555; height:{$cislo}px; width:{math equation=&quot;((sqrt(5) + 1)/2)*x&quot; x=$cislo}px; position: relative;&quot;&gt;
   <br>&nbsp;&nbsp;&lt;div style=&quot;width:{$cislo}px; height:{$cislo}px; background:#111; float:left;&quot;&gt;&lt;/div&gt;
   <br>&nbsp;&nbsp;&lt;div style=&quot;width:{math equation=&quot;(((sqrt(5) + 1)/2)*x) - x&quot; x=$cislo}px; height:{math equation=&quot;(((sqrt(5) + 1)/2)*x) - x&quot; x=$cislo}px; background:#222;  float:right;&quot;&gt;&lt;/div&gt;
   <br>&nbsp;&nbsp;&lt;div style=&quot;width:{math equation=&quot;x - ((((sqrt(5) + 1)/2)*x) - x)&quot; x=$cislo}px; height:{math equation=&quot;x - ((((sqrt(5) + 1)/2)*x) - x)&quot; x=$cislo}px; background:#333;  float:right;&quot;&gt;&lt;/div&gt;
   <br>&nbsp;&nbsp;&lt;div style=&quot;width:{math equation=&quot;((((sqrt(5) + 1)/2)*x) - x) - (x - ((((sqrt(5) + 1)/2)*x) - x))&quot; x=$cislo}px; height:{math equation=&quot;((((sqrt(5) + 1)/2)*x) - x) - (x - ((((sqrt(5) + 1)/2)*x) - x))&quot; x=$cislo}px; background:#444; position:absolute; top: {math equation=&quot;x - (((((sqrt(5) + 1)/2)*x) - x) - (x - ((((sqrt(5) + 1)/2)*x) - x)))&quot; x=$cislo}px; left:{$cislo}px;&quot;&gt;&lt;/div&gt;<br>
&lt;/div&gt;

{/literal}



