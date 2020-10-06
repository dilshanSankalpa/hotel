<?php

use function PHPSTORM_META\type;

require_once('../../DB/DB.php');
?>
<a href="insertfacility.php"><button>Insert a new row</button></a>
<?php 
while($row = mysqli_fetch_assoc($conn->query("SELECT * FROM `facility`"))){
    ?>
<h3>Facility table</h3>
<form action="updatefacility.php?id<?php echo $row['facilityId'] ?>" method="post">
    location <br>
    <input type="text" name="location" value="<?php echo $row['location']?>"> <br>
    Rate <br>
    <input type="text" name="rate" value="<?php echo $row['rate']; ?>"> <br>
    name <br>
    <input type="text" name="name" value="<?php echo $row['name']; ?>">
    type <br>
    <select name="type">
        <option value="1" <?php if($row['type']==1) echo "selected"; ?>>indoor</option>
        <option value="2" <?php if($row['type']==2) echo "selected"; ?>>oudoor</option>
    </select>
    <br>
    cost <br>
    <input type="text" name="cost" value="<?php echo $row['cost']; ?>"><br>
    <input type="submit" value="submit">
</form>
<?php
}
?>
