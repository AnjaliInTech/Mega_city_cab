package com.megacity.controllers;

import com.megacity.models.Ride;
import com.megacity.service.RideService;
import com.megacity.services.implementation.RideServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/requested-rides")
public class RequestedRidesServlet extends HttpServlet {
    private final RideService rideService = new RideServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Ride> requestedRides = rideService.getRequestedRides();
        req.setAttribute("requestedRides", requestedRides);
        req.getRequestDispatcher("/role/admin/requestedRides.jsp").forward(req, resp);
    }
}