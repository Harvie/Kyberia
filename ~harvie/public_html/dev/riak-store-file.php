#!/usr/bin/env php
<?php
if(count($argv) <= 1) die('usage: '.$argv[0]." bucket filename\n");

//Settings
$db_bucket='harvie';
$db_host='localhost';
$db_port=8098;

//Init
$key=$argv[2];
$db_bucket=$argv[1];

try {

//Connect
require_once('riak.php');
$client = new RiakClient($db_host, $db_port);
if(!$client->isAlive()) die("No Riak is running on http://$db_host:$db_port/ !\n");
$bucket = $client->bucket($db_bucket);

$obj = $bucket->newBinary($key,file_get_contents($argv[2]));
//$obj->setData(file_get_contents($argv[2]));
$obj->store() || die("Cannot store\n");

/*$obj = $bucket->getBinary($key);
if(!$obj->exists()) $obj = $bucket->newBinary($key);
$obj->setData(file_get_contents($argv[2]));
$obj->store() || die("Cannot store\n");*/

} catch(Exception $e) {
	echo("err: $argv[2]\n");
}
