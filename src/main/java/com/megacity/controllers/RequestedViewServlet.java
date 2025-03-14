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

@WebServlet("/view-bookings")
public class RequestedViewServlet extends HttpServlet {
    private final RideService rideService = new RideServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve all requested rides from the database
        List<Ride> rides = rideService.getRequestedRides();

        // Set the rides as an attribute in the request
        req.setAttribute("bookings", rides);

        // Forward the request to the viewbook.jsp page
        req.getRequestDispatcher("/role/customer/viewbook.jsp").forward(req, resp);
    }
}