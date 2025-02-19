<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>View Customer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('background.jpg'); /* Ensure you have an appropriate background image */
            background-size: cover;
            background-attachment: fixed;
            color: #ffffff;
        }
        .container {
            background: rgba(0, 0, 0, 0.6); /* Transparent black background */
            padding: 20px;
            border-radius: 10px;
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .details {
            margin-top: 20px;
        }
        .details p {
            margin: 5px 0;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .view-details-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }
        .view-details-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Customer Details</h1>

        <%-- Link/Button to View Customer Details --%>
        <div class="button-container">
            <a href="ViewCustomerServlet?accountNumber=<%= request.getParameter("accountNumber") %>" class="view-details-button">View Details</a>
        </div>

        <%-- Display Customer Details --%>
        <%
        String fullName = (String) request.getAttribute("fullName");
        String idProof = (String) request.getAttribute("idProof");
        String dateOfBirth = (String) request.getAttribute("dateOfBirth");
        String email = (String) request.getAttribute("email");
        String mobileNumber = (String) request.getAttribute("mobileNumber");
        String gender = (String) request.getAttribute("gender");
        String typeOfAccount = (String) request.getAttribute("typeOfAccount");
        String status = (String) request.getAttribute("status");
        Double balance = (Double) request.getAttribute("balance");

        if (fullName != null) {
            out.println("<div class='details'>");
            out.println("<h2>Customer Details</h2>");
            out.println("<p>Full Name: " + fullName + "</p>");
            out.println("<p>ID Proof: " + idProof + "</p>");
            out.println("<p>Date of Birth: " + dateOfBirth + "</p>");
            out.println("<p>Email: " + email + "</p>");
            out.println("<p>Mobile Number: " + mobileNumber + "</p>");
            out.println("<p>Gender: " + gender + "</p>");
            out.println("<p>Type of Account: " + typeOfAccount + "</p>");
            out.println("<p>Status: " + status + "</p>");
            out.println("<p>Balance: $" + balance + "</p>");
            out.println("</div>");
        }
        %>
    </div>
</body>
</html>
