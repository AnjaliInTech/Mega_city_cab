<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Mega City Cab</title>
<link rel="stylesheet" href="../css/styles.css">
</head>
<body>
     <div class="login-container">
        <h2>Login to Mega City Cab</h2>
        <% if(request.getParameter("error") != null) { %>
            <p style="color: red;">Invalid username or password!</p>
        <% } %>
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
</body>
</html>