<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
    <style>
        /* Basic styling for error message */
        .error {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="error">
        <h2>Error occurred:</h2>
        <p><%= request.getParameter("message") %></p>
    </div>
</body>
</html>
