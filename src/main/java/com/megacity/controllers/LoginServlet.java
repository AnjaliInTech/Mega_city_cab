package com.megacity.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megacity.models.Login;
import com.megacity.service.LoginService;
import com.megacity.services.implementation.LoginServiceIpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginService loginService = new LoginServiceIpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Login login = loginService.authenticateUser(username, password);

        if (login != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", login);
            response.sendRedirect(request.getContextPath() + "/role/customer/header.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/role/login.jsp?error=1");
        }
    }
}