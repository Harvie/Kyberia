<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<head>
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
{get_bookmark_category}
{foreach from=$get_bookmark_category_array item=category}categories["{$category.node_id}"]=new Object();{/foreach}
bookmarks=new Array();
{get_bookmark}
{foreach from=$get_bookmark_array item=bookmark}categories["{$bookmark.bookmark_category}"]["{$bookmark.node_id}"]=true;{/foreach}
</script>
<title>
bookmarky
</title>
</head>
<body>

{section loop=$bookmark_category_array name=category}
{circle_coordinates amount=$smarty.section.category.total iteration=$smarty.section.category.index}
<div id='category{$smarty.section.category.index}'style='position: absolute; left:{$x_coordinate}px; top:{$y_coordinate}px;'><a onmouseover="category{$smarty.section.category.index}.innerHtml='{$bookmark_category_array[category].node_name}';showBookmarks('{$bookmark_category_array[category].node_id}');" href='/{$bookmark_category_array[category].node_name}/'>::</a></div>
{/section}
{section loop=$bookmark_array name=bookmarks}
{circle_coordinates center_x=$x_coordinate center_y=$y_coordinate amount=$smarty.section.bookmarks.total iteration=$smarty.section.bookmarks.index}
<div id='{$bookmark_array[bookmarks].node_id}' style='visibility: hidden; left: {$x_coordinate}px; top: {$y_coordinate}px; position: absolute;'>
<a href='/{$bookmark_array[bookmarks].node_name}'>{$bookmark_array[bookmarks].node_name}</a>
</div>
{/section}

</body>