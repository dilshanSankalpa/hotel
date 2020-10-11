<?php 
require_once('../../DB/DB.php');
$name = $_POST["name"];
$location = $_POST["location"];
$rate = $_POST["rate"];
$cost = $_POST["cost"];
$type = $_POST["type"];
$res = $conn->query("INSERT INTO `facility` (`facilityId`, `location`, `cost`, `rate`, `type`, `name`) VALUES (NULL, '{$location}', '{$cost}', '$rate', '$type', '{$name}')");
if($res){
    header("Location:facility.php");
}
$conn->close();
?>