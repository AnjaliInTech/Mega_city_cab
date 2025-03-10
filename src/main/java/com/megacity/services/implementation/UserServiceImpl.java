package com.megacity.services.implementation;

import com.megacity.dao.UserDAO;
import com.megacity.models.User;
import com.megacity.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDAO userDAO = new UserDAO();

    @Override
    public boolean registerUser(User user) {
        return userDAO.registerUser(user);
    }
    
  
}
