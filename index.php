<?php
$request = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

if ($request == '/') {
    $request = '/accueil';
}

$path = "controller".$request.".php";
if(file_exists($path)){
    require $path;
}else{
    require "controller/404.php";
}
?>
