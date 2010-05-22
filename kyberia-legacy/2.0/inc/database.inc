<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

require ("result.inc");

class CLASS_DATABASE {

var $Database="";
var $User="";
var $Password="";
var $Url="";

var $_linkId = false;
var $_url = "";
var $_user = "";
var $_password = "";
var $_database = "";
var $_halt_on_error = true;

function CLASS_DATABASE ($database=DB_DATABASE,$user=DB_USER,$password=DB_PASS,$url=DB_HOST) {
	$this->Database=$database;
	$this->Password=$password;
	$this->User=$user;
	$this->Url=$url; 
	$this->connect($this->Url,$this->User,$this->Password,$this->Database);
}

function connect($url, $user, $password, $database, $halt_on_error = true) {
		global $error;
		$this->_halt_on_error = $halt_on_error;
		if ($this->_linkId == false) {
		
			$this->_linkId=mysql_connect($url, $user, $password);
			if ($this->_linkId == false) {
				$error='chcipla databaza';
				$this->exception($error);
				return false;
				//die();
			}
			$this->_url=$url;
			$this->_user=$user;
			$this->_password=$password;
		
			if ($this->_linkId == false || mysql_select_db($database, $this->_linkId) == false) {
				$this->exception("1Database failed.");			
				return false;
				die();
			}			
			$this->_database=$database;		
		}	
		return true;		
}

function closeMysql() {
	mysql_close($this->_linkId);
}

function query($sql) {



		$this->_queryId = mysql_query($sql,$this->_linkId);

		if ($_SESSION['user_id']==548) {
			echo $sql;
			global $timer_start;
			echo "<BR>".SubStr((Time()+SubStr(MicroTime(),0,8)-$timer_start),0,7);
		}

		if ($this->_queryId == false) {
	      		$this->exception("query failed ::$sql::");
		}
		
		return new result($this->_queryId, $sql);	
	}
	
   
function executequery($sql) {
	return($this->query($sql));
}

function executetransaction($queries) {
	$this->executequery("set autocommit=0");
	if (is_array($queries)) {
		foreach ($queries as $query) {
			$this->executequery($query);
		}
	}
	$this->executequery("commit");
	$this->executequery("set autocommit=1");
}

function executeupdate($sql) {
	return($this->update($sql));
}

function update($sql) {
		
	$this->_queryId = @mysql_db_query($this->_database,$sql,$this->_linkId);
		if ($this->_queryId == false) {
			$this->exception("update failed.");
		}
		$rows=@mysql_affected_rows($this->_linkId);
		return($rows);
}
	
function getLastInsertId() {
		return(@mysql_insert_id($this->_linkId));
}

function exception($errorMessage) {
	echo "<!-- ";
	echo @mysql_error($this->_linkId)," (",@mysql_errno($this->_linkId),")";
	echo "-->";
	if ($this->_halt_on_error) {
		die("<pre>".$errorMessage."</pre>");
		} else {
			echo $errorMessage."<br>";
			return false;
		}
	}	
}
?>