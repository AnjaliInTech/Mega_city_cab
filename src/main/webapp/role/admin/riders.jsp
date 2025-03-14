<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Riders</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/customers.css">
</head>
<body>
   <jsp:include page="header.jsp" />
    <div class="container_big">
        <h1>All Riders</h1>

        <c:if test="${not empty riders}">
            <table border="1">
                <tr>
                    <th>Name</th>
                    <th>NIC</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Vehicle Type</th>
                    <th>Vehicle Number</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="rider" items="${riders}">
                    <tr>
                        <td>${rider.name}</td>
                        <td>${rider.nic}</td>
                        <td>${rider.address}</td>
                        <td>${rider.phone}</td>
                        <td>${rider.username}</td>
                        <td>${rider.role}</td>
                        <td>${rider.vehicleType}</td> <!-- Added Vehicle Type -->
                        <td>${rider.vehicleNumber}</td> <!-- Added Vehicle Number -->
                        <td>
                            <form action="deleteCustomer" method="post" style="display:inline;">
                                <input type="hidden" name="username" value="${rider.username}">
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        
        <c:if test="${empty riders}">
            <p>No Riders available.</p>
        </c:if>
    </div>
</body>
</html>