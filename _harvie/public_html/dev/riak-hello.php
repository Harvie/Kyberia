<tt><h1>Riak Hello World!</h1><pre>
<?php
require_once('riak.php');

$client = new RiakClient('localhost', 8098);
$bucket = $client->bucket('harvie');

$obj = $bucket->newObject('foo', 'bar baz');
$obj->store();

$obj = $bucket->get('foo2');
$obj->exists();
$obj->getBucket()->getName();
print_r('key: '.$obj->getKey()."\n");
print_r('val: '.$obj->getData()."\n");

echo("\nEOF\n");
