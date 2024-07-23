<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Customer Account</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Delete Customer Account</h1>
        <form action="DeleteCustomerServlet" method="post">
            <label for="accountNumber">Enter Account Number:</label>
            <input type="number" id="accountNumber" name="accountNumber" required>
            <button type="submit">Delete Account</button>
        </form>
        <%
            if (request.getParameter("message") != null) {
                out.println("<p style='color:red'>" + request.getParameter("message") + "</p>");
            }
        %>
    </div>
</body>
</html>
