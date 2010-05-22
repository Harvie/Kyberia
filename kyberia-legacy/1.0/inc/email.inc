<?php
/*
 * Email.inc		1.00 2001/03/08
 *
 * Copyright 2001 Czech On Line a.s. All Rights Reserved.
 */



/**
 * see class.html.mime.mail.inc for more details about 
 * send email functions
*/
class Email  {

	function Email() {
	}

	/**
	 * is e-mail address valid ?
	 *
	 * @param email e-mail addess
	 *
	 * @return true or false
	*/
	function isValidEmail($email) {
		// valid e-mail address must contain @
		if (strpos($email,'@') == 0) {
			return false;
		}
		// validace domeny proti DNS
		if (getmxrr($domain.".",$null) == false) return false; 

       	return true; 
	}

	/**
	 * Validate e-mail address
	 * tries to correct invalid e-mail
	 *
	 * @param email e-mail addess
	 *
	 * @return the original e-mail address or modified e-mail address
	*/
	function validateEmail($email) {
	
		// replace .cy to .cz
		$email = eregi_replace("\.cy$",".cz",$email);

		// domain doen't contain ., let's add .cz
		$domain = substr($email,strpos($email,"@")+1,1024);
		if (strpos($domain,".") == 0)  {
			$domain.=".sk";
			$email.=".sk";
		}
       	return $email; 
	}

	function isEmailRegexpValid($email) { 
		if (eregi("^[a-z0-9\._-]+@+[a-z0-9\._-]+\.+[a-z]{2,4}$", $email)) {
			return TRUE;
		} else {
			return FALSE; 
		}
}

}
?>
