package com.megacity.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.megacity.models.User;
import com.megacity.services.implementation.UserServiceImpl;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserServiceImpl userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicleType = request.getParameter("vehicleType");
        if (vehicleType != null) {
            List<User> riders = userService.getRidersByVehicleType(vehicleType);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            StringBuilder json = new StringBuilder("[");
            for (User rider : riders) {
                json.append("{")
                    .append("\"username\":\"").append(rider.getUsername()).append("\",")
                    .append("\"name\":\"").append(rider.getName()).append("\",")
                    .append("\"nic\":\"").append(rider.getNic()).append("\",")
                    .append("\"address\":\"").append(rider.getAddress()).append("\",")
                    .append("\"phone\":\"").append(rider.getPhone()).append("\",")
                    .append("\"vehicleType\":\"").append(rider.getVehicleType()).append("\",")
                    .append("\"vehicleNumber\":\"").append(rider.getVehicleNumber()).append("\"")
                    .append("},");
            }
            if (riders.size() > 0) {
                json.deleteCharAt(json.length() - 1);
            }
            json.append("]");
            response.getWriter().write(json.toString());
        }
    }
}