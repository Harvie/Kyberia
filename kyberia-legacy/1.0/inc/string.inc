<?php
/*
 * String.inc		1.00 2001/03/08
 *
 * Copyright 2001 Czech On Line a.s. All Rights Reserved.
 */

class String {

	function String() {
	}

	function escapeSpecialChars($str, $dir = "to") {
		$from[] = 'œ';
		$to[] = '&#339;';
		$from[] = 'ß';
		$to[] = '&szlig;';
		$from[] = 'â';
		$to[] = '&acirc;';
		$from[] = 'ê';
		$to[] = '&ecirc;';
		$from[] = 'à';
		$to[] = '&agrave;';
		$from[] = 'î';
		$to[] = '&icirc;';
		$from[] = 'ç';
		$to[] = '&ccedil;';
		$from[] = 'ô';
		$to[] = '&ocirc;';
		$from[] = 'û';
		$to[] = '&ucirc;';

		if ($dir == "to") {
			return str_replace($from, $to, $str);
		} elseif ($dir == "from") {
			return str_replace($to, $from, $str);
		}
	}

	function unhtmlspecialchars($str) {
	        $trans = get_html_translation_table(HTML_SPECIALCHARS);
	        $trans = array_flip($trans);
	        return strtr($str, $trans);
	}
	

	function cutString($string, $cut_limit, $cut_words = 0) {
		// returns $string cutted to lenght $cut_limit or limited to $cut_words words
		// if $cut_words is used, $cut_limit is ignored
		// returned string is also choped and trimed
		$str_tmp = trim(chop($string));
		$StringArray=explode(" ", $str_tmp);
		if ($cut_words) {
			if (count($StringArray) < $cut_words) {
				return $str_tmp;
			}
			$string_cut = "";
			for ($i=0; $i < $cut_words; $i++) {
				$string_cut .= " " . $StringArray[$i];
			}
			return ltrim($string_cut) . "...";
		} else {
			if ($cut_limit > strlen($str_tmp)) {
				return $str_tmp;
			}
			$string_cut = "";
			$threedots_length = 3;
			$i = 0;
			while (strlen($string_cut)+strlen($StringArray[$i])+$threedots_length < $cut_limit) {
				$string_cut .= " " . $StringArray[$i];
				$i++;
			}
			return ltrim($string_cut) . "...";
		}
	}

	function escapeSql($str) { 
		# single quote ('), double quote ("), backslash (\) and
        # NUL (the NULL byte)
        $str = addslashes($str);
		return $str;
	}

	function unescapeSql($str) {
		$str = stripslashes($str);
        return $str;
    }

    function escapeSqlLike($str) {
        $str = $this->escapeSql($str);
 		$str = str_replace('%','\%', $str);
		$str = str_replace('_','\_', $str);
        return $sql;
    }

    function unescapeSqlLike($str) {
        $str = $this->unescapeSql($str);
		$str = str_replace('\%','%',$str);
		$str = str_replace('\_','_',$str);
		return $str;
	}	
	
	/**
	 * Recode a <code>string</code> into plain ascii string
	 * replace <code>czech</code> characters
	 * 
	 * @param string 
	 * @return a string
	*/
	function recodeToAscii($string) {
		return strtr($string, "áèïéìíòóøšúùıÁÈÏÉÌÍÒÓØŠÚÙİ¹»¾©«®", "acdeeinorstuuyzACDEEINORSTUUYZstzSTZ");
	}

	/*
	 * winToIso(string)
	 * isoToWin(string)
	 * converts czech code pages: Windows CP1250 to Latin ISO-8859-2
	 */
	
	function winToIso($string) {
		return strtr($string,'šŠ','¹»¾©«®');
	}
	function isoToWin($string) {
		return strtr($string,'¹»¾©«®','šŠ');
	}
	
	/**
	* Next 4 function are for changing case of a <code>string</code> within its coding.
	*
	* @param string 
	* @return a string
	*/
	
	function strToUpperCZ($str) {
		$str = strtoupper(strtr($str, 'áèïéìíå¾òóøšúùı¹»¾', 'ÁÈÏÉÌÍÅ¼ÒÓØŠÚÙİ©«®'));
		return $str;
	}

	function strToUpperCS($str) {
		return $this->strToUpperCZ($str);
	}

	function strToLowerCZ($str) {
		$str = strtolower(strtr($str, 'ÁÈÏÉÌÍÅ¼ÒÓØŠÚÙİ©«®', 'áèïéìíå¾òóøšúùı¹»¾'));
		return $str;
	}

	function strToLowerCS($str) {
		return $this->strToLowerCZ($str);
	}

	function dateToSql($value) {
            return (sprintf("%04d-%02d-%02d", $value["year"], $value["mon"], $value["mday"]));
	}
	
	function sqlToDate($value) {
            $a["year"]=(int)substr($value,0,4);
            $a["mon"]=(int)substr($value,5,2);
            $a["mday"]=(int)substr($value,8,2);
            return ($a);
	}
					
	function timeToSql($value) {
            return (sprintf("%02d:%02d:%02d", $value["hours"], $value["minutes"], $value["seconds"]));
	}
						
	function sqlToTime($value) {
            $a["hours"]=(int)substr($value,0,2);
            $a["minutes"]=(int)substr($value,3,2);
            $a["seconds"]=(int)substr($value,6,2);
            return ($a);
	}
										
	function dateTimeToSql($value) {
            return (sprintf("%04d-%02d-%02d %02d:%02d:%02d", $value["year"], $value["mon"], $value["mday"], $value["hours"], $value["minutes"], $value["seconds"]));
	}
											
	function sqlToDateTime($value) {
        $a["year"]=(int)substr($value,0,4);
        $a["mon"]=(int)substr($value,5,2);
	    $a["mday"]=(int)substr($value,8,2);
	    $a["hours"]=(int)substr($value,11,2);
	    $a["minutes"]=(int)substr($value,14,2);
	    $a["seconds"]=(int)substr($value,17,2);
	    return ($a);
	}

    function sqlToUnix($value) {
        $dt = $this->sqlToDateTime($value);
        return mktime($dt['hours'], $dt['minutes'], $dt['seconds'],
                      $dt['mon'], $dt['mday'], $dt['year']);
    }

    function czTime($value, $seconds=TRUE) {
        if ($seconds) {
            return sprintf("%d:%02d:%02d", $value['hours'], $value['minutes'],
                           $value['seconds']);
        }
        else {
            return sprintf("%d:%02d", $value['hours'], $value['minutes']);
        }
    }

    function czDate($value) {
        return sprintf("%d.%d.%d", $value['mday'], $value['mon'],
                       $value['year']);
    }

	function encodeString($string) {
		for ($i = 0;$i < strlen($string);$i++) {
			$ch = substr($string,$i,1);
			$ch = ord($ch)+100;
			$encoded_string .= dechex($ch);
		}
		return $encoded_string;
	}

	function decodeString($string) {
		for ($i = 0;$i < strlen($string);$i += 2) {
			$ch = substr($string,$i,2);
			$ch = hexdec($ch);
			$ch -= 100;
			$decode_string .= chr($ch);
		}
		return $decode_string;
	}
}
?>
