<?php

use function PHPSTORM_META\type;

require_once "../DB/DB.php";
$mpw = md5($_POST["password"]);
$name = $_POST["name"];
$det = $conn->query("select type,id from user where password = {$mpw} and $name = {$name}");
$details = mysqli_fetch_assoc($det);
$type = $details["type"];
$id = $details["id"];
if($type == 3){
    header("Location : ../user/admin.php?id={$id}");
}
elseif ($type == 2){
    header("Location : ../user/employee.php?id={$id}"); 
}
elseif($type == 1){
    header("Location : ../user/guest.php?id={$id}");
}
else{
    echo "something went wrong";
}
?>