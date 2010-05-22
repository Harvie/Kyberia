<?php
function smarty_function_circle_coordinates($params, &$smarty)
{
        $center_x=$params['center_x'];
        if (!$center_x) $center_x=280;
        $center_y=$params['center_y'];
        if (!$center_y) $center_y=280;
        $radius=$params['radius'];
        if (!$radius) $radius=23;
//	echo $center_y;
//	echo $center_x;
//	echo "<BR>";
        $amount=$params['amount'];
        $iteration=$params['iteration'];

        $deg=(360/$amount);
        $deg*=$iteration;

        $sin=sin(deg2rad($deg));
        $cos=cos(deg2rad($deg));
        $x_coordinate=$center_x+(($radius)*$cos);
        $y_coordinate=$center_y+(($radius)*$sin);

        $smarty->assign('x_coordinate',(int)$x_coordinate);
        $smarty->assign('y_coordinate',(int)$y_coordinate);
}


?>