<%-- 
    Document   : addCategory
    Created on : Jun 24, 2024, 5:15:53 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Category</title>
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
            h1, h3 {
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
            form input[type="number"], 
            form input[type="submit"], 
            .btn {
                margin-top: 5px;
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
                text-align: center;
                font-size: 16px;
            }
            form input[type="submit"], .btn {
                background-color: #4CAF50;
                color: #fff;
                border: none;
                cursor: pointer;
                margin-top: 20px;
                text-decoration: none;
            }
            form input[type="submit"]:hover, .btn:hover {
                background-color: #2980b9;
            }
            .error {
                color: red;
                text-align: center;
                margin-bottom: 10px;
            }
            .btn-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Add New Category</h1>
            <h3 class="error">${requestScope.error}</h3>
            <form action="addCategory">
                <label for="id">Enter ID:</label>
                <input type="number" id="id" name="id" required>
                
                <label for="name">Enter Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="description">Enter Description:</label>
                <input type="text" id="description" name="description" required>
                
                <input type="submit" value="Add Category">
            </form>
            <div class="btn-container">
                <a href="category" class="btn">Return to Categories</a>
            </div>
        </div>
    </body>
</html>
