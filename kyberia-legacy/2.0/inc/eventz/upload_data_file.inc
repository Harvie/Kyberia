<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

	function upload_data_file() {

		global $db,$error,$node;
		$node_id=$node['node_id'];
		$node_template=$_POST['node_template'];
		require(SYSTEM_ROOT.'/inc/filez.inc');
		$suffix = array_pop(explode('.', basename($_FILES['data_file']['name'])));
	        if (!is_dir(FILE_DIR.$_SESSION['user_id'])) {
       		         mkdir(FILE_DIR.$_SESSION['user_id']);
       		}
		
		if ($suffix=='zip' && $_POST['unzip']) {
			mkdir(TMP."/".$_FILES['data_file']['name']);
			$cmd="unzip ".$_FILES['data_file']['tmp_name']." -d ".TMP."/".$_FILES['data_file']['name'];
			shell_exec($cmd);	
			$handle=opendir(TMP."/".$_FILES['data_file']['name']);

			while (($file = readdir($handle))!==false) {
				if ($file!="." && $file!="..") {
					$node_params['node_name']=$file;
					$node_params['node_creator']=$_SESSION['user_id'];
					if ($_POST['gallery']) $node_params['template_id']="1041658";
					else $node_params['template_id']=12;
					$node_params['node_parent']=$node['node_id'];

					$node_params['node_content']=$file;
					$datanode_id=nodes::addNode($node_params);
					$file_suffix = array_pop(explode('.', basename($file)));
					copy(TMP."/".$_FILES['data_file']['name']."/".$file,FILE_DIR.$_SESSION['user_id'].'/'.$datanode_id.".$file_suffix");
					symlink(FILE_DIR.$_SESSION['user_id'].'/'.$datanode_id.".$file_suffix",SYSTEM_ROOT.'/files/'.$datanode_id);
					if ($_POST['gallery']) {
						$image=TMP."/".$_FILES['data_file']['name']."/".$file;
						$image_name=$file;
						$width=NODE_IMAGE_WIDTH;

						if (stristr($image_name,".jpg") || stristr($image_name,".jpeg") ){
		        			        $cmd=UTILZ_DIR."/jpegtopnm  $image |".UTILZ_DIR."/pnmscale -width=$width | ".UTILZ_DIR."ppmquant 256 |".UTILZ_DIR."ppmtogif >".SYSTEM_ROOT."images/nodes/".substr($datanode_id,0,1)."/".substr($datanode_id,1,1)."/".$datanode_id.".gif";
						}
					        elseif (stristr($image_name,".gif")) {
			        		        $cmd=UTILZ_DIR."/gifsicle --resize ".$width."x_ $image > ".SYSTEM_ROOT."images/nodes/".substr($datanode_id,0,1)."/".substr($datanode_id,1,1)."/".$datanode_id.".gif";
				        	}
						if ($cmd) {
							shell_exec($cmd);
						}

echo $cmd;	
				}

				}
			}
			closedir($handle);
die();
		}

		else {
			copy($_FILES['data_file']['tmp_name'],FILE_DIR.$_SESSION['user_id'].'/'.$node['node_id'].".$suffix");
			symlink(FILE_DIR.$_SESSION['user_id'].'/'.$node['node_id'].".$suffix",SYSTEM_ROOT.'/files/'.$node['node_id']);
		}


		}		

?>