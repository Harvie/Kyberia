<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


function smarty_modifier_preview($node_content)
{

                if (!empty($_POST['no_html'])) {
                        $node_content=htmlspecialchars($node_content);
                }

                require(SYSTEM_ROOT.'/inc/htmlparse.inc');
		global $htmlparse;
                htmlparse::htmlparse($node_content);

                if (!empty($htmlparse)) {
                        $error=$htmlparse;
      			echo "<span class='most_important'> $error </span>";
			return false;
                }
	
	        $node_content = EregI_Replace("((( )|(\n)|(^))+)(http://|ftp://|https://)([[:alnum:]][^,[:space:]]*)","\\2<a target='_blank'href=\"\\6\\7\">\\6\\7</a>",$node_content);
		$node_content=strip_tags($node_content,'<a><b><i><u><img><br><p><font>');
                $node_content=str_replace("\n","<br>",$node_content);
		return $node_content;

}

/* vim: set expandtab: */

?>
