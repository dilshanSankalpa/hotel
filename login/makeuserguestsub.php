<?php 
require_once('../DB/DB.php');
$type = $_GET[""];
$id = $_GET["userid"];
if($type == 1){
    $hName = $_POST["fHeadName"];
    $hGender = $_POST["gender"];
    $hNIC = $_POST["NIC"];
    $conn->query("INSERT INTO `family` (`guestId`, `hName`, `hGender`, `hNIC`) VALUES ('{$id}', '{$hName}', '{$hGender}', '$hNIC')");
}
elseif($type == 2){
    $name = $_POST["name"];
    $nic = $_POST["NIC"];
    $gender = $_POST["gender"];
    $conn->query("INSERT INTO `individual` (`guestId`, `name`, `gender`, `NIC`) VALUES ('{$id}', '{$name}', '{$gender}', '{$nic}')");
}
elseif($type == 3){
    $name = $_POST["name"];
    $address = $_POST["address"];
    $conn->query("INSERT INTO `company` (`guestId`, `name`, `address`) VALUES ('{$id}', '{$name}', '{$address}')");
}
$conn->close();
?>