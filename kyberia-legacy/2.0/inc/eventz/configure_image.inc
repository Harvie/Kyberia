<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


	function configure_image() {

		global $db,$error,$node;
		$user_id=$_SESSION['user_id'];

		if ($node['node_permission']=='owner') {			

		if (!empty($_FILES['description_image']['tmp_name'])) {
	      		$image_tmp=$_FILES['description_image']['tmp_name'];
	      		$image_name=$_FILES['description_image']['name'];

			if ($node['node_id']==$user_id) $width=50;
			else $width=NODE_IMAGE_WIDTH;
                        
                        // mifo:
                        
                        $output_image = "images/nodes/".substr($node['node_id'],0,1)."/".substr($node['node_id'],1,1)."/".$node['node_id'].".gif";
                        
			if (stristr($image_name,".jpg") || stristr($image_name,".jpeg") || stristr($image_name,".gif")){
                                // mifo:
                                // $cmd=UTILZ_DIR."/jpegtopnm  $image |".UTILZ_DIR."/pnmscale -width=$width | ".UTILZ_DIR."ppmquant 256 |".UTILZ_DIR."ppmtogif >".SYSTEM_ROOT."images/nodes/".substr($node['node_id'],0,1)."/".substr($node['node_id'],1,1)."/".$node['node_id'].".gif";
                                // workaround by mifo:
                                if (stristr($image_name,".jpg") || stristr($image_name,".jpeg"))
                                    $orig = imagecreatefromjpeg($image_tmp);
                                
                                if (stristr($image_name,".gif"))
                                     $orig = imagecreatefromgif($image_tmp);
                                
                                if ($orig)
                                {
                                    $orig_x = imagesx($orig);
                                    $orig_y = imagesy($orig);
//                                  if ($orig_x > $width) 
					$image_x = $width;
                                    
                                    $image_y = round(($orig_y * $image_x) / $orig_x);
                                    
                                    $image = imagecreatetruecolor($image_x, $image_y);
                                    imagecopyresampled($image, $orig, 0, 0, 0, 0, $image_x, $image_y, $orig_x, $orig_y);
//					echo $output_image;
                                    imagegif($image, $output_image);
                                }
                                
                

	        	}
			//if ($cmd) {
			//	shell_exec($cmd);
			//}

		}

		}
		return true;
	}

?>
