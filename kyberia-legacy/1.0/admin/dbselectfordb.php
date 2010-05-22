<?

ini_set("include_path","./inc:./boxiky/:./config:../inc:../boxiky/:../config");
include_once("kyberia.inc");
$database=new CLASS_KYBERIA();
?>
<form action='?' method='get'>
describe 
<input type='text' name='describe'>
<input type='submit' value='send'>
</form>
<form action='?' method='get'>
select * from
<input type='text' name='table'>
where
<input type='text' name='where'>
<input type='submit' value='send'>
</form>
<br>
<?

$describe=$_GET['describe'];
$table=$_GET['table'];
$where=$_GET['where'];

if ($table) selectni($table,$where);
if ($describe) descni($describe);

function descni($tablename){
	global $database;
	$q="describe $tablename";
	$set=$database->query($q);

	echo "<table border='1'><tr><td><b>Field</b></td><td><b>Type</b></td> 	<td><b>Null</b></td></tr>";
	while($set->next()){
		$field=$set->getString('Field');
		$fields[]=$field;
		$type=$set->getString('Type');
		$null=$set->getString('Null');
		echo "<tr><td>".$field."</td>";
		echo "<td>".$type."</td>";
		echo "<td>".$null."</td></tr>";
	}
	echo "</table>";
}




function selectni($tablename,$where){
	global $database;
	$q="describe $tablename";
	$set=$database->query($q);
  if ($where=="") {
  	$q2="select * from $tablename";
  }else{
  	$q2="select * from $tablename where $where";
  }
	echo $q2."<br>";
  $set2=$database->query($q2);

	while($set->next()){
		$field=$set->getString('Field');
		$fields[]=$field;
		$type=$set->getString('Type');
		$null=$set->getString('Null');
	}
	for($i=0;$i<count($fields);$i++){
		echo "|:|<b>".$fields[$i]."</b>";
	}

	echo "<br>";

	while($set2->next()){
		for($i=0;$i<count($fields);$i++){
			$onefield=$set2->getString($fields[$i]);
			echo "|:|".$onefield;
		}
		echo "<br>";
	}
}
?>
