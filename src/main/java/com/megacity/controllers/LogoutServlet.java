package com.megacity.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current session (if it exists)
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Invalidate the session to log the user out
            session.invalidate();
        }

        // Redirect the user to the login page or homepage
        response.sendRedirect(request.getContextPath() + "/role/register.jsp");
    }
}