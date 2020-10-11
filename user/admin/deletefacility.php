<?php 
require_once('../../DB/DB.php');
$id = $_GET["id"];
$conn->query("DELETE FROM `facility` WHERE `facility`.`facilityId` = {$id}");
header("Location:facility.php");
$conn->close();
?>