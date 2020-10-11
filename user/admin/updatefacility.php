<?php
require_once('../../DB/DB.php'); 
$id = $_GET["id"];
$name = $_POST["name"];
$location = $_POST["location"];
$rate = $_POST["rate"];
$type = $_POST["type"];
$cost = $_POST["cost"];

$res = $conn->query("UPDATE `facility` SET `location`= '{$location}',`cost`= '{$cost}',`rate`= '{$rate}',`type`= {$type},`name`= '{$name}' WHERE facilityId = '{$id}';");
if($res){
    header("Location:facility.php");
}
$conn->close();

?>