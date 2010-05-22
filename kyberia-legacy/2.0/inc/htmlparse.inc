<?php
/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */


class htmlparse {

function htmlparse($data)
{
   /*
   if function finds anything unsafe,it will return
   FALSE and saves a reason info global variable $htmlparse
   */

   global $htmlparse;

   $data = StrToLower(" ".$data);

   // tags, I don need to close
   $unpaired = Array('br'=>1,
                     'br/'=>1, // fix later ;)
                     'li'=>1,
                     'hr'=>1,
                     '/tr'=>1,
                     'img'=>1,
                     'p'=>1
                     );

   // allowed tags
   $allowed = Array('b'=>1,
                    'i'=>1,
                    'u'=>1,
                    'a'=>1,
                    'img'=>1,
                    'sup'=>1,
                    'sub'=>1,
                    'table'=>1,
                    'tr'=>1,
                    'td'=>1,
                    'font'=>1,
                    'ul'=>1,
                    'ol'=>1,
                    'li'=>1,
                    'tt'=>1,
                    'address'=>1,
		    'code'=>1,
                    'small'=>1,
                    'big'=>1,
                    'caption'=>1,
                    'thead'=>1,
                    'tfoot'=>1,
                    'col'=>1,
                    'colgroup'=>1,
                    'th'=>1,
                    'br'=>1,
                    'br/'=>1, // fix later
                    'hr'=>1,
                    'em'=>1,
                    'th'=>1,
                    'center'=>1,
                    'pre'=>1,
                    'xmp'=>1,
                    's'=>1,
                    'strong'=>1,
                    'legend'=>1,
                    'h1'=>1,
                    'h2'=>1,
                    'h3'=>1,
                    'h4'=>1,
                    'h5'=>1,
                    'h6'=>1,
                    'p'=>1,
                    'blockquote'=>1,
                    'div'=>1,
                    'span'=>1,
                    'fieldset'=>1
                    );

   /*
   this part will go trought string and will ensure, if all tags are closed
   */

   $tok = StrTok($data, '<');
   $tok = StrTok('<');
   while(!($tok === FALSE)){
      if(!StrStr($tok,'>')):
         $htmlparse = 'Chyba HTML syntaxe!';
         //$htmlparse = 'Wrong HTML syntax!';
         return 0;
      elseif(StrStr($tok,"<")):
         $htmlparse = 'Chyba HTML syntaxe!';
         //$htmlparse = 'Wrong HTML syntax!';
         return 0;
      endif;
      $tok = StrTok('<');
   }

   /*
   main part of the function - it will check allowed tags, some parameters and so on...
   */

   $tok = StrTok($data, '<');
   $i = 0;
   $j = 0;
   while(!($tok === FALSE)):
      if($i == 1):
         $tag = Split('>',$tok,2);
         $attrib = Split("[[:space:]>]",$tag[0],2);
         if($allowed[$attrib[0]] != 1 && $allowed[SubStr($attrib[0],1)] != 1): // if tag isn in allowed array
            $htmlparse = 'Zakazany tag &lt;'.$attrib[0].'&gt;!';
            //$htmlparse = 'Forbidden tag &lt;'.$attrib[0].'&gt;!';
            return 0;
         endif;
         if('/'.$tags[$j] == $attrib[0]): // closing tag for last opening tag
            if($tags[$j] == 'table' && $opened_tables > 0):
               $opened_tables--;
            endif;
            $j--;
         elseif($tags[$j] == 'xmp'): // XMP tag...ignore eny other tags between them
         else:
            if(SubStr($attrib[0],0,1) == '/' && $unpaired[$tags[$j]]): // do I need to close the tag?
               $j--;
               continue;
            elseif(SubStr($attrib[0],0,1) == '/'): // am I closing something, I didn open?
               $htmlparse = 'Chyba u tagu &lt;'.$tag[0].'&gt;! Zavirate tag, ktery jste neotevrel!';
               //$htmlparse = 'Error near tag &lt;'.$tag[0].'&gt;! Closing tag, that wasn opened!';
               return 0;
            elseif(Ereg(' on',' '.$attrib[1])): // temporary solution for pernament problem...and it isn suicide
               $htmlparse = 'JavaScript je na hovno!';
               //$htmlparse = 'JavaScript sux!';
               return 0;
            elseif(Ereg('/on',' '.$attrib[1])): // temporary solution for pernament problem...and it isn suicide
               $htmlparse = 'z bezpecnostnych dovodov nieje povolene vkladat do tagov retazec "/on"';
               return 0;


/*
            elseif(Ereg(' style',' '.$attrib[1])): // styles are forbidden - don look at me THAT way ;)
               $htmlparse = 'Ten "style" se mi tam nezda!';
               //$htmlparse = '"styles" are forbidden!';
               return 0;
*/
            elseif(Ereg('://',' '.$attrib[1]) && $attrib[0] != "img" && $attrib[0] != "a"): // adresses in attributes (except A and IMG tags) are forbidden
               $htmlparse = 'Neco se mi tam nelibi! To je hlaska HTML validace - nejedna se o nejakou cenzuru ;)';
               //$htmlparse = 'Forbidden usage of adresses in tags!';
               return 0;
            elseif((SubStr_Count($attrib[1],'"')%2) > 0): // are quotes closed? can do mess if they aren
               $htmlparse = 'Neuzavrel jste uvozovky uvnitr tagu &lt;'.$attrib[0].'&gt;!';
               //$htmlparse = 'Close quotes in tag &lt;'.$tag[0].'&gt;!';
               return 0;
            elseif(Ereg('\?',$attrib[1]) && $attrib[0] == 'img'): // don allow parameters in IMG tags
               $htmlparse = 'Chyba u tagu &lt;img&gt; - nejsou povoleny parametry v adrese!';
               //$htmlparse = 'Error in tag &lt;img&gt; - parameters in image adresses are forbidden!';
               return 0;
            elseif(($attrib[0] == 'td' || $attrib[0] == 'tr') && $opened_tables == 0):
               $htmlparse = 'Strkej si ty tagy do vlastni tabulky, jo?';
               return 0;
            elseif($attrib[0] == 'table'):
               $opened_tables++;
            endif;
            $j++;
            $tags[$j] = $attrib[0];
         endif;
      endif;
      $tok = StrTok('<');
      $i = 1;
   endwhile;

   /*
   just check, if all tags are properly closed
   */

   while($j > 0):
      if($unpaired[$tags[$j]]):
         $j--;
         continue;
      else:
         $htmlparse = 'Neuzavrel jste tag &lt;'.$tags[$j].'&gt;!';
         //$htmlparse = 'Tag &lt;'.$tags[$j].'&gt; wasn closed correctly!';
         return 0;
      endif;
   endwhile;
return 1;
}

}