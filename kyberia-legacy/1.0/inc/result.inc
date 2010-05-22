<?php
class result {
	var $_numRows = 0;
	var $_numFields = 0;
	var $_currentRow = -1;
	var $_currentRecord = array();
	var $_queryId = false;
	var $_sql = "";

function result($queryId, $sql) {
	$this->_queryId = $queryId;
	$this->_sql = $sql;
	if ($this->_queryId != false) {
		$this->_numRows = @mysql_num_rows($this->_queryId);
		$this->_numFields = @mysql_num_fields($this->_queryId);
		$this->_currentRow = -1;
		$this->_currentRecord = array();
	} else {
		$this->exception("result failed.");
	}
}
	 
 function next() {
	if ($this->_currentRow + 1 >= $this->_numRows) {
		return false;
	} else {
		$this->_currentRecord = @mysql_fetch_assoc($this->_queryId);
		$this->_currentRow++;
		return true;
	}	
}

function absolute($row) {
	if ($row > 0) {
// positive row number
	@mysql_data_seek($this->_queryId, $row-1);
		$this->_currentRecord = @mysql_fetch_assoc($this->_queryId);
		$this->_currentRow = $row;
	} elseif ($row < 0) {
		// not implemented yet
	} else {
		$this->exception("Cannot absolute position to row 0");
	}
}	

function getRecord() {
	return $this->_currentRecord;
}
 
function getString($column) {
	if (is_int($column) == true) {
		return (string)$this->_currentRecord[$column-1];		
	} else {
		return (string)$this->_currentRecord["$column"];
	}
}

function getInt($column) {
	if (is_int($column) == true) {
		return (int)$this->_currentRecord[$column-1];		
	} else {
		return (int)$this->_currentRecord["$column"];
	}
}

function getVariable($column) {
	return (int)$this->_currentRecord["$column"];
	
} 

function getDouble() {
	if (is_int($column) == true) {
		return (double)$this->_currentRecord[$column-1];		
	} else {
		return (double)$this->_currentRecord["$column"];
	}
}

function getRow() {
	if ($this->_currentRow < 0) {
	    return 0;
	} else {
    	return $this->_currentRow + 1;
	}
}

function getNumRows() {
	return $this->_numRows;	
}

function getNumFields() {
	return $this->_numFields;
}

function exception($errorMsg) {
	die("<pre>SQLException: ".$msg."</pre>");
}

}

?>