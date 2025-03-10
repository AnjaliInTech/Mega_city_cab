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
    </script>
</head>

<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h2>Customer Ride Bookings</h2>

        <!-- Status Dropdown -->
        <label for="statusFilter">Filter by Status:</label>
        <select id="statusFilter" class="status-dropdown" onchange="filterStatus()">
            <option value="All">All</option>
            <option value="Requested">Requested</option>
            <option value="Assigned">Assigned</option>
            <option value="Accepted">Accepted</option>
            <option value="Canceled">Canceled</option>
            <option value="Completed">Completed</option>
        </select>

        <!-- Bookings Table -->
        <table>
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
                    <th>Vehicle No.</th>
                    <th>Action</th> <!-- New Action Column -->
                </tr>
            </thead>

            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr class="bookingRow">
                        <td>${booking.bookingId}</td>
                        <td>${booking.pickupLocation}</td>
                        <td>${booking.dropoffLocation}</td>
                        <td>${booking.price}</td>
                        <td>${booking.lengthOfRide}</td>
                        <td>${booking.vehicleType}</td>
                        <td class="status">${booking.status}</td>
                        <td>${booking.customerUsername}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty booking.riderUsername}">
                                    ${booking.riderUsername}
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty booking.vehicleNo}">
                                    ${booking.vehicleNo}
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <!-- Cancel Button -->
                        <td>
                            <c:if test="${booking.status != 'Canceled' && booking.status != 'Completed'}">
                                <form action="CancelBookingServlet" method="post" onsubmit="event.preventDefault(); confirmCancel(this);">
                                    <input type="hidden" name="bookingId" value="${booking.bookingId}" />
                                    <button type="submit" class="cancel-btn">Cancel</button>
                                </form>
                            </c:if>
                            <c:if test="${booking.status == 'Canceled' || booking.status == 'Completed'}">
                                <span>-</span>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
