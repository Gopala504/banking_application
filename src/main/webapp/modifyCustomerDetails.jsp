<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modify Customer Details</title>

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 200px;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #2193b0, #6dd5ed); /* Blue gradient background */
        }

        .container {
            background: rgba(255, 255, 255, 0.9); /* Slightly translucent white */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 600px;
            animation: fadeIn 1s ease-in-out;
         
          
        }

        h1 {
            margin-bottom: 20px;
            color: #333;
            font-size: 20px; /* Adjusted font size */
            font-weight: bold;
            text-align: center;
        }

        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        label {
            display: block;
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="date"], input[type="email"], input[type="checkbox"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .checkbox-container {
            grid-column: span 2;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        button {
            grid-column: span 2;
            background: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }

        button:hover {
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
        <h1>Modify Customer Details</h1>
        <form action="UpdateCustomerDetailsServlet" method="post">
            <input type="hidden" name="accountnumber" value="${accountnumber}">
            
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" value="${fullname}" required>

            <label for="idproof">ID Proof:</label>
            <input type="text" id="idproof" name="idproof" value="${idproof}" required>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" value="${dob}" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${email}" required>

            <label for="mobilenumber">Mobile Number:</label>
            <input type="text" id="mobilenumber" name="mobilenumber" value="${mobilenumber}" required>

            <label for="gender">Gender:</label>
            <input type="text" id="gender" name="gender" value="${gender}" required>

            <label for="typeofaccount">Type of Account:</label>
            <input type="text" id="typeofaccount" name="typeofaccount" value="${typeofaccount}" required>

            <div class="checkbox-container">
                <label for="active">Account Active:</label>
                <input type="checkbox" id="active" name="active" <c:if test="${active}">checked</c:if> />
            </div>

            <button type="submit">Update Details</button>
        </form>
    </div>
</body>
</html>
