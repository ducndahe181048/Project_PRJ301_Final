<%-- 
    Document   : userProfile
    Created on : Jul 2, 2024, 2:16:41 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                color: #333;
            }
            h1 {
                text-align: center;
                color: #4CAF50;
                margin-top: 20px;
            }
            .profile-container {
                width: 50%;
                margin: 20px auto;
                padding: 20px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
            }
            h3 {
                margin: 10px 0;
                text-align: center;
            }
            a {
                display: block;
                margin: 10px 0;
                color: #4CAF50;
                text-decoration: none;
                text-align: center;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="profile-container">
            <h1>User Profile</h1>
            <h3>Username: ${sessionScope.account.username}</h3>
            <h3>Email: ${sessionScope.account.email}</h3>
            <h3>Created At: <fmt:formatDate value="${sessionScope.account.createAt}" pattern="yyyy-MM-dd HH:mm:ss" /></h3>
            <a href="home.jsp">Home</a>
            <a href="logout">Logout</a>
        </div>
    </body>
    <%@include file="footer.jsp"%>
</html>
