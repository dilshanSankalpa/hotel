<?php require_once('../include/header.php'); ?>
<h2>sign in</h2><br>
<div>
<form action="checkuser.php" method="post">
        Enter the user name : <br>
        <input type="text" name="name"><br>
        Enter the pasword <br>
        <input type="password" name="pw"> <br>
        <input type="submit" value="submit">
    </form>
</div>
    
    
<?php require_once('../include/footer.php'); ?>