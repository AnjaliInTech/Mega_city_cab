<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/headercusto.css">
    <script defer src="<%= request.getContextPath() %>/js/menu-toggle.js"></script>
    <style>
         .admin-info {
    display: flex;
    align-items: center;
    gap: 10px;
}

.admin-info span {
    font-weight: bold;
    color: #fff;
}
    </style>
</head>

<body>
     
    <header>
        <nav class="navbar">
            <div class="logo-text">Mega City Cab</div>
            
            <!-- Hamburger Menu Icon -->
            <div class="menu-toggle" onclick="toggleMenu()">☰</div>

            <ul class="nav-links">
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/admin/requested-rides">Assign Ride</a></li>
                <li><a href="<%= request.getContextPath() %>/assigned">Assigned Rides</a></li>
                <li><a href="<%= request.getContextPath() %>/riders">Riders</a></li>
                <li><a href="<%= request.getContextPath() %>/customers">Customers</a></li>
            </ul>
            
            <%-- Check if the user is logged in and their role --%>
            <% if (session.getAttribute("user") != null) { %>
                <%-- User is logged in --%>
                <% if ("admin".equals(session.getAttribute("role"))) { %>
                    <%-- Admin is logged in, show admin-specific content --%>
                    <div class="admin-info">
                        <span>Welcome, <%= session.getAttribute("user") %></span>
                        <a href="<%= request.getContextPath() %>/role/logout.jsp" class="login-btn">Logout</a>
                    </div>
                <% } else { %>
                    <%-- Regular customer is logged in, show logout button --%>
                    <a href="<%= request.getContextPath() %>/role/logout.jsp" class="login-btn">Logout</a>
                <% } %>
            <% } else { %>
                <%-- User is not logged in, show login button --%>
                <a href="login.jsp" class="login-btn">Login</a>
            <% } %>
        </nav>
    </header>

</body>
</html>
