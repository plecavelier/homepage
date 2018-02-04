<?php

$output = <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Pierre Lecavelier - Parcours professionnel</title>
		<meta name="description" content="Parcours professionnel de Pierre Lecavelier : expériences professionnelles, parcours universitaire, compétences" />
		
		<meta name="viewport" content="width=device-width" />
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="author" content="Pierre Lecavelier" />
		
		<link href="css/homepage.css" rel="stylesheet" type="text/css" />
		<link href="css/print.css" rel="stylesheet" type="text/css" media="print" />
		
		<link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="favicon/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/homepage.js"></script>
	</head>
	<body>
	
		<div class="homepage">
EOT;

$xmlDom = new DOMDocument();
$xmlDom->load("homepage.xml");

$xslDom = new DOMDocument();
$xslDom->load("homepage.xsl");

$xslt = new XSLTProcessor();
$xslt->importStyleSheet($xslDom);

$year = date("Y");
$xslt->setParameter("", "year", $year);

$output .= $xslt->transformToXML($xmlDom);

$output.= <<<EOT
			<div class="footer">
				<p>Page personnelle de Pierre Lecavelier 2006-{$year} | dernière mise à jour le 23/01/2018</p>
			</div>
		</div>

	</body>
</html>
EOT;

header("Content-type: text/html; charset=utf-8");
print $output;
