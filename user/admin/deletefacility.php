<?php 
require_once('../../DB/DB.php');
$id = $_GET["id"];
$res = $conn->query("delete from facility where faciltyId = {$id}");
header("Location:facility.php");
$conn->close();
?>