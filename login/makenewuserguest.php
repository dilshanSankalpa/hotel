<?php
require_once "../DB/DB.php";

$name = $_POST["uname"];
$pw = $_POST["pw"];
$mpw = md5($pw);
$type = $_POST["type"];

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form action="makeuserguestsub.php?userid=<?php echo $gId; ?>" method="POST">
    <?php 
        if($type == 1){
            ?>
            Enter the family head name <br>
            <input type="text" name="fHeadName" id="fHeadName"> <br>
            Enter the NIC of family head <br>
            <input type="text" name="NIC" id="NIC"><br>
            Enter the family head gender : <br>
            <input type="text" name="gender"> <br>
    <?php
        }
        elseif($type == 2){
            ?>
        Enter the Individual NIC : <br>
        <input type="text" name="NIC"><br>
        Enter the name : <br>
        <input type="text" name="name"><br>
        Enter the gender : <br>
        <input type="text" name="gender"> <br> 

    <?php
        }
        elseif($type == 2){
            ?>
        Enter the company name : <br>
        <input type="text" name="name"> <br>
        Address : <br>
        <input type="text" name="address"> <br>
    <?php 
        }
        $res = $conn->query("select type from user where name = {$name}");

    if(is_null($res))
    {
        $conn->query("insert into user(id,name,password,type) values (NULL,{$name},{$mpw},1);");
        echo "successfully entered a user"; 
    }
    else{
        echo "user name is taken";
        die();
    }
    $id = $conn->query("select id from user order by id desc limit 1");
    $cid = $_POST["checkInDate"];
    $cod = $_POST["checkOutDate"];
    $conn->query("INSERT INTO `guest` (`guestId`, `CID`, `COD`, `type`, `id`) VALUES (NULL, '{$cid}', '{$cod}', {$type}, {$id})");
    $gId = $conn->query("select id from guest order by guestId desc limit 1");        
    ?>
    <br>
    <input type="submit" value="submit">
</form>
</body>
</html>