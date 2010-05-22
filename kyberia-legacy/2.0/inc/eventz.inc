<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


		include_once(SYSTEM_ROOT."/inc/eventz/$event.inc");
		$status=$event();

if ($status>1) {
	Header("Location: /id/".$status."/");
}

elseif ($status) {
	Header("Location: /id/".$node['node_id']."/");	
}


?>
