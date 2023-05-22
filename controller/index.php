<?php
/* Routeur */
/* print_r($_SERVER); */
$request = str_replace('/ProjectWeb', '', $_SERVER['REQUEST_URI']); // On récupère la request sans tenir compte du dossier.

if ($request == '/') {
    $request = '/accueil';
}

$path = "controllers".$request.".php";
if(file_exists($path)){
    require $path;
}else{
    require "controllers/404.php";
}
?>