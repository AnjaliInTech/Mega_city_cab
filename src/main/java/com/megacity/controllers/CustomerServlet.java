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

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService = new CustomerServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> customers = customerService.getAllCustomers();
        
        if (customers != null) {
            request.setAttribute("customers", customers);
        } else {
            request.setAttribute("customers", new ArrayList<>()); // Ensure no null pointer error
        }

        request.getRequestDispatcher("role/admin/customers.jsp").forward(request, response);
    }
}