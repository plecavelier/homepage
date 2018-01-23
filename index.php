<?php

require_once("tools/xslt_process.php");

if (!isset($_GET['page'])) {
	$_GET['page'] = "";
}
switch ($_GET['page']) {

	case "mapedit":
	$title = "Editeur de cartes géographiques";
	$html = "projects/mapedit/index.html";
	break;

	case "astar":
	$title = "Algorithme A*";
	$html = "projects/astar/index.html";
	break;

	case "ripsim":
	$title = "Simulation du protocole de routage RIP";
	$html = "projects/ripsim/index.html";
	break;

	case "shisensho":
	$title = "Jeu du shisensho";
	$html = "projects/shisensho/index.html";
	break;

	case "search":
	$title = "Moteur de recherche multilingue";
	$html = "projects/search/index.html";
	break;
	
	default:
	$title = "Page personnelle de Pierre Lecavelier";
	$xml = "homepage.xml";
	$xsl = "homepage.xsl";
	break;
}

$year = date("Y");

$output = <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>{$title}</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="Ingénieur en technologies de l'information chez Logica" />
		<link href="homepage.css" rel="stylesheet" type="text/css" />
		<link href="print.css" rel="stylesheet" type="text/css" media="print" />
		<link rel="image_src" href="images/competences.png" />
	</head>
	<body>
	
		<div class="homepage">
			<div class="header">
				<h1><a href="?page=home">Page personnelle de Pierre Lecavelier</a></h1>
				<div class="band"></div>
			</div>
EOT;

if (isset($html)) {
	ob_start();
	require_once($html);
	$output .= ob_get_clean();
}
else if (isset($xml) and isset($xsl)) {
	$output .= xslt_process($xml, $xsl, array("year" => $year));
}

$output.= <<<EOT
			<div class="footer">
				<p>Page personnelle de Pierre Lecavelier 2006-{$year} | dernière mise à jour le 08/09/2015</p>
				<div class="band"></div>
			</div>
		</div>

	</body>
</html>
EOT;

header("Content-type: text/html; charset=utf-8");
print $output;

?>