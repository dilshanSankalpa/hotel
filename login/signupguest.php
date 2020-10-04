<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guest sign up</title>
</head>
<body>
    <form action="makenewuserguest.php" method="post">
        Enter a unique user name : <br>
        <input type="text" name="uname"> <br>
        Enter a password : <br>
        <input type="password" name="pw"> <br>
        Select guest type : <br>
        <select name="type" id="type">
            <option value="1">Family</option>
            <option value="2">Individual</option>
            <option value="3">Company</option>
        </select>
        Enter the check in date : <br>
        <input type="date" name="checkInDate" id="checkInDate"> <br>
        Enter the check out date <br>
        <input type="date" name="checkOutDate" id="checkOut"> <br>
        <input type="submit" value="submit">
        
    </form>
</html>