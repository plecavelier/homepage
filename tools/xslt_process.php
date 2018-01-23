<?php

function xslt_process($xml, $xsl, $params = array()) {
	$xmlDom = new DOMDocument();
	$xmlDom->load($xml);
	
	$xslDom = new DOMDocument();
	$xslDom->load($xsl);
	
	$xslt = new XSLTProcessor();
	$xslt->importStyleSheet($xslDom);
	foreach ($params as $name => $value) {
		$xslt->setParameter("", $name, $value);
	}
	$output = $xslt->transformToXML($xmlDom);
	return $output;
}

?>