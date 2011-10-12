<?php
error_reporting(E_PARSE);
include_once 'Zend/Loader.php';
include_once 'services/MyService.php';
include_once 'services/ScoreService.php';
Zend_Loader::registerAutoload();
 
$server = new Zend_Amf_Server();
$server->setProduction(false);
$server->setClass("MyService");
$server->setClass("ScoreService");
echo $server->handle();
?>