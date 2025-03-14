<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book a Ride</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bookride.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script>
        // Function to calculate the price based on vehicle type and length of ride
        function calculatePrice() {
            var vehicleType = document.querySelector('input[name="vehicleType"]:checked');
            var lengthOfRide = parseFloat(document.getElementById('length_of_ride').value);
            var priceField = document.getElementById('price');

            if (vehicleType && !isNaN(lengthOfRide)) {
                var vehicleRates = {
                    "car": 100,  
                    "van": 150,  
                    "bus": 200,  
                    
                };

                var rate = vehicleRates[vehicleType.value] || 0;
                var price = rate * lengthOfRide;
                priceField.value = price.toFixed(2); // Set the calculated price with 2 decimal places
            }
        }

        // Event listeners for vehicle type and length of ride to trigger price calculation
        window.onload = function() {
            // Calculate price on page load if there's an initial input
            calculatePrice();

            // Add event listener to vehicle type selection
            var vehicleRadios = document.querySelectorAll('input[name="vehicleType"]');
            vehicleRadios.forEach(function(radio) {
                radio.addEventListener('change', calculatePrice);
            });

            // Add event listener to length of ride input
            document.getElementById('length_of_ride').addEventListener('input', calculatePrice);
        };
    </script>
</head>
<body>
    <%
        if (session == null || session.getAttribute("user") == null ) {
            response.sendRedirect("../login.jsp");
            return;
        }

        String username = (String) session.getAttribute("user");
    %>

    <!-- Include the header -->
    <jsp:include page="header.jsp" />
    
    <div class="main">
        <div class="container1">
            <form action="${pageContext.request.contextPath}/ride" method="post" class="signup-form">
                <input type="hidden" name="action" value="book">
                
                <h2 class="form-title">Book a Ride</h2>
                
                <!-- Start Location -->
                <div class="form-group">
                    <label for="start_location">Start Location</label>
                    <input type="text" id="start_location" name="start_location" required>
                </div>
                
                <!-- End Location -->
                <div class="form-group">
                    <label for="end_location">End Location</label>
                    <input type="text" id="end_location" name="end_location" required>
                </div>
                
                <!-- Length of Ride -->
                <div class="form-group">
                    <label for="length_of_ride">Length of Ride (in km)</label>
                    <input type="number" step="0.01" id="length_of_ride" name="length_of_ride" required>
                </div>
                
                <!-- Customer Username -->
                <div class="form-group">
                    <%
                        String customerUsername = (String) session.getAttribute("user");
                        if (customerUsername == null) {
                            customerUsername = "";
                        }
                    %>
                    <input type="text" id="customer_username" name="customer_username" value="<%= customerUsername %>" readonly>
                </div>
                
                <!-- Vehicle Type -->
                <div class="form-group">
                    <label>Select Vehicle Type:</label>
                    <div class="form-group">
					    <div class="vehicle-cards">
					        <label class="card">
					            <input type="radio" name="vehicleType" value="car" required>
					            <i class="fas fa-car"></i> <!-- FontAwesome Car Icon -->
					            <span>Car</span>
					        </label>
					        <label class="card">
					            <input type="radio" name="vehicleType" value="van">
					            <i class="fas fa-shuttle-van"></i> <!-- FontAwesome Van Icon -->
					            <span>Van</span>
					        </label>
					        <label class="card">
					            <input type="radio" name="vehicleType" value="bus">
					            <i class="fa-solid fa-bus"></i> <!-- FontAwesome Bike Icon -->
					            <span>Bus</span>
					        </label>

					    </div>
					</div>
                </div>
                
                <!-- Price -->
                <div class="form-group">
                    <label for="price">Price (LKR)</label>
                    <input type="number" step="0.01" id="price" name="price" required readonly>
                </div>
                
                <!-- Submit Button -->
                <div class="form-button">
                    <button type="submit" class="form-submit">Book Ride</button>
                </div>
            </form>
            <div class="ride-image">
            	<img alt="" src="<%= request.getContextPath() %>/images/taxi.jpg">
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>