package com.megacity.service;

import com.megacity.models.Login;

public interface LoginService {
    Login authenticateUser(String username, String password);
}