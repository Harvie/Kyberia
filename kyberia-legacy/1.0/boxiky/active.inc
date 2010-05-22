<?php

if ($action=='forum') {
	$set=$kyberia->query("select * from session where user_action='forum' and user_action_id='$node_id' and user_mode!='invisible' group by user_name");
	echo "<table align='center'><tr>";
	while ($set->next()) {
		echo "<td><a href='?action=userinfo&node_id=",$set->getString('user_id'),"'><img width='50' height='50' src='/images/users/".strtolower($set->getString('user_name')).".gif' border='0' alt='",$set->getString('user_name'),"'></a></td>";
		

	}

	echo "</tr></table>";
}

else {
	include ("count.inc");

	$set=$kyberia->query("select (time_to_sec(NOW())-time_to_sec(user_idle)) as idle,session.* from session group by session.user_id order by session.user_name");

  // jay is the beeest, fooking good, i love the woooorld

  //prevedie udaje do arrays, aby sa dali viac krat pouzit
  while ($set->next()) {
    $active_array_name[]=$set->getString('user_name');
    $active_array_user[]=$set->getString('user_id');
    $active_array_idle[]=$set->getString('idle');
  }

	echo "<div class='active_users'>";
  echo "<table cellspacing='0' cellpadding='0'><tr><td>";
  echo "~~~ friends ~~~<br><br>";
  echo "</td></tr><tr><td>";
  
  //toto je prva cast, kde sa vypisuju friendi
  for ($i=0;$i<count($active_array_user);$i++){
      $active_user=$active_array_user[$i];
      $active_name=$active_array_name[$i];
      $active_idle=$active_array_idle[$i];
		  // ikonky
		  if ($user_active_icons == 'yes') {
        if ($friend_array[$active_user]){
   		   echo "<div class='active_user'><div class='active_user_img'>";
  			 echo "<a href='?action=userinfo&node_id=",$active_user,"'><img width='50' height='50' src='/images/users/".strtolower($active_name).".gif' border='0' alt='".$active_name."' title='".$active_name."'></a></div>";
  			 echo "</div>";
        }else{
        }
  		}
		  // iba nicky
		  else {
        if ($friend_array[$active_user]){
  echo "</td></tr><tr><td>";
    			echo "<a href='?action=userinfo&node_id=",$active_user,"'><b>".$active_name."</b> ";
 	$time=$active_idle;
	if ($time<0) $time+=(60*1440);
//	echo floor($time/60),":",($time%60);

  echo "</a>";
  echo "</td></tr><tr><td>";
        }else{
        }
 		  }
  }
  echo "</td></tr><tr><td>";
  echo "<br>~~~ friends ~~~<br><br><br>";
  echo "</td></tr><tr><td>";
                                       
  //a tu je ostatok activov
  for ($i=0;$i<count($active_array_user);$i++){
      $active_user=$active_array_user[$i];
      $active_name=$active_array_name[$i];
      $active_idle=$active_array_idle[$i];
		  // ikonky
		  if ($user_active_icons == 'yes') {
        if ($friend_array[$active_user]){
        }else{
   		   echo "<div class='active_user'><div class='active_user_img'>";
  			 echo "<a href='?action=userinfo&node_id=",$active_user,"'><img width='50' height='50' src='/images/users/".strtolower($active_name).".gif' border='0' alt='".$active_name."' title='".$active_name."'></a></div>";
  			 echo "</div>";
        }
  		}
		  // iba nicky
		  else {
        if ($friend_array[$active_user]){
        }else{
  echo "</td></tr><tr><td>";
    			echo "<a href='?action=userinfo&node_id=",$active_user,"'>".$active_name." ";
 	$time=$active_idle;
	if ($time<0) $time+=(60*1440);
//	echo floor($time/60),":",($time%60);

  echo "</a>";
  echo "</td></tr><tr><td>";
        }
 	    }
  }
  echo "</td></tr></table>";




	echo "</div>";
}
