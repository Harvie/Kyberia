<?php include('http_auth.php'); ?>
<?php if(!isset($_GET['noheader'])) { ?>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>Kyberia-NG-Mini (Harvie 2o1o)</title>
<style>
	body { background-color: black; color: lightgreen; }
	h1 a {color: lightgreen;}
	a {color:lime;}
	.text a {color:darkgreen;}	
	.k { border: 2px solid green; margin-left: 15px; margin-top: 5px; padding: 5px; }
	.text { background-color: lightgreen; color:black; padding:3px; }
	textarea { width:100%; height: 50px; }
</style>
		<script type="text/javascript" language="javascript">
			function showhide(eid) {
				obj = document.getElementById(eid);
				obj.style.display = (obj.style.display == 'none' ? '' : 'none');
			}

			/*function subNodes(i) {
				alert(i);
			}*/

			var xmlHttp = false;
			function subNodes(name) {

				xmlHttp = false;
				if (window.XMLHttpRequest) { // Mozilla, Safari,...
					xmlHttp = new XMLHttpRequest();
				} else if (window.ActiveXObject) { // IE
					try {
						xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
      		} catch (e) {
						try {
							xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
						} catch (e) {}
					}
				}
    
				if (!xmlHttp) { return false; }

				xmlHttp.onreadystatechange = function() {
					if(xmlHttp.readyState==4) {
						if (xmlHttp.status == 200) {
							//var body = document.getElementsByTagName('body')[0];
 							//body.innerHTML = xmlHttp.responseText;
							//document.getElementById(name).outerHTML = xmlHttp.responseText;
							document.getElementById(name).innerHTML = xmlHttp.responseText;
							//alert(xmlHttp.responseText);
 						}
 					}
				};
				xmlHttp.open('GET', '?noheader&key='+name, true);
				xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xmlHttp.send(null);
			}
</script>
<tt><h1><a href="?" style="text-decoration:none;" title="GoTo Bucket root">Kyberia-NG-Mini</a> <small><small>(Harvie 2o1o)</small></small></h1>
<?php }

//Settings
$db_bucket='kybca-mini';
$db_host='localhost';
$db_port=8098;

$user=$PHP_AUTH_USER;

//Init
$key='root';
$error='';
if(isset($_GET['key'])) $key=$_GET['key'];
if(isset($_GET['bucket'])) $db_bucket=$_GET['bucket'];

//Connect
require_once('riak.php');
$client = new RiakClient($db_host, $db_port);
if(!$client->isAlive()) die("<tt><h1>No Riak is running on http://$db_host:$db_port/ !</h1></tt>");
$bucket = $client->bucket($db_bucket);

$db_lastkey = 'lastkey';

function base36_inc(&$num) {
	return ($num = base_convert(base_convert($num, 36, 10)+1, 10, 36));
}

if(isset($_POST['action'])) {
  if($_POST['action']==='ADD') {
		$obj = $bucket->get($db_lastkey);
		$nextkey = $obj->getData();
		while($obj->exists()) $obj = $bucket->get(base36_inc($nextkey));

		$obj = $bucket->newBinary($db_lastkey, "$nextkey");
    $obj->store() || $error='Cannot store';


    $obj = $bucket->newObject($nextkey, array(
			'owner' => $user,
			'title' => $_POST['title'],
			'data' => nl2br($_POST['data'])
		));
    $obj->store() || $error='Cannot store';

		$obj = $bucket->get($key);
    $obj->addLink($bucket->get($nextkey));
    $obj->store() || $error='Cannot store link';
  }
  if($_POST['action']==='DELETE') {
		$obj = $bucket->getBinary($key);
    $obj->delete() || $error='Cannot delete';
	}
	if(isset($_GET['key']))	{
		header('Location: ?key='.$_GET['key']);
	}
}


function display_node($bucket,$key,$header=true,$depth=1) {

	$obj = $bucket->get($key);
	if(!$obj->exists()) {
		return;
		echo('404 FOOK FOUND');
	}
	$data = $obj->getData();

	if($header) {
?><div class="k">
		<a name='<?php echo htmlspecialchars($key); ?>' /></a>
		Node: <a href="?key=<?php echo htmlspecialchars($key); ?>"><?php echo htmlspecialchars($key); ?>
			=> <?php echo htmlspecialchars($data['title']); ?></a><br />
		By: <?php echo htmlspecialchars($data['owner']); ?><br />
		Data: <div class="text"><?php echo $data['data']; ?></div><br />

<?php 
	}
	if($depth > 0) {
?>
	<form method="POST" action="?key=<?php echo htmlspecialchars($key); ?>">
		<input type="hidden" name="parent" value="<?php echo htmlspecialchars($parent); ?>">
		
		Title: <input type="text" name="title" value="" /><br />
		<textarea name="data"></textarea><br />
		<input type="submit" name="action" value="ADD" />
<?php if($data['owner'] === $GLOBALS['user'])
			{
?>
			<input type="submit" name="action" value="DELETE" /> (prosim nemazte zatim nody obsahujici jine nody a radeji mazte jenom vlastni nody)
<?php
			}
			echo('Loged in as: '.$GLOBALS['user']."\n");
?>
	</form>
<?php
		foreach(array_reverse($obj->getLinks()) as $linkkey => $subnode) {
			if(!$subnode->get()->exists()) {
				$obj->removeLink($subnode);
				$obj->store();
			}
			display_node($bucket,$subnode->getKey(),true,$depth-1);
		}
	} else {
		$count = count($obj->getLinks());
		echo "<a href='#".htmlspecialchars($key)."' onclick=\"subNodes('".htmlspecialchars($key)."');\" >+EXPAND+</a> ";
		if($count) echo "<font color='red'><b>Contains $count child nodes!</font></b>";
	}
?>
	<div id="<?php echo htmlspecialchars($key); ?>"></div>
</div>
<?php
}
//echo htmlspecialchars($error);
display_node($bucket,$key,!isset($_GET['noheader']));

