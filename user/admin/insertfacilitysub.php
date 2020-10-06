<?php 
require_once('../../DB/DB.php');
$name = $_POST["name"];
$location = $_POST["location"];
$rate = $_POST["rate"];
$cost = $_POST["cost"];
$type = $_POST["type"];
$conn->query("INSERT INTO `facility` (`facilityId`, `location`, `cost`, `rate`, `type`, `name`) VALUES (NULL, '{$location}', '{$cost}', '$rate', '$type', '{$name}')");
$conn->close();
?>