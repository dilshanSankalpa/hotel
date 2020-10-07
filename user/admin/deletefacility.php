<?php 
require_once('../../DB/DB.php');
$id = $_GET["id"];
$conn->query("delete from facility where faciltyId = {$id}");
$conn->close();
?>