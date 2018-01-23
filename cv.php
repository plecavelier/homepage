<?php 

require_once("tools/xslt_process.php");

$output = xslt_process("homepage.xml", "cv.xsl", array("year" => date("Y")));
$output = preg_replace("#<a(.*?)>#", "", $output);
$output = preg_replace("#</a>#", "", $output);

header("Content-type: text/html; charset=utf-8");
print $output;

?>