<%-- 
    Document   : addDocument
    Created on : Jun 28, 2024, 8:31:38 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Document</title>
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
            form select, 
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
            <h1>Add New Document</h1>
            <h3 class="error">${requestScope.error}</h3>
            <form action="upload" method="post" enctype="multipart/form-data">
                <label for="id">Enter ID:</label>
                <input type="text" id="id" name="id" required>
                
                <label for="name">Enter Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="path">Enter Path:</label>
                <input type="file" id="path" name="path" required>
                
                <label for="categoryName">Enter Category:</label>
                <select id="categoryName" name="categoryName">
                    <c:forEach items="${listCategory}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
                
                <input type="submit" value="Add Document">
            </form>
            <div class="btn-container">
                <a href="document" class="btn">Return to Documents</a>
            </div>
        </div>
    </body>
</html>
