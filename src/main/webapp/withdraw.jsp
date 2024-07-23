<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Withdraw Money</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Withdraw Money</h1>
        </div>
        
        <div class="content">
            <form action="WithdrawServlet" method="post">
                <label for="amount">Enter Amount to Withdraw:</label>
                <input type="number" id="amount" name="amount" required>
                <br><br>
                <button type="submit">Withdraw</button>
            </form>
        </div>
        
        <div class="footer">
            <p>&copy; 2024 Prime Bank. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
