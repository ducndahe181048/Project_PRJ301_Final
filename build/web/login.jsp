<%-- 
    Document   : login
    Created on : Jul 2, 2024, 1:19:38 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            width: 50%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .login-container h1 {
            text-align: center;
            color: #333;
        }
        .login-container form {
            display: flex;
            flex-direction: column;
        }
        .login-container input[type="text"],
        .login-container input[type="password"],
        .login-container input[type="submit"] {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }
        .login-container input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .login-container p.error {
            color: red;
        }
        .login-container .register-link {
            text-align: center;
            margin-top: 10px;
        }
        .login-container .register-link a {
            color: #3498db;
            text-decoration: none;
        }
        .login-container .register-link a:hover {
            text-decoration: underline;
        }
        .login-container .error {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <c:set var="cookie" value="${pageContext.request.cookies}"/>
        <form action="login" method="post">
            <label for="username">Enter username:</label>
            <input type="text" id="username" name="username" value="${cookie.cUsername != null ? cookie.cUsername.value : ''}">
            
            <label for="password">Enter password:</label>
            <input type="password" id="password" name="password" value="${cookie.cPassword != null ? cookie.cPassword.value : ''}">
            
            <label>
                <input type="checkbox" ${(cookie.cRememberMe != null && cookie.cRememberMe.value.equals("true") ? 'checked' : '')} name="rememberMe" value="true"> Remember me
            </label>
            
            <input type="submit" value="Login">
            
            <p class="error">${requestScope.error}</p>
        </form>
        <div class="register-link">
            <form action="register">
                Don't have an account? <input type="submit" value="Register">
            </form>
        </div>
    </div>
</body>
</html>

