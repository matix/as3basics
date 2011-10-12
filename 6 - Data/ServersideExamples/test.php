<?php
include_once 'services/ScoreService.php';
$service = new ScoreService();

var_dump($service->getHighScores());
?>