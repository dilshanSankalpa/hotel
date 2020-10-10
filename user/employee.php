<?php
require_once ('../DB/DB.php');
$gId = $_GET["id"];
$detEmp = $conn->query("select * from employee where id = {$gId}");
$emp = mysqli_fetch_assoc($detEmp);
$type = $emp["type"];
$id = $emp["id"];

if($type == 1){
    $detSub = $conn->query("select * from manager where empId = {$id};");
    $man = mysqli_fetch_assoc($detSub);
    $grade = $man["grade"];
    

    echo "employee type : Manager <br>Desgnation : ";
    echo $man["designation"]."<br>";
    echo "Grade : ";
    if($man["grade"]==1){
        echo "junior <br>";
    }
    elseif($man["grade"]==2){
        echo "senior <br>";
    }



}
elseif($type == 2){

echo "Employee type : Kitchen staff <br>

work as a : ";
$ksQuery = "select * from kitchenStaff where empId = {$id}"; 
$ks = mysqli_fetch_assoc($conn->query($ksQuery));
if($ks["cheffFlag"]==1) echo "Cheff ";
if($ks["supportFlag"]==1) echo "Supporter ";
if($ks["waiter"]==1) echo "waiter"; 
echo "<br>
experience level : <br>";
   
    if($ks["experience"]==1){
        echo "less than 5 years";
    }
    elseif($ks["experience"]==2){
        echo "between 5 to 10 years";
    }
    elseif($ks["experience"]==3){
        echo "more than 10 years";
    }

    if($ks["cheffFlag"]==1){
        while($r = mysqli_fetch_assoc($conn->query("select * from cheff where empId = {$id}"))){
            echo $r["sArea"];
        
        }
    }
    elseif($ks["supporterFlag"]==1){
        echo "contract period : ".$ks["contractPeriod"];

    }
    elseif($ks["waiter"]==1){
        echo "special style";
        while($r1 = mysqli_fetch_assoc($conn->query("select * from waiter where empId = {$id}"))){
            echo $r1["sStyle"]." ";
        }
    }
}
elseif($type == 3){
    $de = $conn->query("select * from cleaner where empId = {$id}");
    $clean = mysqli_fetch_assoc($de);

    echo "Employee type : cleaner <br>";
    echo "working location : ".$clean["location"]."<br>cleaned rooms :";


$de1 = $conn->query("select * from roomClean where empId = '{$id}';");
while($row = mysqli_fetch_assoc($de1)){

    echo "Date : ".$row["date"]." Time : ".$row["time"]." Room No : ".$row["roomNo"];

}
    






}
elseif($type == 4){

echo "Employee type : receptionist <br>handled guests(Ids) : <br>";

$de = $conn->query("SELECT * FROM `recGuest` WHERE empId = '{$id}';");
while($row1 = mysqli_fetch_assoc($de)){
    echo $row1["guestId"]."<br>";
    
}
    
if($emp["faciltyID"] != NULL){
    echo "facilities : <br>";
    $q8 = $conn->query("select * facility where empId = '{$id}';");
    while($r8 = mysqli_fetch_assoc($q8))
    echo "recruited facility :"+$r8["name"]+"<br>";
}
}
$conn->close();

?>

