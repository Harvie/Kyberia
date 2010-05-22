<?php
	function smarty_function_get_search($params,&$smarty) {
		/*
		$string=escapeshellarg($params['query']);
		$output=`/usr/local/bin/swish-e -d ::: -p node_name node_id node_type node_content k node_views -s node_views -f /storage/data/index.swish-e -w node_name=($string) or node_content=($string)`;
//		$output2=`/usr/local/bin/swish-e -d ::: -p node_name node_id node_type node_content k node_views -s node_views -f /storage/data/index.swish-e -w '$string'`;
//		echo "/usr/local/bin/swish-e -d ::: -p node_name node_id node_type node_content k node_views -s node_views -f /storage/data/index.swish-e -w $string";
//		$output=$output1.$output2;
		$output=str_replace($params['query'],"<span class='most_important'>".$params['query']."</span>",$output);
		preg_match_all("/:::(.*?):::(.*?):::(.*?):::(.*?):::(.*?):::(.*?):::(.*?):::(.*?):::(.*?)\n/i",$output,$matches);
		foreach($matches[0] as $key => $value) {
			preg_match("/(.*?)\.xml/i",$matches[2][$key],$ids);
			$id=$ids[1];
			echo "<a href='/id/".$id."'>".$matches[4][$key]."</a> (".$matches[6][$key].")<br>";
			echo $matches[7][$key]."<br><br>";
			//echo $matches[5][$key]."<br><br>";
		}
		

		global $db, $node;
		
		$q = "SELECT * FROM nodes WHERE node_system_access!='private' AND template_id=3 AND node_name LIKE '%".
			str_replace(array("%", "_"), array('\%', '\_'), addslashes($params['query']))."%'";
		$set=$db->query($q);
		while($set->next()) {
			$rec = $set->getRecord();
			echo "<a href='/id/{$rec[node_id]}'>{$rec[node_name]}</a><br>";
		}
*/
		global $db,$node;
		if (is_numeric($params['offset'])) $offset=$params['offset'];
		else $offset=0;

		if (is_numeric($params['listing_amount'])) $listing_amount=$params['listing_amount'];
		else $listing_amount=32;
		$query=Addslashes($params['query']);
		$q="select * from nodes left join users on users.user_id=nodes.node_creator where node_name like '$query%'";
		$set=$db->query($q);
		while ($set->next()) {
			$array[]=$set->getRecord();
		}
		$smarty->assign('get_search_short',$array);

		$q="select users.login as login,nodes.*,node_content,match (node_content) against ('$query') as
probability from node_content left join users on users.user_id=nodes.node_creator
left join nodes on node_content.node_id=nodes.node_id where node_system_access!='private' and match (node_content) against ('$query') order by k desc limit $offset,$listing_amount";

		$set=$db->query($q);
		while ($set->next()) {
			$search[]=$set->getRecord();
		}
	        $smarty->assign('get_search',$search);
		
}
?>