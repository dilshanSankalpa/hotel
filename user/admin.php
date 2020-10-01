<?php
require_once "../DB/DB.php";
$id = $_GET["id"];
$detEmp = $conn->query("select * from employee where id = {$id}");
$emp = mysqli_fetch_assoc($detEmp);
$type = $emp["type"];
$id = $emp["id"];
if($type == 1){
    $detSub = $conn->query("select * from manager where empID = {}");
}
?>