<%-- 
    Document   : category
    Created on : Jun 24, 2024, 5:08:51 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category List</title>
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
            h3 {
                text-align: center;
            }
            h3 a {
                text-decoration: none;
                color: #4CAF50;
            }
            h3 a:hover {
                text-decoration: underline;
            }
            table {
                width: 70%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: white;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            a {
                color: #4CAF50;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
        <script type="text/javascript">
            function doDelete(id) {
                if(confirm("Are you sure to delete category with ID = " + id + "? Remember that all documents of this category will also be deleted!")) {
                    window.location = "deleteCategory?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <h1>Category List</h1>
        <h3><a href="addCategory.jsp">Add New</a></h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.cdata}" var="c">
                <c:set var="id" value="${c.id}"/>
                <tr>
                    <td>${id}</td>
                    <td>${c.name}</td>
                    <td>${c.description}</td>
                    <td>
                        <a href="updateCategory?id=${id}">Update</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" onclick="doDelete('${id}')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>
            <a href="home.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="document">Show Documents</a>
        </h3>
    </body>
    <%@include file="footer.jsp"%>
</html>
