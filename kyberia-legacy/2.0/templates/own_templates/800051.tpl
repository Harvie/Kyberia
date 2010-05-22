<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<head>
<meta http-equiv="Cache-Control" content="Public">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
<link rel='stylesheet' type='text/css' href='/data/css/main.css'>
<title>as above, so below</title>


<script>

var current_category;

function showBookmark(node_id) {ldelim}
	var bookmark=document.getElementById(node_id);
	bookmark.style.visibility="visible";
	return true;
{rdelim}

function setInvisible(id) {ldelim}
	for (node in categories[id]) {ldelim}
		document.getElementById(node).style.visibility="hidden";
	{rdelim}
{rdelim}

function showBookmarks(id) {ldelim}
	setInvisible(current_category);
	for (node in categories[id]) {ldelim}
		showBookmark(node);
	{rdelim}
	current_category=id;
	return true;
{rdelim}



categories=new Object();
categories["0"]=new Object();
{get_bookmarks}

{foreach from=$get_bookmarks item=bookmark_category}
categories["{$bookmark_category.node_id}"]=new Object();

{foreach from=$bookmark_category.children item=bookmark}
categories["{$bookmark_category.node_id}"]["{$bookmark.node_id}"]=true;
{/foreach}

{/foreach}
</script>
</head>

<body>
{foreach from=$get_bookmarks item=category name=categoryname}
{circle_coordinates amount=$smarty.foreach.categoryname.total iteration=$smarty.foreach.categoryname.iteration}
<div id='category{$smarty.foreach.categoryname.iteration}' style='position: absolute; left:{$x_coordinate}px; top:{$y_coordinate}px;'>
<a onmouseover="category{$smarty.foreach.categoryname.iteration}.innerHtml='{$category.node_name}';showBookmarks('{$category.node_id}');" href='/{$category.node_id}/'>{$category.node_name}</a>

{foreach from=$category.children item=bookmarks name=bookmarks}
<div id='{$bookmarks.node_id}' style='visibility: hidden; left; position: relative;'>
<a href='/{$bookmarks.node_name}'>{$bookmarks.node_name}</a>
        {if $bookmarks.lastdescendant_created > $bookmarks.last_visit}
                :: <span class='most_important'>!!NEW!!</span>
        {/if}
<br>
</div>
{/foreach}
</div>
{/foreach}
</body>























