<%-- 
    Document   : register
    Created on : Jul 4, 2024, 8:21:05 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                width: 400px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            form label {
                margin-top: 10px;
                font-weight: bold;
            }
            form input[type="text"], 
            form input[type="password"], 
            form input[type="submit"], a {
                margin-top: 5px;
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            form input[type="submit"] {
                background-color: #4CAF50;
                color: #fff;
                border: none;
                cursor: pointer;
                margin-top: 20px;
            }
            form input[type="submit"]:hover {
                background-color: #2980b9;
            }
            .error {
                color: red;
                text-align: center;
                margin-top: 10px;
            }
            a {
                color: white;
                text-align: center;
                text-decoration: none;
                background-color: #4CAF50;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Register</h1>
            <form action="register" method="post">
                <label for="username">Enter username:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Enter password:</label>
                <input type="password" id="password" name="password" required>
                
                <label for="confirmPassword">Confirm password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                
                <label for="displayname">Enter display name:</label>
                <input type="text" id="displayname" name="displayname" required>
                
                <label for="email">Enter email:</label>
                <input type="text" id="email" name="email" required>
                
                <input type="submit" value="Register">
                <p class="error">${requestScope.error}</p>
                
                <a href="login.jsp">Back to login</a>
            </form>
        </div>
    </body>
</html>
