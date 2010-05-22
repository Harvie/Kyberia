<table class=boxwithout><tr><td>
<center>uzivatelia</center>
<?php
global $kyberia;
$set=$kyberia->getDennikAuthors();
  //prevedie udaje do arrays, aby sa dali viac krat pouzit
  while ($set->next()) {
    $array_login[]=$set->getString('login');
    $array_autor[]=$set->getString('autor');
  }


  echo "<br><br>~~~ friends ~~~<br>";

  for ($i=0;$i<count($array_login);$i++){
      $d_login=$array_login[$i];
      $d_autor=$array_autor[$i];

      if ($friend_array[$d_autor]){
      	echo "<br><a href='?action=journaux&dennik_user=",$d_autor,"'><b>",$d_login,"</b></a>";
      }else{
      }
  }
  echo "<br><br>~~~ friends ~~~<br><br>";

  for ($i=0;$i<count($array_login);$i++){
      $d_login=$array_login[$i];
      $d_autor=$array_autor[$i];

      if ($friend_array[$d_autor]){
      }else{
    	  echo "<br><a href='?action=journaux&dennik_user=",$d_autor,"'>",$d_login,"</a>";
      }
  }
?>
</td></tr></table>	
