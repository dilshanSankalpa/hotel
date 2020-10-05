<?php
require_once "../DB/DB.php";
$id = $_GET["id"];
echo "Telephone numbers : "+"<br>";
while($row = mysqli_fetch_assoc($conn->query("select * from guTell where guestId = {$id}"))){
    echo $row["tel"]+"<br>";
}
$guest = mysqli_fetch_assoc($conn->query("select * from guest where guestId = {$id}"));
echo "Check in date : "+$guest["CID"]+" Check out date : "+$guest["COD"];

if($guest["type"]==1){
    echo "Guest type = family<br>";
    $family = mysqli_fetch_assoc($conn->query("select * from family guestId = {$id} "));
    echo "Head NIC : "+$family["hNIC"]+" Head's Name"+$family["hName"]+" gender of family head : ";
    if($family["gender"]==1){
        echo "Male<br>";
    }
    elseif($family["gender"]==2){
        echo "Female<br>";
    }
}
elseif($guest["type"]==2){
    echo "guest type : individual";
    $individual = mysqli_fetch_assoc($conn->query("select * from individual where gusetId = {$id}"));
    echo "NIC : "+$individual["NIC"]+" name "+$individual["name"]+" gender ";
    if($individual["gender"]==1){
        echo "male<br>";
    }
    elseif($individual["type"]==2){
        echo "female<br>";
    }
}
elseif($guest["type"]==3){
    echo "Guest type : Company <br>";
    $company = mysqli_fetch_assoc($conn->query("select * from company where guestId = {$id}"));
    echo "Name of the company : "+$company["name"]+" Address "+$company["address"];
}

$conn->query("create view foodC(foC,amo) as select food.cost,foodGuest.portion from food,foodGuest where  food.foodId = foodGuest.foodId and foodGuest = {$id}");
$bill = 0;
$roomCost = $conn->query("select sum(room.cost) from room,roomGuest where room.No = roomGuest.roomNo and roomGuest.guestId = {$id}");
$facilityCost = $conn->query("select sum(facilityCost) from facility,guestFacility where guestFacility.facilityId = facility.facilityId and guestFacility.guestId = {$id}");
$foodCost = 0;
while($row = mysqli_fetch_assoc($conn->query("select * from foodC"))){
    $foodCost += $row["foC"] * $row["amo"];

}
$bill = $roomCost+$facilityCost+$foodCost;
echo "your bill = rs : "+$bill;
$conn->close();
?>