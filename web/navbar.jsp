<%-- 
    Document   : navbar
    Created on : Jun 27, 2024, 5:51:43 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document Management System</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #4CAF50;
                padding: 10px 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .navbar .logo {
                width: 50px;
                height: auto;
            }
            .navbar h2 {
                margin: 0;
                color: white;
                font-size: 24px;
            }
            .navbar a {
                text-decoration: none;
                color: white;
                font-size: 18px;
            }
            .navbar .userLogo {
                width: 50px;
                height: auto;
                border-radius: 50%;
                transition: transform 0.3s;
            }
            .navbar .userLogo:hover {
                transform: scale(1.1);
            }
            /* Navigation styles */
            nav {
                background-color: #333;
                overflow: hidden;
            }

            nav ul {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            nav ul li {
                float: left;
            }

            nav ul li a {
                display: block;
                color: white;
                text-align: center;
                padding: 1em;
                text-decoration: none;
            }

            nav ul li a:hover {
                background-color: #575757;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <a href="home.jsp"><img class="logo" src="images/logo.png" alt="Logo"/></a>
            <h2>DOCUMENT MANAGEMENT SYSTEM</h2>
            <a href="userProfile"><img class="userLogo" src="images/userLogo.png" alt="User Logo"/></a>
        </div>
        <nav>
            <ul>
                <li><a href="category">View Categories</a></li>
                <li><a href="document">View Documents</a></li>
                <li><a href="userProfile">User Profile</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </nav>
    </body>
</html>
