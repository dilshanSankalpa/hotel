<?php
require_once "../DB/DB.php";
$name = $_POST["name"];
$pw = $_POST["password"];
$mpw = md5($pw);
$type = $_POST["type"];

if(empty($conn->query("select type from user where username = {$name} and password = {$mpw};")))
{
    $conn->query("insert into user(id,name,password,type) values (NULL,{$name},{$mpw},{$type});");
    echo "successfully entered a user";
}
else{
    echo "user name is taken";
}

?>