<?php

include("database.inc");

class CLASS_GALLERY extends CLASS_DATABASE {
/*
var $Database="kyberia";
var $User="kyberia";
var $Password="cyb3ry";
var $Url=;
*/
var $albumLink="http://kyberia.sk/gallery/view_album.php?set_albumName=";
var $photoLink="http://kyberia.sk/gallery/view_photo.php?set_albumName=";

function galleryInsert($gallerydata){
	$q="SELECT * FROM albums where name like '".$gallerydata->fields["name"]."'";
	$set=$this->query($q);
	if ($set->_numRows==0) {

	$q="INSERT INTO albums set ";
	$q.="title='".$gallerydata->fields["title"]."',";
	$q.="name='".$gallerydata->fields["name"]."',";
	$q.="description='".$gallerydata->fields["description"]."',";
	$q.="hits='".$gallerydata->fields["clicks"]."',";
	$q.="fotos='".count($gallerydata->photos)."'";
	$this->query($q);
}
}

}