<?php

$bdHost = '127.0.0.1';
$bdUsername = 'root';
$bdPassword = '';
$bdName = 'bd_camino';

$banco = new mysqli($bdHost, $bdUsername, $bdPassword, $bdName);
    
if ($banco->connect_error) {
    echo "<p>Encontrei um erro $banco->connect_error</p>";
    die();
}

$banco->query("SET NAMES 'utf8'");
$banco->query("SET character_set_connection=utf8");
$banco->query("SET character_set_client=utf8");
$banco->query("SET character_set_results=utf8");

?>