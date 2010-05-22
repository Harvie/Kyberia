<?
/*
 * XML Array class - parses an XML file and inserts the parsed data into a
 * multidimensional array.
 *
 * Version 1.2 - 2001-03-02 - Chris Bolt - chris at bolt dot cx
 *
 * Simple Usage: $xmlfile = new xmlarray();
 *               $arr = $xmlfile->parsefile("somefile.xml");
 *
 * More detailed documentation can be found at
 * http://www.bolt.cx/apps/xmlarray/xmlarray.html
 */

// for html decoding
include_once("string.inc");

class xmlarray {

  var $parser;
  var $data = array(), $indexes = array();
  var $indexidx = -1;
  var $position;
  var $idname;
  var $combine, $combined = false;
  var $xmlerrorcode, $xmlerrorline;
  var $useincpath, $rootarray;
  var $newelement;

  function startElement($parser, $name, $attribs) {
	$this->newelement = true;
    $this->indexidx++;
	//($this->indexes[$this->indexidx]["name"] != $name && ! $this->indexes[$this->indexidx]["name"]) ? $this->indexes[$this->indexidx] = array("count" => 0, "name" => $name) : $this->indexes[$this->indexidx]["count"]++;
    if (empty($this->indexes[$this->indexidx]['name']) && isset($name) ) {
		$this->indexes[$this->indexidx] = array("count" => 0, "name" => $name);
	} else {
		$this->indexes[$this->indexidx]["count"]++;
	}
	if (empty($this->position) ) {
	 $this->position="";
	}
	$this->position .= "[\"$name\"][" . (isset($this->indexes[$this->indexidx]["count"]) ? $this->indexes[$this->indexidx]["count"] : 0 ) . "]";
	
    if (sizeof($attribs)) {
      $atts = array();
      while (list($k, $v) = each($attribs))
        $atts[$k] = $v;
      eval("\$this->data$this->position = \$atts;");
    }
  }

  function endElement($parser, $name) {
    unset($this->indexes[$this->indexidx + 1]);
    $this->indexidx--;

    // for empty elements; too much sofisticated:)
    $pos = "\$this->data{$this->position}";
    $value = @eval("return $pos;");
    if (empty($value) ) {
      eval("$pos = '';");
    }

    for ($i = 0; $i < 2; $i++)
      $this->position = substr($this->position, 0, strrpos($this->position, "["));
  }

  function characterData($parser, $data) {
    // replace parse_nl to &#10;
    $data = str_replace("#parse_nl#","&#10;",$data);
    // unhtml
    $data = String::unhtmlspecialchars($data);

    // position for eval
    $pos = "\$this->data$this->position";

    // only non blank element will be parsed
    if (trim($data)) {
      $code = "if (count($pos) < 1)
  $pos = \$data;
elseif (\$this->newelement == false)
  $pos .= \$data;
elseif (count($pos) == 1) {
  \$tmp = array($pos, \$data);
  $pos = \$tmp;
} else
  $pos" . "[] = \$data;";
      @eval($code);
    }
      $this->newelement = false;
  }

  function walkarray(&$array) {
	if (!is_array($array)) return $array;
    reset($array);
    while (list($key, $value) = each($array)) {
      if (is_array($array[$key])) {
        if (count($array[$key]) == 1)
          $array[$key] = $array[$key][key($array[$key])];
        if (is_array($array[$key])) {
          $array[$key] = $this->walkarray($array[$key]);
//          if (!empty($this->idname) && !empty($array[$key][$this->idname]) && is_int($key)) {
          if (($this->idname != "") && (($array[$key][$this->idname] != "") || is_int($array[$key][$this->idname])) && is_int($key)) {
            if (ereg("[^0-9]", $array[$key][$this->idname]))
              $array[$array[$key][$this->idname]] = $array[$key];
            else
              $array["$this->idname" . "_" . $array[$key][$this->idname]] = $array[$key];
            unset($array[$key]);
          }
        }
      }
    }
    return $array;
  }

  function xmlarray($idname = "", $rootarray = "", $combinesinglearrays = true, $useincpath = false) {
    $this->idname = $idname;
    $this->rootarray = $rootarray;
    $this->combine = $combinesinglearrays;
    $this->useincpath = $useincpath;
  }

  function parsefile($filename) {
    $numargs = func_num_args();
    if ($numargs > 1) {
      $funcarg = func_get_arg(0);
      $temparray = $this->parsefile($funcarg);
      for ($i = 1; $i < $numargs; $i++) {
        $funcarg = func_get_arg($i);
        $temparray = array_merge_recursive($temparray, $this->parsefile($funcarg));
      }
      return $temparray;
    }
    else
      $filename = func_get_arg(0);

    $this->data = array();
    $this->indexes = array();
    $this->indexidx = -1;
    unset($this->position);
    $this->combined = false;

    $this->parser = xml_parser_create();
    xml_set_object($this->parser, $this);
    xml_parser_set_option($this->parser, XML_OPTION_CASE_FOLDING, 0);
    xml_set_element_handler($this->parser, "startElement", "endElement");
    xml_set_character_data_handler($this->parser, "characterData");

    $fp = fopen($filename, "r", $this->useincpath);
    if ($fp) {
      while ($tmpdata = fread($fp, 4096))
        if (!xml_parse($this->parser, $tmpdata, feof($fp))) {
          $this->xmlerrorcode = xml_get_error_code($this->parser);
          $this->xmlerrorline = xml_get_current_line_number($this->parser);
          xml_parser_free($this->parser);
          fclose($fp);
          return false;
        }
      fclose($fp);
    }

    if ($this->combine == true) {
      $this->data = $this->walkarray($this->data);
      $this->combined = true;
    }
    xml_parser_free($this->parser);

    return ($this->rootarray != "") ? $this->data[$this->rootarray] : $this->data;
  }

  function parse($data) {
    // fix to \n proper parsing
    // \n is replaced by #parse_nl#
    // back replace is in characterData function 
    $data = str_replace("&#10;","#parse_nl#",$data);
 
    $this->data = array();
    $this->indexes = array();
    $this->indexidx = -1;
    unset($this->position);
    $this->combined = false;

    $this->parser = xml_parser_create();
    xml_set_object($this->parser, $this);
    xml_parser_set_option($this->parser, XML_OPTION_CASE_FOLDING, 0);
    xml_set_element_handler($this->parser, "startElement", "endElement");
    xml_set_character_data_handler($this->parser, "characterData");

    if (!xml_parse($this->parser, $data,1)) {
      $this->xmlerrorcode = xml_error_string(xml_get_error_code($this->parser));
      $this->xmlerrorline = xml_get_current_line_number($this->parser);
	echo $this->xmlerrorcode."<br>";
	echo $this->xmlerrorline;
	  xml_parser_free($this->parser);
      return false;
    }

    if ($this->combine == true) {
      $this->data = $this->walkarray($this->data);
      $this->combined = true;
    }
    xml_parser_free($this->parser);

    return ($this->rootarray != "") ? $this->data[$this->rootarray] : $this->data;
  }

}
?>
