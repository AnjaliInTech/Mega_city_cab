<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer</title>
    <style>
        footer {
            background-color: #000000; /* Black background */
            color: #ffffff; /* White text */
            text-align: center;
            padding: 20px 0;
            margin-top: 20px;
            font-family: Arial, sans-serif;
        }
        footer a {
            color: #ffc107; /* Yellow color for links */
            text-decoration: none;
            margin: 0 10px;
        }
        footer a:hover {
            text-decoration: underline; /* Underline on hover */
            color: #ffd54f; /* Lighter yellow on hover */
        }
        footer p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <footer>
        <p>&copy; 2023 Mega City Cab Service. All rights reserved.</p>
        <p>Contact us: <a href="mailto:info@megacitycab.com">info@megacitycab.com</a> | Phone: +1 (123) 456-7890</p>
        <p>
            <a href="${pageContext.request.contextPath}/privacy-policy">Privacy Policy</a> | 
            <a href="${pageContext.request.contextPath}/terms-of-service">Terms of Service</a> | 
            <a href="${pageContext.request.contextPath}/about-us">About Us</a>
        </p>
    </footer>
</body>
</html>