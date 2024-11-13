<%-- 
    Document   : updateDocument
    Created on : Jul 10, 2024, 12:08:00 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Document</title>
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
            form input[type="number"], 
            form input[type="submit"], 
            form input[type="date"], a {
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
                margin-bottom: 10px;
            }
            a {
                display: block;
                color: white;
                text-decoration: none;
                background-color: #4CAF50;
                text-align: center;
                padding: 10px;
                border-radius: 4px;
                margin-top: 10px;
            }
            a:hover {
                background-color: #2980b9;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Update Document</h1>
            <form action="updateDocument" method="post">
                <label for="id">Enter ID*:</label>
                <input type="text" readonly id="id" name="id" value="${document.id}">
                
                <label for="name">Enter Name:</label>
                <input type="text" id="name" name="name" value="${document.name}">
                
                <label for="path">Enter Path:</label>
                <input type="file" id="path" name="path" value="${document.path}">
                
                <label for="path">Category Name*:</label>
                <input type="text" readonly id="categoryName" name="categoryName" value="${requestScope.name[cid]}"><br>
                *: Cannot be fixed
                
                <input type="submit" value="Update">
                <a href="document">Return to Documents</a>
            </form>
        </div>
<!--        <h1>Update Document</h1>
        <form action="updateDocument" method="post">
            Enter ID: <input type="text" readonly name="id" value="${document.id}"><br>
            Enter Name: <input type="text" name="name" value="${document.name}"><br>
            Enter Path: <input type="text" name="path" value="${document.path}"><br>
            Category: <input type="text" name="categoryName" value="${requestScope.name[cid]}" readonly><br>
            <input type="submit" value="Update">
            <a href="document">Return to Documents</a>
        </form>-->
    </body>
</html>
