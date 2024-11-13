<%-- 
    Document   : list
    Created on : Jun 27, 2024, 10:46:30 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            h1, h3 {
                text-align: center;
                color: #333;
            }
            form {
                margin: 20px;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            form select, form input[type="date"], form input[type="submit"] {
                margin: 10px 0;
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            table th, table td {
                padding: 12px;
                border: 1px solid #ccc;
                text-align: left;
            }
            table th {
                background-color: #f4f4f4;
            }
            table tr:nth-child(even) {
                background-color: #f9f9f9;
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
                if (confirm("Are you sure to delete document with ID = " + id + "?")) {
                    window.location = "deleteDocument?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <form id="category" action="search">
            Type of Category: 
            <select name="cid">
                <option value="0">All</option>
                <c:forEach items="${requestScope.category}" var="c">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select><br>

            From date: <input type="date" name="fromDate">
            To date: <input type="date" name="toDate"><br>
            <input type="submit" value="Search">
        </form>

        <hr>
        <h1>List of Documents</h1>
        <h3><a href="upload">Add Document</a></h3>
        <table>
            <tr>
                <th>Document ID</th>
                <th>Document Name</th>
                <th>Document Path</th>
                <th>Upload By</th>
                <th>Upload At</th>
                <th>Category Name</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.document}" var="d">
                <tr>
                    <td>${d.id}</td>
                    <td>${d.name}</td>
                <form action="download" method="post">
                    <td>
                        <input type="hidden" name="path" value="${d.path}">
                        <input type="submit" name="download" value="${d.path}" style=" background: none!important;
                               border: none;
                               padding: 0!important;
                               /*optional*/
                               font-family: arial, sans-serif;
                               /*input has OS specific font-family*/
                               color: #069;
                               text-decoration: underline;
                               cursor: pointer;">
                    </td>
                </form>
                <td>${d.uploadBy}</td>
                <td><fmt:formatDate value="${d.uploadAt}" pattern="'Date:' yyyy-MM-dd '| Time:' HH:mm:ss" /></td>
                <td>${categoryName[d.cid]}</td>
                <c:if test="${sessionScope.account.displayname eq d.uploadBy}">
                    <td>
                        <a href="updateDocument?id=${d.id}">Update</a> | 
                        <a href="#" onclick="doDelete('${d.id}')">Delete</a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
    <h3>
        <a href="home.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="category">Show Categories</a>
    </h3>
</body>
<%@include file="footer.jsp"%>
</html>
