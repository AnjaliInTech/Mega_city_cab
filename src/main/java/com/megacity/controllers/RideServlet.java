package com.megacity.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacity.models.Ride;
import com.megacity.service.RideService;
import com.megacity.services.implementation.RideServiceImpl;

@WebServlet("/ride")
public class RideServlet extends HttpServlet {
    private final RideService rideService = new RideServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("book".equals(action)) {
            // Book a ride
            Ride ride = new Ride();
            ride.setStart_location(req.getParameter("start_location"));
            ride.setEnd_location(req.getParameter("end_location"));
            ride.setCustomer_username(req.getParameter("customer_username"));
            ride.setPrice(Double.parseDouble(req.getParameter("price")));
            ride.setLengthOfRide(Double.parseDouble(req.getParameter("length_of_ride")));
            ride.setRideStatus("REQUESTED");
            ride.setVehicleType(req.getParameter("vehicleType"));
            rideService.bookRide(ride);
            // Add success message to session
            req.getSession().setAttribute("successMessage", "Rlde Booked successful!");
            resp.sendRedirect(req.getContextPath() + "/user-rides");
        }
    }


}