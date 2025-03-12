package com.megacity.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacity.models.User;
import com.megacity.service.UserService;
import com.megacity.services.implementation.UserServiceImpl;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String vehicleType = request.getParameter("vehicleType");
        String vehicleNumber = request.getParameter("vehicleNumber");

        User user = new User(name, nic, address, phone, username, password, role, vehicleType, vehicleNumber);

        boolean isRegistered = userService.registerUser(user);

        if (isRegistered) {
            response.sendRedirect(request.getContextPath() + "/role/login.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/role/register.jsp?error=1");
        }
    }
}
