<%@ page import="banker.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Details</title>
</head>
<body>
    <h2>Customer Details</h2>
    <%
        Customer customer = (Customer) request.getAttribute("customer");
        if (customer != null) {
    %>
        <table border="1">
            <tr>
                <th>Full Name</th>
                <td><%= customer.getFullName() %></td>
            </tr>
            <tr>
                <th>ID Proof</th>
                <td><%= customer.getIdProof() %></td>
            </tr>
            <tr>
                <th>Mobile Number</th>
                <td><%= customer.getMobileNumber() %></td>
            </tr>
            <tr>
                <th>Gender</th>
                <td><%= customer.getGender() %></td>
            </tr>
            <tr>
                <th>Type of Account</th>
                <td><%= customer.getTypeOfAccount() %></td>
            </tr>
            <tr>
                <th>Initial Deposit</th>
                <td><%= customer.getInitialDeposit() %></td>
            </tr>
            <tr>
                <th>Balance</th>
                <td><%= customer.getBalance() %></td>
            </tr>
            <tr>
                <th>Date of Birth</th>
                <td><%= customer.getDateOfBirth() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= customer.getEmail() %></td>
            </tr>
        </table>
    <%
        } else {
    %>
        <p>No customer details found.</p>
    <%
        }
    %>
</body>
</html>
