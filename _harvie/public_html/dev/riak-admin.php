<?php include('http_auth.php'); ?>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>Riak PHP Admin (Harvie 2o1o)</title>
<style>h1 a {color:black;} a {color:blue;}</style>
<tt><h1><a href="?" style="text-decoration:none;" title="GoTo Bucket root">Riak PHP Admin</a> <small><small>(Harvie 2o1o)</small></small></h1>
<?php
/* Riak PHP Admin (CopyLefted by Harvie 2o1o)
 * - do not use in production environment - just for fun.
 * - i've hacked this up in two hours, so do not expect much.
 * - when using PUT be sure that you are keeping JSON format.
 */

//Settings
$db_bucket='harvie';
$db_host='localhost';
$db_port=8098;

//Init
$key='';
$key='';
$error='';
if(isset($_GET['key'])) $key=$_GET['key'];
if(isset($_GET['bucket'])) $db_bucket=$_GET['bucket'];

//Connect
require_once('riak.php');
$client = new RiakClient($db_host, $db_port);
if(!$client->isAlive()) die("<tt><h1>No Riak is running on http://$db_host:$db_port/ !</h1></tt>");
$bucket = $client->bucket($db_bucket);


if(isset($_GET['action'])) {
	if($key==='' && $_GET['action']!=='GET') die('<tt>Don\'t even try. Not implemented yet :-P');
	if($_GET['action']==='PUT') {
		$obj = $bucket->getBinary($key);
		if(!$obj->exists()) $obj = $bucket->newBinary($key);
		$obj->setData($_GET['value']);
		$obj->store() || $error='Cannot store';
	}
	if($_GET['action']==='DELETE') {
		$obj = $bucket->getBinary($key);
		$obj->delete() || $error='Cannot delete';
	}
	if($_GET['action']==='LINK' && $_GET['link']!=='') {
		$obj = $bucket->get($key);
    $obj->addLink($bucket->get($_GET['link']));
    $obj->store() || $error='Cannot store';
	}
	if($_GET['action']==='RMLINK' && $_GET['link']!=='') {
		$obj = $bucket->get($key);
    $obj->removeLink($bucket->get($_GET['link']));
    $obj->store() || $error='Cannot store';
	}
}

?>
<form method="GET">
	<input type="text" name="bucket" value="<?php echo htmlspecialchars($db_bucket); ?>" /> Bucket<br />
	<input type="text" name="key" value="<?php echo htmlspecialchars($key); ?>" /> Key<br /><br />
	<textarea name="value" style="width:100%;height:25%;"><?php
			$obj = $bucket->getBinary($key);
			$obj->exists() || $error='404 FOOK FOUND';
			echo htmlspecialchars(''.$obj->getData());
	?></textarea><br />
	<input type="submit" name="action" value="GET" />
	<input type="submit" name="action" value="PUT" />
	<input type="submit" name="action" value="DELETE" />
	<input type="submit" name="action" value="RMLINK" />
	<input type="submit" name="action" value="LINK" />
	<input type="text" name="link" value="" />
	<i>No warranty! Just for fun.</i>
</form><pre>
<?php
echo htmlspecialchars($error);

echo('<h1>Bucket keys</h1></pre>');
$keys = $bucket->get('')->getData();
$keys = $keys['keys'];
//print_r($keys);
$db_bucket = urlencode($db_bucket);
foreach($keys as $i => $key) {
	echo("<a href='?key=$key&bucket=$db_bucket&action=GET' title='$i'>".htmlspecialchars(urldecode($key))."</a>, ");
}
echo('<pre>');

/*echo('<small><h1>Links</h1>');
print_r($obj->getLinks());*/

echo('<h1>Links</h1>');
//print_r($obj->link('kybca-mini', 'root')->map("function(v) { return [v]; }",array('keep'=>'true'))->run());
print_r(
	$obj->link('_')->
	//reduce('function (v) { return v; }')-> //hello world mapred
	//reduce('Riak.reduceLimit', array('arg' => 5))-> //limit to first 4 results
	reduce(<<<EOF
		function (v) {
			var r = {};
			var j = 0;
			for (var i in v) r[j++] = v[i][1];
			return [r];
		}
EOF
	)->

run()
);

echo('<h1>Linked data</h1>');
print_r(
	$arr = $obj->
	link('_')->
	map("Riak.mapValues", array("keep" => false))->
	run()
);

echo('<h1>Linked data (with keys)</h1>');
foreach($obj->getLinks() as $k => $link) {
	$l = $link->get();
	print_r(array(htmlspecialchars($l->key),
		htmlspecialchars(var_export($l->data,true))
	));
}


echo('<small><h1>Recursive LinkWalk</h1>');
function recursive_links($obj, $limit = 7, $depth = 0,$last=0) {
	for($i=$depth;$i>0;$i--) echo('|    ');
	echo(($last?'\\':'|').'--> ');
	if($depth > $limit) {
		echo("[!] RECURSIVE DEPTH LIMIT ($limit) REACHED\n");
		return;
	}
	echo htmlspecialchars($obj->getKey().' => '.$obj->getData()."\n");
	foreach($obj->getLinks() as $k => $link) {
		recursive_links($link->getBinary(), $limit, $depth+1, ($k == count($obj->getLinks())-1));
	}
}

recursive_links($obj);

echo('<h1>Bucket properties</h1>');
print_r($bucket->getProperties());
