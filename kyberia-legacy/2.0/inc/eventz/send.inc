<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

        function send() {
                global $db;
		if (empty($_SESSION['user_id']) || empty($_SESSION['user_name'])) {
			global $error;
			$error="user_id or user_name empty. try again or fck.off if u'r hackin";
			return false;
		}

                $user_id=$_SESSION['user_id'];
                $user_name=$_SESSION['user_name'];
                $mail_name=$_POST['mail_to'];
		// 01:07:37 <@stanojr> pyxel: tak fixni sql inject ktory je pri posielani posty konkretne meno uzivatela //
		$mail_name=mysql_escape_string($mail_name);
                $mail_to=explode(";",$mail_name);
                $mail_text=$_POST['mail_text'];
                $nohtml=$_POST['nohtml'];

        if (count($mail_to)==1) {
                $q="select user_id from users where login='$mail_name'";
                        $result=$db->query($q);
                        $result->next();
                        $to=$result->getRecord();
                        $mail_to_id[]=$to['user_id'];
        }

        elseif (count($mail_to)>1) {
                foreach ($mail_to as $mail_to_exploded) {
                        $q="select user_id from users where login='$mail_to_exploded'";
                                $result=$db->query($q);
                                $result->next();
                                $to=$result->getRecord();
                                $mail_to_id[]=$to['user_id'];
            }
        }


                if (empty($mail_text)) {
                        global $error;
                        $error="Prilis kratka sprava. Syr vesela krava, student prava a ci dobra trava?";
			return false;
                }

                if ($mail_to_id) {

                        $mail_text=nodes::processContent($mail_text);
			global $htmlparse;
			if ($htmlparse) {
				$error=$htmlparse;
				return false;
			}
			foreach ($mail_to_id as $mail_to_id_send) {
		                $q="insert into mail set mail_user='$user_id',mail_read='no', mail_from='$user_id',mail_text='$mail_text',mail_to='$mail_to_id_send',mail_timestamp=NOW()";
        	                $result=$db->query($q);
      	       		   	$duplicate_id=$db->getLastInsertId();
                       		$q="insert into mail set mail_duplicate_id='$duplicate_id', mail_read='no',mail_user='$mail_to_id_send',mail_from='$user_id',mail_text='$mail_text', mail_to='$mail_to_id_send',mail_timestamp=NOW()";
	                        $result=$db->query($q);
        	                $db->query("update users set user_mail=user_mail+1, user_mail_name='$user_name' where user_id='$mail_to_id_send'");
                	}
            		return true;

                }

                else {
                        global $error;
                        $error="user $mail_to does not exist";
                        return false;
                }
        }


?>
