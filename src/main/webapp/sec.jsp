<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Success</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            animation: gradientBG 10s ease infinite;
        }

        @keyframes gradientBG {
            0% {
                background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            }
            50% {
                background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);
            }
            100% {
                background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            }
        }

        .container {
            background-color: white;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            color: #666;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Password Successfully Updated</h1>
        <p>Your password has been successfully updated.</p>
        <a href="input.jsp">Go to Login</a>
    </div>
</body>
</html>

