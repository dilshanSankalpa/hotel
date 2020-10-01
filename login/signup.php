<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
</head>
<body>
    <h1>Enter your details</h1>
    <form action="makenewuser.php" method="post">
        Enter the name : <br>
        <input type="text" name="name" value="name must be unique"><br>
        <select name="type" id="type">
            <option value="1">Admin</option>
            <option value="2">Employee</option>
        </select><br>
        Enter the password <br>
        <input type="password" name="pass"> <br>
        <input type="submit" value="Submit"> <br>
    </form>
    
</body>
</html>