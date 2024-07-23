<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="cnfmpas.css" />
    <title>Confirm Password</title>
</head>
<body>
    
    <form action="ConfirmPasswordServlet" method="post">
    <h1>Confirm Password</h1>
        <label for="newpassword">New Password:</label>
        <input type="password" id="newpassword" name="newpassword" required><br><br>
        <label for="confirmpassword">Confirm Password:</label>
        <input type="password" id="confirmpassword" name="confirmpassword" required><br><br>
        <button type="submit">Update Password</button>
    </form>
</body>
</html>
