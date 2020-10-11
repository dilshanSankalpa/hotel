<?php

use function PHPSTORM_META\type;

require_once('../../DB/DB.php');
?>

<h3>Facility table</h3>
<a href="insertfacility.php"><button>Insert a new row</button></a>
<?php 
$query = $conn->query("SELECT * FROM `facility`");
while($row = mysqli_fetch_assoc($query)){
    ?>
<form action="updatefacility.php?id=<?php echo $row['facilityId'] ?>" method="post">
    location <br>
    <input type="text" name="location" value="<?php echo $row['location']?>"> <br>
    Rate <br>
    <input type="text" name="rate" value="<?php echo $row['rate']; ?>"> <br>
    name <br>
    <input type="text" name="name" value="<?php echo $row['name']; ?>"> <br>
    type <br>
    <select name="type">
        <option value="1" <?php if($row['type']==1) echo "selected"; ?>>indoor</option>
        <option value="2" <?php if($row['type']==2) echo "selected"; ?>>oudoor</option>
    </select>
    <br>
    cost <br>
    <input type="text" name="cost" value="<?php echo $row['cost']; ?>"><br>
    <input type="submit" value="update">
</form>
    <a href="deletefacility.php?id=<?php echo $row['facilityId']; ?>"><button>Delete</button></a>
<?php
}
?>
