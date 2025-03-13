package com.megacity.controllers;

import com.megacity.service.CustomerService;

import com.megacity.services.implementation.CustomerServiceImpl;
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
    private CustomerService customerService = new CustomerServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> riders = customerService.getAllCustomers();
        
        if (riders != null) {
            request.setAttribute("riders", riders);
        } else {
            request.setAttribute("riders", new ArrayList<>()); // Ensure no null pointer error
        }

        request.getRequestDispatcher("role/admin/riders.jsp").forward(request, response);
    }
}