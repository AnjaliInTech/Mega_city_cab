package com.megacity.controllers;

import com.megacity.services.implementation.RideServiceImpl;
import com.megacity.service.RideService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/assignRide")
public class AssignRideServlet extends HttpServlet {
    private final RideService rideService = new RideServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int rideId = Integer.parseInt(req.getParameter("rideId"));
        String riderUsername = req.getParameter("riderUsername");
        String vehicleNumber = req.getParameter("vehicleNumber");
        String phone = req.getParameter("phone");
        
     

        rideService.assignRider(rideId, riderUsername, vehicleNumber, phone);

        resp.sendRedirect(req.getContextPath() + "role/admin/assignedRides.jsp");
    }
}