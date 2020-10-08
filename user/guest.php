<?php
require_once ('../DB/DB.php');
$id = $_GET["id"];
echo "Telephone numbers : "."<br>";

$guest = mysqli_fetch_assoc($conn->query("select * from guest where guestId = {$id}"));
echo "Check in date : ".$guest["CID"]." Check out date : ".$guest["COD"]."<br>";
$query = $conn->query("select * from guTell where guestId = {$guest['guestId']};");
while($row = mysqli_fetch_assoc($query)){
    echo $row["tel"]."<br>";
}
if($guest["type"]==1){
    echo "Guest type = family<br>";
    $family = mysqli_fetch_assoc($conn->query("select * from family guestId = {$id} "));
    echo "Head NIC : ".$family["hNIC"]." Head's Name".$family["hName"]." gender of family head : ";
    if($family["gender"]==1){
        echo "Male<br>";
    }
    elseif($family["gender"]==2){
        echo "Female<br>";
    }
}
elseif($guest["type"]==2){
    echo "guest type : individual<br>";
$query = $conn->query("SELECT * FROM `individual` WHERE guestId = '{$id}';");
    $individual = mysqli_fetch_assoc($query);
    echo "NIC : ".$individual["NIC"]." name ".$individual["name"]." gender : ";
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
    echo "Name of the company : ".$company["name"]." Address ".$company["address"];
}

$bill = 0;
$foodCost = 0;
$roomCost = 0;
$facilityCost = 0;
$queryRoomCost = $conn->query("select sum(room.cost) AS c from room,roomGuest where room.roomNo = roomGuest.roomNo and roomGuest.guestId = '{$id}';");
if(isset($queryRoomCost)){
    $roomCostF = mysqli_fetch_assoc($queryRoomCost);
    $roomCost = $roomCostF["c"];
}
$queryFacilityCost = $conn->query("select sum(facility.cost) AS c from facility,guestFacility where guestFacility.facilityId = facility.facilityId and guestFacility.guestId = {$id};");
if(isset($queryFacilityCost)){
    $facilityCostF = mysqli_fetch_assoc($queryFacilityCost);
    $facilityCost = $facilityCostF["c"];
}
$conn->query("create view foodC(foC,amo) as select food.cost,foodGuest.portion from food,foodGuest where food.foodId = foodGuest.foodId and foodGuest.guestId = {$id}");
$queryFood = $conn->query("select * from foodC");
if(isset($queryFood)){
    while($row = mysqli_fetch_assoc($query)){
        $foodCost += $row["foC"] * $row["amo"];
    
    }
}
$bill = $roomCost+$facilityCost+$foodCost;
echo "your bill = rs : ".$bill;
$conn->close();
?>