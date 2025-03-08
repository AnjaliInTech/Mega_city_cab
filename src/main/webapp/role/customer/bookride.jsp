<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Check if the user is logged in
    if (session.getAttribute("user") == null) {
        // Redirect to login page if not logged in
        response.sendRedirect(request.getContextPath() + "/role/register.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book a Ride</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bookride.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script>
        function calculatePrice() {
            var vehicleType = document.querySelector('input[name="vehicleType"]:checked');
            var lengthOfRide = parseFloat(document.getElementById('length_of_ride').value);
            var priceField = document.getElementById('price');

            if (vehicleType && !isNaN(lengthOfRide)) {
                var vehicleRates = {
                    "car": 100,
                    "bus": 150,
                    "van": 120
                };

                var rate = vehicleRates[vehicleType.value] || 0;
                var price = rate * lengthOfRide;
                priceField.value = price.toFixed(2);
            }
        }

        window.onload = function() {
            calculatePrice();
            var vehicleRadios = document.querySelectorAll('input[name="vehicleType"]');
            vehicleRadios.forEach(function(radio) {
                radio.addEventListener('change', calculatePrice);
            });
            document.getElementById('length_of_ride').addEventListener('input', calculatePrice);
        };
    </script>

</head>
<body>
     <jsp:include page="header.jsp" />
    
    <div class="main">
        <div class="container1">
            <form action="#" method="post" class="signup-form">
                <h2 class="form-title">BOOK RIDE</h2> 
                <div class="form-group">
                    <label for="start_location">PickUp Location</label>
                    <input type="text" id="start_location" name="start_location" required>
                </div>
                
                <div class="form-group">
                    <label for="end_location">Drop-Off Location</label>
                    <input type="text" id="end_location" name="end_location" required>
                </div>
                
                <div class="form-group">
                    <label for="length_of_ride">Length of Ride (in km)</label>
                    <input type="number" step="0.01" id="length_of_ride" name="length_of_ride" required>
                </div>
                
                <div class="form-group">
                    <label>Select Vehicle Type:</label>
                    <div class="vehicle-cards">
                        <label class="card">
                            <input type="radio" name="vehicleType" value="car" required>
                            <i class="fas fa-car"></i> <span>Car</span>
                        </label>
                        <label class="card">
                            <input type="radio" name="vehicleType" value="van">
                            <i class="fa-solid fa-van-shuttle"></i> <span>Van</span>
                        </label>
                        <label class="card">
                            <input type="radio" name="vehicleType" value="bus">
                            <i class="fa-solid fa-bus"></i> <span>Bus</span>
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="price">Price (LKR)</label>
                    <input type="number" step="0.01" id="price" name="price" required readonly>
                </div>
                
                <div class="form-button">
                    <button type="submit" class="form-submit">Book Ride</button>
                </div>
            </form>
            <div class="ride-image">
                <img alt="" src="${pageContext.request.contextPath}/images/taxi.jpg">
            </div>
        </div>
    </div>
</body>
</html>

