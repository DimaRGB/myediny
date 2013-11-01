<?php

include_once 'xml_to_json.php';

header('Content-Type:application/json');
echo getJsonInstagram();

function getJsonInstagram() {
	$url = 'http://instagram.com/tags/мыедины/feed/recent.rss';
	return xmlToJson($url);
}

?>
