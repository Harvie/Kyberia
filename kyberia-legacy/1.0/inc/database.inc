<?php

include_once ("result.inc");
include_once ("configdb.inc");

class CLASS_DATABASE {

var $Database=DB_DATABASE;
var $User=DB_USER;
var $Password=DB_PASS;
var $Url=DB_HOST;

var $_linkId = false;
var $_url = "";
var $_user = "";
var $_password = "";
var $_database = "kyberia";
var $_halt_on_error = true;
function CLASS_DATABASE () {
$this->connect("$this->Url","$this->User","$this->Password","$this->Database");
}

function connect($url, $user, $password, $database, $halt_on_error = true) {
		$this->_halt_on_error = $halt_on_error;
		if ($this->_linkId == false) {
			$this->_linkId=mysql_connect($url, $user, $password);
			if ($this->_linkId == false) {
				$this->exception("weej databazka to nerozdychava ;)");
				return false;
				die();
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
		global $user_id;
		if ($user_id==220 && $_GET['debug']) echo $sql;
		$this->_queryId = mysql_db_query($this->_database,$sql,$this->_linkId);
		if ($this->_queryId == false) {
	      		$this->exception("query failed ::$sql::");
		}
		
		return new result($this->_queryId, $sql);	
	}
	
   
function executequery($sql) {
	return($this->query($sql));
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