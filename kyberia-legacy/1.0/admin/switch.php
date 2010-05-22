<?php
passthru('/home/hromi1/kyberia/cvs_export.sh');
sleep(5);
passthru('/home/hromi1/kyberia/cvs_update.sh');
?>
