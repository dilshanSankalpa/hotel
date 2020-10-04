<?php
require_once "../DB/DB.php";
$id = $_GET["id"];
$detEmp = $conn->query("select * from employee where id = {$id}");
$emp = mysqli_fetch_assoc($detEmp);
$type = $emp["type"];
$id = $emp["id"];
?>

<?php
if($type == 1){
    $detSub = $conn->query("select * from manager where empID = {$id}");
    $man = mysqli_fetch_assoc($detSub);
    $grade = $man["grade"];
?>
employee type : Manager <br>
<form action="" method="post">
    Desgnation : <br>
    <input type="text" value="<?php echo $man['designation'] ?>">
    Grade : <br>
    <select name="grade" id="grade">
        <option value="1" <?php if($selected == '1'){echo("selected");}?>>junior</option>
        <option value="2" <?php if($selected == '2'){echo("selected");}?>>senior</option>
    </select>
</form>


<?php
}
elseif($type == 2){
?>
Employee type : Kitchen staff <br>
$ks = mysqli_fetch_assoc($conn->query("select * from kitchenStaff where empId = {$man['empId']}"));
work as a : <?php if($ks["cheffFlag"]==1) echo "Cheff "; if($ks["supportFlag"]==1) echo "Supporter "; if($ks["waiter"]==1) echo "waiter "; ?>
<br>
experience level : <br>
<?php 
if($ks["experience"]==1){
    echo "less than 5 years";
}
elseif($ks["experience"]==2){
    echo "between 5 to 10 years";
}
elseif($ks["experience"]==3){
    echo "more than 10 years";
}
?>
<?php
}
elseif($type == 3){
    $de = $conn->query("select * from cleaner where empId = {$man['empId']}");
    $clean = mysqli_fetch_assoc($de);
    ?>
Employee type : cleaner <br>

working location : <?php echo $clean["location"]; ?>

<?php
}
elseif($type == 4){
?>
Employee type : receptionist

cleaned rooms :

<?php
$de1 = $conn->query("select * from roomClean where empId = {$man['empId']}");
while($row = mysqli_fetch_assoc($de1)){

    echo $row["date"]+" "+ $row["time"]+" "+ $row["roomNo"];
    
?>
<?php
}
?>

<?php
}
?>