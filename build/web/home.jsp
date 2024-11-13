<%-- 
    Document   : home
    Created on : Jul 4, 2024, 9:17:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document Management System</title>
        <style>
            /* General styles */
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                color: #333;
            }

            /* Header styles */
            header {
                color: #4CAF50;
                padding: 1em 0;
                text-align: center;
            }

            header h1 {
                margin: 0;
                font-size: 2.5em;
            }
            
            /* Main content styles */
            main {
                padding: 2em;
                background-color: white;
            }

            main section {
                margin-bottom: 2em;
            }

            main h2 {
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 0.5em;
            }

            main p {
                margin: 1em 0;
            }

            main ul {
                list-style: none;
                padding: 0;
            }

            main ul li {
                background: #e9e9e9;
                margin: 0.5em 0;
                padding: 0.5em;
                border-left: 4px solid #4CAF50;
            }

            main ul li strong {
                color: #333;
            }

            /* Footer styles */
            footer {
                background-color: #333;
                color: white;
                padding: 1em 0;
                bottom: 0;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <main>
            <header>
                <h1>Welcome to the Document Management System</h1>
            </header>
            <section>
                <h2>About Our Document Management System</h2>
                <p>Our Document Management System (DMS) is designed to help you store, manage, and track electronic documents and images of paper-based information. The DMS provides a way to manage your documents more efficiently and securely.</p>
            </section>
            <section>
                <h2>Key Features</h2>
                <ul>
                    <li><strong>Upload and Store Documents:</strong> Easily upload and store your documents in a centralized repository.</li>
                    <li><strong>Organize and Categorize:</strong> Organize your documents with tags and categories for easy retrieval.</li>
                    <li><strong>Search and Retrieve:</strong> Quickly search and retrieve documents using our powerful search functionality.</li>
                </ul>
            </section>
            <section>
                <h2>Getting Started</h2>
                <p>To get started, use the navigation links above to upload your documents, view existing documents, or manage your profile.</p>
            </section>
        </main>
        <%@include file="footer.jsp"%>
    </body>
</html>
