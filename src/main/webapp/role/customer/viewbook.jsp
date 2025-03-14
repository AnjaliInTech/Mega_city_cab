<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Bookings</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/viewbook.css">
    
    <script>
        function filterStatus() {
            var selectedStatus = document.getElementById("statusFilter").value;
            var rows = document.getElementsByClassName("bookingRow");

            for (var i = 0; i < rows.length; i++) {
                var statusCell = rows[i].getElementsByClassName("status")[0];
                if (selectedStatus === "All" || statusCell.innerText === selectedStatus) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }

        function confirmCancel(form) {
            if (confirm("Are you sure you want to cancel this booking?")) {
                form.submit();
            }
        }

        function closeModal() {
            document.getElementById("rideDetailsModal").style.display = "none";
        }

        function viewRideDetails(rideId, startLocation, endLocation, customerUsername, price, lengthOfRide, vehicleType) {
            document.getElementById("rideId").value = rideId;
            document.getElementById("startLocation").value = startLocation;
            document.getElementById("endLocation").value = endLocation;
            document.getElementById("customerUsername").value = customerUsername;
            document.getElementById("price").value = price;
            document.getElementById("lengthOfRide").value = lengthOfRide;
            document.getElementById("vehicleType").value = vehicleType;

            document.getElementById("rideDetailsModal").style.display = "block";
        }
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
    <jsp:include page="header.jsp" />
    <div class="container">
        <h2>Customer Ride Bookings</h2>

        <!-- Status Dropdown -->
        <label for="statusFilter">Filter by Status:</label>
        <select id="statusFilter" class="status-dropdown" onchange="filterStatus()">
            <option value="All">All</option>
            <option value="REQUESTED">Requested</option>
            <option value="ASSIGNED">Assigned</option>
            <option value="ACCEPTED">Accepted</option>
            <option value="CANCELLED">Canceled</option>
            <option value="COMPLETED">Completed</option>
        </select>
        

        <!-- Bookings Table -->
        <table border="1">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Pickup Location</th>
                    <th>Drop-off Location</th>
                    <th>Price</th>
                    <th>Ride Length (km)</th>
                    <th>Vehicle Type</th>
                    <th>Status</th>
                    <th>Customer Username</th>
                    <th>Rider Username</th>
                    <th>Vehicle Plate Number</th>
                    <th>Mobile</th>
                    <th>Action</th> <!-- New Action Column -->
                </tr>
            </thead>

            <tbody>
                <c:forEach var="ride" items="${bookings}">
                    <tr class="bookingRow">
                        <td>${ride.id}</td>
                        <td>${ride.start_location}</td>
                        <td>${ride.end_location}</td>
                        <td>${ride.price}</td>
                        <td>${ride.lengthOfRide}</td>
                        <td>${ride.vehicleType}</td>
                        <td class="status">${ride.rideStatus}</td>
                        <td>${ride.customer_username}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty ride.rider_username}">
                                    ${ride.rider_username}
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty ride.vehiclePlateNumber}">
                                    ${ride.vehiclePlateNumber}
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${ride.mobile}</td>

                        <!-- Cancel Button -->
                        <td>
                            <c:if test="${ride.rideStatus != 'Canceled' && ride.rideStatus != 'Completed'}">
                                <form action="CancelBookingServlet" method="post" onsubmit="event.preventDefault(); confirmCancel(this);">
                                    <input type="hidden" name="bookingId" value="${ride.id}" />
                                    <button type="submit" class="cancel-btn">Cancel</button>
                                </form>
                            </c:if>
                            <c:if test="${ride.rideStatus == 'Canceled' || ride.rideStatus == 'Completed'}">
                                <span>-</span>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>