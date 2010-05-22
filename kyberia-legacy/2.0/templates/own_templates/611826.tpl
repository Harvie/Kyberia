<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

a {
   border: 0;
/*   color: #999;*/
   color: #fff;
   font-size: 12px;
   outline: none;
   text-decoration: none;
   font-weight: bold
}

a:visited {
   border: 0;
   color: #fff;
   outline: none;
   font-weight: bold;
   text-decoration: none;
}

a:hover {
   border: 0;
   color: #444;
   text-decoration: underline;
   font-weight: bold
}

a:active {
   border: 0;
   color: #DDD;
}

a.graf {
   outline: #000 solid 1px;
}

a.graf:visited {
   outline: #000 solid 1px;
}

a.graf:hover {
   outline: #DDD solid 1px;
}

a.graf:active {
   outline: #000 solid 1px;
}

a.zamer {
   color: #353535;
   outline: none;
   text-decoration: none;
}

a.zamer:visited {
   color: #353535;
   font-weight: bold;
   outline: none;
   text-decoration: none;
}

a.zamer:hover {
   color: #353535;
   text-decoration: underline;
}

a.zamer:active {
   color: #353535;
   text-decoration: underline;
}

abbr, acronym, .help {
   cursor: help;
}

abbr, acronym, span.help {
   border-bottom: 1px dashed #000;
   cursor: help;
}

blockquote {
   quotes: "\00BB" "\00AB";
}

blockquote:after {
   content: close-quote;
}

blockquote:before {
   content: open-quote;
}

body {
	background-color: #FFF;
	color: #606060;
	font: 11px/1.4 "Tahoma CE", "Arial CE", "Helvetica CE", Tahoma, Arial, lucida, sans-serif;
	margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}

/* weird ie5win bug: all line-height to font-size ratios must agree or box gets pushed around. UPDATE: this has turned out to be very rare. my current recommendation is IGNORE this warning. at the moment i'm leaving it in only in case the issue turns up again. possibly the original bug in march 2001 was caused by an unusual combination of factors, although this solved it at the time.*/
h1 {
   font-size: 24px;
   font-weight: bold;
   line-height: 44px;
   margin-bottom: 0;
   margin-top: 0;
}

h2 {
   font-size: 18px;
   font-weight: bold;
   line-height: 40px;
   margin-bottom: 0;
   margin-top: 0;
}

h3 {
   font-size: 16px;
   font-weight: bold;
   line-height: 22px;
   margin-bottom: 0;
   margin-top: 0;
}

h4 {
   font-size: 14px;
   font-weight: bold;
   line-height: 26px;
   margin-bottom: 0;
   margin-top: 0;
}

h5 {
   font-size: 12px;
   font-weight: bold;
   line-height: 22px;
   margin-bottom: 0;
   margin-top: 0;
}

h6 {
   font-size: 10px;
   font-weight: bold;
   line-height: 18px;
   margin-bottom: 0;
   margin-top: 0;
}

img {
   border: 0;
}

img.foto {
   border: 1px solid #000;
   margin: 10px 10px 10px 10px;
}

img.graf {
   border: 1px solid #000;
   margin: 10px 10px 10px 10px;
}

img.ikona {
   left: 10px;
   position: relative;
   top: 10px;
}

img.sramcekom {
   border: 1px solid #000;
}

li {
	text-align: left;
	font-size: 12px;

}

li.zamer {
   color: #353535;
   font-size: 13px;
   font-weight: bold;
   letter-spacing: 3px;
   line-height: 35px;
   list-style: circle;
   list-style-position: inside;
   list-style-position: inside;
   margin: 0;
   text-align: left;
}

p {
   font-size: 12px;
}

p.justify {
   text-align: justify;
}

p.justify:first-letter {
   padding-left: 1.5em;
}

q {
   quotes: "\201E" "\201D";
}

q:after {
   content: close-quote;
}

q:before {
   content: open-quote;
}

strong, b {
   font-weight: bold;
}

ul {
   color: #9F9D44;
   line-height: 25px;
   text-align: justify;
}

ul.zamer {
   line-height: 35px;
   text-align: left;
}

.ahem {
   display: none;
}

.center {
   text-align: center;
}

.graf {
   text-align: center;
}

.nowrap {
   font-size: 10px;
   font-weight: bold;
   margin-bottom: 0; /* must be combined with nobr in html for ie5win */
   margin-top: 0;
   white-space: nowrap;
}

.poznamka {
   font-size: 11px;
}

.sub {
   font-size: 10px;
   vertical-align: sub;
}

.tiny {
   font-size: 9px;
   line-height: 16px;
   margin-bottom: 5px;
   margin-top: 15px;
}

#content {
   padding: 0px 0px 0px 0px;
   text-align: left;
   width: 801px;
}

#content>p+p {
   text-indent: 0px;
}

/* obsah */
#contentframe {
   background: url(../images/layout/kronospan_14.png) no-repeat top left;
   text-align: left;
   width: 841px;
}

#contenttext {
	float: left;
	height: 600px;
	left: 134px;
	margin-top: 1px;
	text-align: left;
	width: 263px;
	font-size: 11px;

}

#contenttext p {
   padding: 10px 15px 15px 15px;
   text-align: left;
}

#contenttext li {
	text-align: left;
	padding-left: 10px;

}

#contenttimages {
	float: left;
	height: 600px;
	left: 397px;
	margin-top: 1px;
	text-align: center;
	width: 264px;
	padding-top: 10px;

}

#contenttimages .content {
   padding: 30px 15px 15px;
   text-align: center;
}

#logo {
   left: 75px;
   position: relative;
   top: 50px;
}

/* menu */
#menu {
   background-color: #FFF;
   color: #000;
   height: 20px;
   left: 0;
   padding: 0;
   top: 0;
   width: 800px;
}

/* polozky menu */
#menufirma {
   float: left;
   height: 20px;
   left: 0;
   text-align: center;
   width: 133px;
}

#menukontakt {
   float: left;
   height: 20px;
   width: 132px;
}

#menunovinky {
   float: left;
   height: 20px;
   width: 132px;
}

#menupredaj {
   float: left;
   height: 20px;
   width: 132px;
}

#menuprodukty {
   float: left;
   height: 20px;
   width: 132px;
}

#menuspacer {
   float: left;
   height: 20px;
   width: 139px;
}

/* submenu */
#submenufirma {
	float: left;
	height: 800px;
	left: 0px;
	margin-bottom: 0;
	margin-top: 1px;
	text-align: left;
	top: 0px;
	width: 133px;
	background-color: #DBE1E3;
	padding-top: 10px;

}

#submenufirma .content {
   padding: 10px;
   text-align: right;
}

#submenuprodukty {
   float: left; /*   background-color: #DBE1E3;*/
   height: 600px;
   left: 134px;
   margin-bottom: 0;
   margin-top: 1px;
   text-align: left;
   top: 0px;
   width: 132px;
   position: relative;
   background: #DBE1E3 url(../images/layout/kronospan_20.png) no-repeat top left;
}

#submenuprodukty .content {
   padding: 10px 10px 10px 10px;
   text-align: right;
}

#submenupredaj {
   float: left; /*   background-color: #DBE1E3;*/
   height: 600px;
   left: 266px;
   margin-bottom: 0;
   margin-top: 1px;
   text-align: left;
   top: 0px;
   width: 132px;
   position: relative;
   background: #DBE1E3/* url(../images/layout/kronospan_16.png) no-repeat top left;*/
}

#submenupredaj .content {
   padding: 10px 10px 10px 10px;
   text-align: right;
}

#submenunovinky {
   float: left; /*   background-color: #DBE1E3;*/
   height: 600px;
   left: 398px;
   margin-bottom: 0;
   margin-top: 1px;
   text-align: left;
   top: 0px;
   width: 132px;
   position: relative;
   background: #DBE1E3 /*url(../images/layout/kronospan_17.png) no-repeat top left;*/
}

#submenunovinky .content {
   padding: 10px 10px 10px 10px;
   text-align: right;
}

/* vrchny riadok */
#submenukontakt {
   float: left; /*   background-color: #DBE1E3;*/
   height: 600px;
   left: 529px;
   margin-bottom: 0;
   margin-top: 1px;
   text-align: left;
   top: 0px;
   width: 132px;
   position: relative;
   background: #DBE1E3 /*url(../images/layout/kronospan_18.png) no-repeat top left;*/
}

#submenukontakt .content {
   padding: 10px 10px 10px 10px;
   text-align: right;
}

#top {
   background-color: #FFF;
   color: #000;
   height: 131px;
   left: 0;
   padding: 0;
   top: 0;
   width: 800px;
}

#topfirma {
   background: url(../images/layout/kronospan_1.png);
   float: left;
   height: 131px;
   left: 0;
   text-align: center;
   width: 133px;
}

#topfirmaselected {
   background: url(../images/layout/kronospan_1_selected.png);
   float: left;
   height: 131px;
   left: 0;
   text-align: center;
   width: 133px;
}

#topkontakt {
   background: url(../images/layout/kronospan_5.png);
   float: left;
   height: 131px;
   width: 132px;
}

#topkontaktselected {
   background: url(../images/layout/kronospan_5_selected.png);
   float: left;
   height: 131px;
   width: 132px;
}

#topnovinky{
   background: url(../images/layout/kronospan_4.png);
   float: left;
   height: 131px;
   width: 132px;
}

#topnovinkyselected{
   background: url(../images/layout/kronospan_4_selected.png);
   float: left;
   height: 131px;
   width: 132px;
}

#toppredaj {
   background: url(../images/layout/kronospan_3.png);
   float: left;
   height: 131px;
   width: 132px;
}

#toppredajselected {
   background: url(../images/layout/kronospan_3_selected.png);
   float: left;
   height: 131px;
   width: 132px;
}

#topprodukty {
   background: url(../images/layout/kronospan_2.png);
   float: left;
   height: 131px;
   width: 132px;
}

#topproduktyselected {
   background: url(../images/layout/kronospan_2_selected.png);
   float: left;
   height: 131px;
   width: 132px;
}

#topspacer {
   background: url(../images/layout/kronospan_6.png) no-repeat left;
   float: left;
   height: 131px;
   width: 139px;
}

/*q {
   font-style: italic;
   quotes: "„" "“" "‚" "‘";
}
*/

.hide {
  display: none;
}

.dekorymale {
	border: 0px;
	border-collapse : collapse;
	empty-cells : hide;
}

.dekorymale td {
	padding: 3px 3px 3px 3px;
	vertical-align: middle;
}
.semibold {
	font-weight: bold;
	color: #555555;
}

INPUT {
    font: 12px "Tahoma CE", "Arial CE", "Helvetica CE", Tahoma, Arial, lucida, sans-serif;
	color : #555555;
	border : 1px solid #999999;
}

SELECT {
    font: 12px "Tahoma CE", "Arial CE", "Helvetica CE", Tahoma, Arial, lucida, sans-serif;
	color : #555555;
	border : 1px solid #999999;
	width: 235px;
}

TEXTAREA {
    font: 12px "Tahoma CE", "Arial CE", "Helvetica CE", Tahoma, Arial, lucida, sans-serif;
	color : #555555;
	border : 1px solid #999999;
	width: 235px;
}

.obrazoksokrajom {
	border: 1px solid #CCCCCC;
}

.obrazokcertifikat {
	border: 1px solid #CCCCCC;
	text-align: center;
}

#contenttext2 {
	float: left;
	height: 600px;
	left: 134px;
	margin-top: 1px;
	text-align: left;
	width: 527px;
	font-size: 11px;

}

#contenttext2 p {
   padding: 10px 15px 15px 15px;
   text-align: left;
}

#contenttext2 li {
	text-align: left;
	padding-left: 10px;

}

#contenttimages2 {
	float: left;
	height: 600px;
	left: 529px;
	margin-top: 1px;
	text-align: center;
	width: 132px;
	padding-top: 42px;

}

#contenttimages2 .content {
   padding: 30px 15px 15px;
   text-align: center;
}

#contenttable {
	float: left;
	height: 600px;
	left: 134px;
	margin-top: 1px;
	text-align: left;
	width: 528px;
	font-size: 11px;

}

#contentable p {
   padding: 10px 15px 15px 15px;
   text-align: left;
}

table {
   color: #353535;
   font: 11px "Tahoma CE", "Arial CE", "Helvetica CE", Tahoma, Arial, lucida, sans-serif;
}
