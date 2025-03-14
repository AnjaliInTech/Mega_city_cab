package com.megacity.controllers;

import com.megacity.service.RiderService;

import com.megacity.services.implementation.RiderServiceImpl;
import com.megacity.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/riders")
public class RiderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RiderService riderService = new RiderServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> riders = riderService.getAllRiders();
        
        if (riders != null) {
            request.setAttribute("riders", riders);
        } else {
            request.setAttribute("riders", new ArrayList<>()); // Ensure no null pointer error
        }

        request.getRequestDispatcher("role/admin/riders.jsp").forward(request, response);
    }
}