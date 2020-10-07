<?php

require_once ('../DB/DB.php');
$pw = $_POST["pw"];
$name = $_POST["name"];
$de = $conn->query("SELECT * FROM `user` WHERE name = '{$name}' and password = '{$pw}';");
$details = mysqli_fetch_assoc($de);
$type = $details["type"];
$id = $details["id"];

if($type == 3){
    header("Location:../user/admin.php?id=".$id);
}
elseif ($type == 2){
    header("Location:../user/employee.php?id=".$id); 
}
elseif($type == 1){
    header("Location:../user/guest.php?id=".$id);
}
else{
    echo "something went wrong";
}
$conn->close();
?>