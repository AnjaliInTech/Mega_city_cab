package com.megacity.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.megacity.dao.LoginDAO;
import com.megacity.models.Login;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginDAO loginDAO = new LoginDAO();
        Login user = loginDAO.authenticateUser(username, password);

        if (user != null) {
            // Store user information in the session
            HttpSession session = request.getSession();
            session.setAttribute("user", user.getUsername());
            session.setAttribute("role", user.getRole());

            // Redirect to the appropriate page based on the user's role
            if ("customer".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/role/customer/indexc.jsp");
            } else if("rider".equals(user.getRole())) {
            	response.sendRedirect(request.getContextPath() + "/role/rider/header.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/role/admin/header.jsp");
            } 
        } else {
            // Redirect back to the login page with an error message
            response.sendRedirect(request.getContextPath() + "/role/login.jsp?error=1");
        }
    }
}