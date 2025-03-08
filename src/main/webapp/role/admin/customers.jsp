<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Customers</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/customers.css">
</head>
<body>
    <div class="container_big">
        <h1>All Customers</h1>

        <c:if test="${not empty customers}">
            <table border="1">
                <tr>
                    <th>Name</th>
                    <th>NIC</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.name}</td>
                        <td>${customer.nic}</td>
                        <td>${customer.address}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.username}</td>
                        <td>${customer.role}</td>
                     
                        <td>
                            <form action="deleteCustomer" method="post" style="display:inline;">
                                <input type="hidden" name="username" value="${customer.username}">
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        
        <c:if test="${empty customers}">
            <p>No customers available.</p>
        </c:if>
    </div>
</body>
</html>