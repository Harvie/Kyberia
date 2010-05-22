<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

body {
 color : #1d42ae;
 font-size: 8pt;
 font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
 text-decoration: none; 
 margin: 0px;
 background-color: #000000;
 background-position: top center;
 background-repeat: no-repeat;
 scrollbar-shadow-color: #1d42ae;
 scrollbar-highlight-color: #000000;
 scrollbar-3dlight-color: #1d42ae;
 scrollbar-base-color: #000000;
 scrollbar-darkshadow-color: #000000;
 scrollbar-track-color: #000000;
 scrollbar-arrow-color: #000000;
}

.t1 {
 position: fixed;
 top: 0px;
 left: 0px;
 text-align: center;
 background-color: transparent;
 width: 100%;
 height: 20px;
}

inframe {
 width: 90%;
 height:230px;
}

textarea.small {
 width : 90%;
 height : 42px;
 border-color: #1d42ae;
 background-color: transparent;
 overflow: hidden;
 font-color: white;
 color: white;
}

a {
 color: white;
 font-size: 8pt;
 font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
 text-decoration: none;
}

a:hover {
 color: white;
 font-size: 8pt;
 font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
 text-decoration: none;
 border-bottom: 1px solid red;
}

a.mail {
 color: red;
 font-size: 8pt;
 font-weight: bold;
 text-align: center;
 font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
 text-decoration: none;
}

a.mail:hover {
 color: white;
 font-size: 8pt;
 font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
 text-decoration: none;
 font-weight: bold;
 text-align: center;
}

a.mail:active {
 border-bottom: 5px solid #333;
}

.active_user_img a {
 border-bottom: 1px solid transparent;
}
.active_user_img a:hover {
 border-bottom: 1px solid red;
}

a img {
 border-bottom: 1px solid transparent;
}

img a:hover {
 border-bottom: 0px solid red;
}

td {
 font-size: 8pt;
 font-family: Verdana, "Arial CE", "Helvetica CE", Arial, Helvetica;
 wordwrap: break-word;
}

table[width="666"] {
 background: #111;
}

.bordered {
 border: solid 0px #1d42ae;
 border-bottom: solid 1px #333333;
 background: #000;
}

.bordered2 {
 border-left: solid 1px #1d42ae;
 border-right: solid 1px #1d42ae;
 border-bottom: solid 1px #1d42ae;
}

input {
 color: white;
 font-size: 8pt;
 font-family: Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular;
 background-color: transparent;
 vertical-align: middle;
 border: solid 1px #1d42ae; height: 18px
}

input[type=submit] {
 color: #1d42ae;
 background-color: #000;
 border: 1px solid #1d42ae;
}

input[type=submit]:focus {
 background-color: #1d42ae;
 color: #000000;
}

input.small {
 color: white;
 font-size: 8pt;
 font-family: Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular;
 background-color: transparent;
 width: 50px;
 vertical-align: middle;
 border: solid 1px #1d42ae;
 height: 18px
}

select {
 color: white;
 font-size: 8pt;
 font-family: Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular;
 background-color: #000000;
 width: 80px;
 vertical-align: middle;
 border: solid 1px #1d42ae; height: 18px ;
}

.header {
 background: #020202;
 border-bottom: solid 1px #1d42ae;
 height: 100%;
 width: 100%;
 vertical-align: top;
 align: left;
 padding: 0pt; width: 100%;
}

.important {
 font-weight: bold;
 text-align: center;
}

.most_important {
 font-weight: bold;
 font-color: red;
 color: red;
}

.active_users .active_user_img {
 width: 50px;
 float: left;
}

.active_users .active_user_name {
 text-align: center;
}

td[width="16%"] {
 border: 0px solid pink;
}

textarea {
 width : 666px;
 height: 123px;
 background-color: transparent;
 border: 1px solid #1d42ae;
 color: white;
 font-family: monospace;
 font-size: 8pt;
}

textarea:focus {
 border: 1px solid #ffffff;
 color: #1d42ae;
}

input[type=text]:focus {
 border: 1px solid #ffffff;
 color: #1d42ae;
}

textarea.node_content {
 width : 800px;
 height: 666px;
 background-color: transparent;
 border: 1px solid #1d42ae;
 color: white;
}

textarea.node_content:focus {
 border: 1px solid #ffffff;
 color: #1d42ae;
}

input[value='delete'] {
 position: fixed;
 right: 105px;
 bottom: auto;
 bottom: 10px;
}

input[value='put'] {
 position: fixed;
 right: 61px;
 bottom: auto;
 bottom: 10px;
}

input[name='nodeshell_id'] {
 position: fixed;
 right: 10px;
 bottom: auto;
 bottom: 10px;
 background-color: #000000;
}
