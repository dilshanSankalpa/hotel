<?php
require_once('../../DB/DB.php'); 
$id = $_GET["id"];
$name = $_POST["name"];
$location = $_POST["location"];
$rate = $_POST["rate"];
$type = $_POST["type"];

$conn->query("UPDATE `facility` SET `location`= '{$location}',`cost`= '{$cost}',`rate`= '{$rate}',`type`= {$type},`name`= '{$name}' WHERE facilityId = '{$id}';");
$conn->close();

?>