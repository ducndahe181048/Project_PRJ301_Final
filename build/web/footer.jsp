<%-- 
    Document   : footer
    Created on : Jul 10, 2024, 1:44:02 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            footer {
                background-color: #333;
                color: white;
                padding: 2em 0;
                text-align: center;
                bottom: 0;
                width: 100%;
            }
            footer div {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                margin-bottom: 1em;
            }
            footer section {
                flex: 1;
                margin: 0 1em;
                min-width: 200px;
            }
            footer h2 {
                font-size: 1.5em;
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 0.5em;
            }
            footer p, footer ul, footer li {
                margin: 0.5em 0;
            }
            footer ul {
                list-style: none;
                padding: 0;
            }
            footer ul li {
                margin: 0.5em 0;
            }
            footer ul li a {
                color: white;
                text-decoration: none;
            }
            footer ul li a:hover {
                text-decoration: underline;
            }
            footer p {
                margin-top: 1em;
            }
        </style>
    </head>
    <body>
        <footer>
            <div>
                <section>
                    <h2>Contact Us</h2>
                    <p>Email: ducndahe181048@fpt.edu.vn</p>
                    <p>Phone: 0344420156</p>
                    <p>Address: FPT University (Hoa Lac Campus)</p>
                </section>
                <section>
                    <h2>Quick Links</h2>
                    <ul>
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="privacy.jsp">Privacy Policy</a></li>
                        <li><a href="terms.jsp">Terms of Service</a></li>
                    </ul>
                </section>
                <section>
                    <h2>Follow Us</h2>
                    <ul>
                        <li><a href="https://www.facebook.com" target="_blank">Facebook</a></li>
                        <li><a href="https://www.x.com" target="_blank">Twitter</a></li>
                        <li><a href="https://www.linkedin.com" target="_blank">LinkedIn</a></li>
                    </ul>
                </section>
            </div>
            <p>&copy; 2024 Document Management System. All rights reserved.</p>
        </footer>
    </body>
</html>
