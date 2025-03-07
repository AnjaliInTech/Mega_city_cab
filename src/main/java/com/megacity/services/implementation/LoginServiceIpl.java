package com.megacity.services.implementation;

import com.megacity.dao.LoginDAO;
import com.megacity.models.Login;
import com.megacity.service.LoginService;

public class LoginServiceIpl implements LoginService {
    private LoginDAO loginDAO = new LoginDAO();

    @Override
    public Login authenticateUser(String username, String password) {
        return loginDAO.authenticateUser(username, password);
    }
}
