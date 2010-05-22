<?php

	$set=$kyberia->query("select count(*) as pocet from session");
	$set->next();
	$pocet=$set->getString('pocet');
	echo "<center><b>kyberiou momentalne browsi $pocet id.entit</b></center><br>";


?>