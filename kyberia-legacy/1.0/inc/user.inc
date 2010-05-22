<?php
include("database.inc");

class user extends CLASS_DATABASE {

var $Database=DB_DATABASE;
var $User=DB_USER;
var $Password=DB_PASS;
var $Url=DB_HOST;

function login(){
	global $login;
	global $password;
	global $kybersession;
	$set=$this->query("select id from dennik_user where login='$login' and password='$password'");
	if ($set->_numRows==0) echo "Zadal si nespravne uzivatelske meno alebo heslo. Rob so sebou nieco!";
	else {
		$set->next();
		$id=$set->getString("id");
		$this->query("INSERT into sessions set id_user='$id',login='$login',password='$password',last=NOW()");
	}
}


}