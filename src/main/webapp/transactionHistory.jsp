<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="banker.Transaction" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Transaction History</h1>

    <table>
        <tr>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <%
            List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
            if (transactions != null) {
                for (Transaction transaction : transactions) {
        %>
        <tr>
            <td><%= transaction.getTransactionType() %></td>
            <td><%= transaction.getAmount() %></td>
            <td><%= transaction.getTransactionDate() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No transactions found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <form action="Dlogout.jsp" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
