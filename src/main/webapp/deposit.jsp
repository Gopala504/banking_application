<!DOCTYPE html>
<html>
<head>
    <jsp:include page="done.jsp" />  
    <meta charset="UTF-8">
    <title>Deposit Money</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #ff5f6d, #ffc371);
            animation: changeBackground 15s ease-in-out infinite;
            transition: background 0.5s;
        }

        @keyframes changeBackground {
            0% {
                background: linear-gradient(to right, #ff5f6d, #ffc371);
            }
            33% {
                background: linear-gradient(to right, #42e695, #3bb2b8);
            }
            66% {
                background: linear-gradient(to right, #ff6a00, #ee0979);
            }
            100% {
                background: linear-gradient(to right, #ff5f6d, #ffc371);
            }
        }

        .container {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
            color: white;
            transition: background 0.5s;
        }

        h1 {
            margin-bottom: 20px;
            color: #fff;
            font-size: 24px;
            font-weight: bold;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
            color: #fff;
        }

        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
            color: #333;
        }

        input[type="number"]:focus {
            border-color: #6a11cb;
            outline: none;
        }

        input[type="submit"] {
            background: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }

        input[type="submit"]:hover {
            background: #45a049;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Deposit Money</h1>
        <form action="DepositServlet" method="post">
            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required><br><br>
            <input type="submit" value="Deposit">
        </form>
    </div>
</body>
</html>
