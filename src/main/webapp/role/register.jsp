<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Mega City Cab</title>
    <link rel="stylesheet" href="../css/register.css">
    <script>
        function toggleRiderFields() {
            var role = document.getElementById("role").value;
            var riderFields = document.getElementById("riderFields");
            
            if (role === "rider") {
                riderFields.style.display = "block";
            } else {
                riderFields.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <div class="login-container">
        <h2>Register for Mega City Cab</h2>
        
        <% if(request.getParameter("error") != null) { %>
            <p style="color: red;">Registration failed! Please try again.</p>
        <% } %>

        <form action="RegisterServlet" method="post">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="nic">NIC:</label>
            <input type="text" id="nic" name="nic" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="role">Register As:</label>
            <select id="role" name="role" onchange="toggleRiderFields()">
                <option value="customer">Customer</option>
                <option value="rider">Rider</option>
            </select>

            <!-- Rider-specific fields (hidden by default) -->
            <div id="riderFields" style="display: none;">
                <label for="vehicleType">Vehicle Type:</label>
                <input type="text" id="vehicleType" name="vehicleType">

                <label for="vehicleNumber">Vehicle Number:</label>
                <input type="text" id="vehicleNumber" name="vehicleNumber">
            </div>

            <button type="submit">Register</button>
        </form>

        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>
