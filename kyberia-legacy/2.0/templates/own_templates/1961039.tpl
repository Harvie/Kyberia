<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<?xml version="1.0" encoding="windows-1250"?>
<feed xmlns="http://www.w3.org/2005/Atom">

 <title>Kyberia ATOM feed for user {$username}</title>
 <subtitle>Osobny ATOM feed</subtitle>
 <link href="http://kyberia.sk"/>
 <updated>2003-12-13T18:30:02Z</updated> <!-- blabla -->
 <author>
   <name>Kyberia server</name>
   <email>kyberia@kyberia.sk</email>
 </author>
 <id>urn:uuid:91272321-8291-4343-2323-883472371823</id>

{get_atom}

{foreach from=$get_atom item=child}
 <entry>
   <title>{$child.node_name}</title>
   <link rel="alternate" type="text/html" href="http://kyberia.sk/id/{$child.node_id}"/>
   <id>{$child.node_id}</id>
   <updated>2003-12-13T18:30:02Z</updated>                 <!-- pozriet -->
   <summary>{$child.node_content}</summary>
 </entry>
{/foreach}

</feed>




