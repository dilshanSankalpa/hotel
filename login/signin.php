<?php require_once('../include/header'); ?>
<h2>sign in</h2><br>
    <form action="checkuser.php" method="post">
        Enter the user name : <br>
        <input type="text" name="name"><br>
        Enter the pasword <br>
        <input type="password" name="pw"> <br>
        <input type="submit" value="submit">
    </form>
    
<?php require_once('../include/footer.php'); ?>