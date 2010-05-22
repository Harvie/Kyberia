<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


<?

class LDAPuser {
	
	var $ldif;
	var $dn;
	var $filter;
	var $values;

	function replicate($uid,$hkid,$password) {

		$admindn = "cn=kyberia,ou=Directory Administrators,dc=h-k,dc=sk";
		$adminpw = "abcd123";

		$this->dn = "ou=People,dc=h-k,dc=sk";		

		$this->ldif['cn'] = $uid;
		$this->ldif['sn'] = $uid;
		$this->ldif['hkid'] = $hkid;
		$this->ldif['userpassword'] = "{clear}".$password;
		$this->ldif['o'] = "h-k.sk";
//		$this->ldif['homeDirectory'] = "/home/".$hkid;
//		$this->ldif['loginShell'] = "/bin/false";
//		$this->ldif['deliveryMode'] = "normal";
//		$this->ldif['mailQuotaCount'] = "10000";
//		$this->ldif['mailQuotaSize'] = "100000000";
//		$this->ldif['mailSizeMax'] = "10000000";
//		$this->ldif['mail'] = strtolower($uid)."@h-k.sk";
//		$this->ldif['mailalternateaddress'][0] = strtolower($uid)."@h-k.sk";
//		$this->ldif['mailalternateaddress'][1] = strtolower($uid)."@kyberia.sk";
//		$this->ldif['mailalternateaddress'][2] = strtolower($uid)."@hysteria.sk";
//		$this->ldif['accountstatus'] = "disabled";
//		$this->ldif['qmailUID'] = "123";
//		$this->ldif['uidnumber'] = "123";
//		$this->ldif['gidnumber'] = "123";
//		$this->ldif['qmailGID'] = "123";
		$this->ldif['uid'] = $uid;


		$this->ldif['objectclass'][0] = "inetOrgPerson";
//		$this->ldif['objectclass'][1] = "posixAccount";
		$this->ldif['objectclass'][1] = "OpenLDAPPerson";
		$this->ldif['objectclass'][2] = "pilotPerson";
		$this->ldif['objectclass'][3] = "inetLocalMailRecipient";
//		$this->ldif['objectclass'][] = "qmailUser";
		$this->ldif['objectclass'][4] = "top";
                $this->ldif['objectclass'][5] = "person";
		$this->ldif['objectclass'][6] = "hkuser";
	
		$c = ldap_connect("localhost");
		$b = ldap_bind($c, $admindn, $adminpw);
		$r = ldap_add($c, "hkid=".$hkid.",".$this->dn, $this->ldif);

		//system("echo \"".$uid.":".$hkid."(".ldap_error($c).")\" >> /tmp/ldaprepl.log");
		
		ldap_close($c);

	}

	function change_pass($uid,$old_pass,$new_pass) {
		
		$c = ldap_connect("localhost");

		if ($c) {
			$this->dn = "ou=People,dc=h-k,dc=sk";
			$this->values = array("dn");
			$this->filter = "hkid=".$uid;

			$sr = ldap_search($c, $this->dn, $this->filter, $this->values);

			$res = ldap_get_entries($c, $sr);
	                $this->dn = $res[0]["dn"];

			if ($res['count'] != 1) {
				return false;
			}

			if ($old_pass == "") {
				return false;
			}

			$b = ldap_bind($c, $this->dn, $old_pass);
			echo "binding".$this->dn." with $old_pass";
			if ($b) {
				$this->ldif['userpassword'] = "{clear}".$new_pass;
				$mod_ret = ldap_modify($c, $this->dn, $this->ldif);
				return $mod_ret;
			}

			return false;
	
}}

	function auth($uid,$password) {

		$c = ldap_connect("localhost");

		if ($c) {
			$this->dn = "ou=People,dc=h-k,dc=sk";
			$this->values = array("dn");
			$this->filter = "hkid=".$uid;
	
			$sr = ldap_search($c, $this->dn, $this->filter, $this->values);

			$res = ldap_get_entries($c, $sr);

			if ($res['count'] != 1) {
				//system("echo \"(".$uid.") NOT FOUND\" >> /tmp/ldaprepl.log");
				return false;
			}	

			$this->dn = $res[0]["dn"];

                        //system("echo \"BINDING:".$this->dn."\" >> /tmp/ldaprepl.log");

			if ($password == "") {
				//system("echo \"(".$this->dn.") BIND FAILED (empty password)\" >> /tmp/ldaprepl.log");
				return false;
			}

			$b = ldap_bind($c, $this->dn, $password);

			if ($b) {
				//system("echo \"(".$this->dn.") BIND OK\" >> /tmp/ldaprepl.log"); 				
				return true;
			} 
	
			//system("echo \"(".$this->dn.") BIND FAILED\" >> /tmp/ldaprepl.log");

			return false;	
				
		}

	}
}

?>


