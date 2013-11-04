<?php

include_once 'xml_to_json.php';

header('Content-Type:application/json');
echo getJsonInstagram();

function getJsonInstagram() {
	$url = 'http://instagram.com/tags/%D0%BC%D1%8B%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B/feed/recent.rss';
	return xmlToJson($url);
}

?>
