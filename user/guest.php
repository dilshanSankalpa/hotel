<?php
require_once ('../DB/DB.php');
$gid = $_GET["id"];

echo "<h2>Guest details</h2><br>";
$guest = mysqli_fetch_assoc($conn->query("select * from guest where id = {$gid};"));
echo "Check in date : ".$guest["CID"]." Check out date : ".$guest["COD"]."<br>";
$id = $guest["guestId"];
$query = $conn->query("select * from guTell where guestId = {$guest['guestId']};");
echo "Telephone numbers : "."<br>";
while($row = mysqli_fetch_assoc($query)){
    echo $row["tel"]."<br>";
}
if($guest["type"]==1){
    echo "Guest type = family<br>";
    $sql1 = $conn->query("SELECT * FROM `family` WHERE guestId = '{$id}';");
    $family = mysqli_fetch_assoc($sql1);
    echo "Head NIC : ".$family["hNIC"]."<br>Head's Name : ".$family["hName"]."<br>gender of family head : ";
    if($family["hGender"] == 1 ){
        echo "Male<br>";
    }
    elseif ($family["hGender"] == 2){
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
$queryRoomCost = $conn->query("select sum(room.cost) AS cost from room,roomGuest where room.roomNo = roomGuest.roomNo and roomGuest.guestId = '{$id}';");
if(isset($queryRoomCost)){
    $roomCostF = mysqli_fetch_assoc($queryRoomCost);
    $roomCost = $roomCostF["cost"];
}
$conn->query("create view fac(cost,duration) as select facility.cost as cost, guestFacility.duration AS duration  from facility,guestFacility where guestFacility.facilityId = facility.facilityId and guestFacility.guestId = {$id};");
$queryFacilityCost = $conn->query("select * from fac");
if(isset($queryFacilityCost)){
    while($facilityCostF = mysqli_fetch_assoc($queryFacilityCost)){
        $facilityCost += $facilityCostF["cost"]*$facilityCostF["duration"];
    }
    
}
$conn->query("create view foodC(foC,amo) as select food.cost,foodGuest.portion from food,foodGuest where food.foodId = foodGuest.foodId and foodGuest.guestId = {$id}");
$queryFood = $conn->query("select * from foodC");
if(isset($queryFood)){
    while($row = mysqli_fetch_assoc($queryFood)){
        $foodCost += $row["foC"] * $row["amo"];
    
    }
}
$bill = $roomCost+$facilityCost+$foodCost;
echo "your bill = rs : ".$bill;
$conn->query("DROP VIEW foodC;");
$conn->query("DROP VIEW fac;");
$conn->close();
?>