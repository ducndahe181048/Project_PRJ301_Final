<%-- 
    Document   : privacy
    Created on : Jul 10, 2024, 1:46:03 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Privacy Policy</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                color: #333;
            }
            header {
                color: #4CAF50;
                padding: 1em 0;
                text-align: center;
            }
            header h1 {
                margin: 0;
                font-size: 2.5em;
            }
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
            main p, main ul {
                margin: 1em 0;
            }
            main ul {
                list-style-type: disc;
                padding-left: 1.5em;
            }
            main ul li {
                margin-bottom: 0.5em;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Privacy Policy</h1>
        </header>
        <main>
            <section>
                <h2>Introduction</h2>
                <p>
                    Your privacy is important to us. This privacy policy explains what personal data we collect from you and how we use it.
                </p>
            </section>
            <section>
                <h2>Information We Collect</h2>
                <ul>
                    <li>Personal Identification Information (Name, email address, phone number, etc.)</li>
                    <li>Document metadata and content</li>
                    <li>Usage data (how you interact with our system)</li>
                </ul>
            </section>
            <section>
                <h2>How We Use Your Information</h2>
                <ul>
                    <li>To provide and maintain our service</li>
                    <li>To notify you about changes to our service</li>
                    <li>To provide customer support</li>
                    <li>To monitor the usage of our service</li>
                    <li>To detect, prevent and address technical issues</li>
                </ul>
            </section>
            <section>
                <h2>Security of Your Data</h2>
                <p>
                    We are committed to ensuring that your information is secure. In order to prevent unauthorized access or disclosure, we have put in place suitable physical, electronic, and managerial procedures to safeguard and secure the information we collect online.
                </p>
            </section>
        </main>
        <%@include file="footer.jsp"%>
    </body>
</html>
