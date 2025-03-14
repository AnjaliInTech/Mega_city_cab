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
    <style >
    .user-info {
    display: flex;
    align-items: center;
    gap: 10px;
}

.user-info span {
    font-weight: bold;
    color: #fff;
}
    </style>
</head>

<body>
     
    <header>
        <div class="top-bar">
            <span class="email">📧 info@megacitycab.com</span>
            <span class="phone">📞 (074) 381 4433 | (074) 3814222</span>
            <span class="company">Mega City Cab (Pvt) Ltd</span>
        </div>

        <nav class="navbar">
            <div class="logo-text">Mega City Cab</div>
            
            <!-- Hamburger Menu Icon -->
            <div class="menu-toggle" onclick="toggleMenu()">☰</div>

            <ul class="nav-links">
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="about.jsp">Accept Rides</a></li>
                <li><a href="cabs.jsp">Accepted Rides</a></li>
                <li><a href="register.jsp">Completed Rides</a></li>
            </ul>
            
            <%-- Check if the user is logged in and their role --%>
            <% if (session.getAttribute("user") != null) { %>
                <%-- User is logged in --%>
                <% if ("rider".equals(session.getAttribute("role"))) { %>
                    <%-- Rider is logged in, show rider-specific content --%>
                    <div class="user-info">
                        <span>Welcome, <%= session.getAttribute("user") %></span>
                        <a href="<%= request.getContextPath() %>/role/logout.jsp" class="login-btn">Logout</a>
                    </div>
                <% } else { %>
                    <%-- Regular user is logged in, show logout button --%>
                    <a href="<%= request.getContextPath() %>/role/logout.jsp" class="login-btn">Logout</a>
                <% } %>
            <% } else { %>
                <%-- User is not logged in, show login button --%>
                <a href="<%= request.getContextPath() %>/role/login.jsp" class="login-btn">Login</a>
            <% } %>
        </nav>
    </header>

</body>
</html>