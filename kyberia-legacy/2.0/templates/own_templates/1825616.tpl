<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

{include file="modules/header.tpl"}
{if $user_id eq false}
{include file="modules/loginbox.tpl"}
{/if}

{ get_movement_params children_count=$node.node_children_count }
<link rel="stylesheet" href="http://reyko.wz.cz/gothic_klub/darkstyles.css" type="text/css">
<center><a href="#book"><-------------------book/K/info/members-------------------></a></center>
<center>
  <table width='90%'>
    <tr>
      <!--main central column-->
      <td width=66% valign='top' colspan="2"><p class="topic"></p>
          <center>
            <b><font face="Copperplate Gothic Bold" size="8" color="white">G o <font color="red">t</font> h i c &nbsp;&nbsp;k l u b</font></b>
          </center>
          <!-- THE CHAMBERS -->
          <p class="topic"></p>
          <center>
            <img src="http://kyberia.sk/id/1899658/download">
          </center>
          <p class="topic"></p>
          <center>
            <!--MENU-->
            <table width="100%">
              <tr>
                <td width="20%" valign="top" align="center"><table>
                    <tr>
                      <td class="menu">LYBRARIES</td>
                    </tr>
                    <tr>
                      <td><a href="">#dark poems</a>
                        <tr>
                          <td><a href="">#tales from the cript</a>
                                <tr>
                                  <td><a href="">#thinking about life & death</a>
                                                <tr>
                                                  <td><a href="">#magic & occult</a>
                                                                                <tr>
                                                                                  <td><a href="">#voices inside my head </a>
                                                                                <tr>
                                                                                  <td><a href="">#personal shouts & trash</a>
                                                                                                                                                  </table>
                <td width="20%" valign="top" align="center"><table>
                    <tr>
                      <td class="menu">GALLERIES</td>
                    </tr>
                    <tr>
                      <td><a href="">#gothic babes </a>
                    <tr>
                      <td><a href="">#art photo </a>
                    <tr>
                      <td><a href="">#blood photos </a>
                    <tr>
                      <td><a href="">#shadows at cemeteries </a>
                    <tr>
                      <td><a href="">#nature at night </a>
                    <tr>
                      <td><a href="">#vampire ladies </a>
                    <tr>
                      <td><a href="">#fantasy art </a>
                    <tr>
                      <td><a href="">#erotic </a>
                  </table>
                <td width="20%" valign="top" align="center"><table>
                    <tr>
                      <td align="center"><a href=""><font color="#666666">^v^ Main Cript ^v^</font></a>
                        <tr>
                          <td><img src="http://darkfenix.blogs.sapo.pt/arquivo/Fire-Fenix-thumb.jpg">
                                <tr>
                                  <td align="center" class="menu">FORUMS
                                <tr>
                                  <td align="center"><a href="">#satanismus</a>
                                                <tr>
                                                  <td align="center"><a href="">#goth subculture</a>
                                                                                <tr>
                                                                                  <td align="center"><a href="">#todays world</a>
                                                                                                                                                  </table>
                <td width="20%" valign="top" align="center"><table>
                    <tr>
                      <td class="menu">MUSIC</td>
                    </tr>
                    <tr>
                      <td><a href="">#black & gothic metal</a>
                        <tr>
                          <td><a href="">#gothic rock </a>
                        <tr>
                          <td><a href="">#death metal </a>
                        <tr>
                          <td><a href="">#viking/folk metal </a>
                        <tr>
                          <td><a href="">#free download </a>
                        <tr>
                          <td><a href="">#the best of all </a>
                        <tr>
                          <td><a href="">#linkz </a>
                      </table>
                <td width="20%" valign="top" align="center"><table>
                    <tr>
                      <td class="menu">LINKZ</td>
                    </tr>
                    <tr>
                      <td><a href="">#gothic pages </a>
                    <tr>
                      <td><a href="">#gothic and underground shops </a>
                    <tr>
                      <td><a href="">#forums at kyberia.sk </a>
                    <tr>
                      <td><a href="">#homepages of lost souls </a>
                  </table>
            </table>
          </center>
          <p class="topic"></p>
          <!-- CONTENT -->
      <tr>
        <td width="100%"> {* $node.node_content|escape:"html"|nl2br *} {include file="modules/node_content.tpl"} <br>
      <br>
      <br>
      <br>
      <br>
      <center>
        {* showing poll *} {include file="modules/get_poll_box.tpl"}
      </center>
      <p class="flame"></p>
      <p class="topic"></p>
      <center>
        {*showing form for adding child node*}
          <form enctype="multipart/form-data" action='/id/{$node.node_id}/{if $action neq false}{$action}{/if}'method='post' name='formular'>
            <div align="center">{if $permissions.w eq true}{include file="modules/addnode.tpl"}{/if} {include file="modules/get_threaded_children.tpl" children_type=4} </div>
          </form>
          <center>
            <p>{include file="modules/movement.tpl"} </p>
            <table width="100%" height="100%"  border="0">
      <tr>
        <td width="50%" height="100%" align='center' valign='top'><fieldset>
          <legend>Book/K/info</legend>
          <a name="book">{* show node info *}</a> {include file="modules/node_settings.tpl"}
        </fieldset></td>
        <td width="50%" height="100%" align="center" valign="top"><fieldset>
          <legend>Members</legend>
          {*showing bookmark_statistics*} {include file="modules/get_bookmark_statistics_box.tpl"}
        </fieldset></td>
        <!--end of left column-->
      </tr></table>

          </center>
          <!--end of central column-->
          <!--left column-->
      </center>
  </table>
</center>


{include file="modules/footer.tpl"}
