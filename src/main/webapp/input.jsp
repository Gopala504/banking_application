<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="style.css">
    <title>bank apk</title>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up">
            <form action="AdminLoginServlet" method="post">
                <h1>Admin Login</h1>
                <img src="https://www.iconninja.com/files/864/851/698/admin-icon.png" alt="Profile Picture" class="profile-pic">
                <input type="text" placeholder="Enter Username" id="username" name="username">
                <input type="password" placeholder="Enter Password" id="password" name="password">
                <button type="submit">Admin Login</button>
            </form>
        </div>
        <div class="form-container sign-in">
           <form action="LoginServlet" method="post">
                <h1>Customer Login</h1>
                <img src="https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_640.png" alt="Profile Picture" class="profile-pic">
                <input type="number" name="accountnumber" placeholder="Enter Account Number ">
                <input type="password" name="password" placeholder="Enter Password">
                <button type="submit">Customer Login</button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>Startup Bank!</h1>
                    <button class="hidden" id="login">Customer Login</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>Startup Bank!</h1>
                    <button class="hidden" id="register">Admin Login</button>
                </div>
            </div>
        </div>
    </div>

    <script src="script.js"></script>
</body>

</html>