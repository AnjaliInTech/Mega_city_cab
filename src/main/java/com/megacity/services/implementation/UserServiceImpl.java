package com.megacity.services.implementation;

import java.util.List;

import com.megacity.dao.UserDAO;
import com.megacity.models.User;
import com.megacity.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDAO userDAO = new UserDAO();

    @Override
    public boolean registerUser(User user) {
        return userDAO.registerUser(user);
    }
    @Override
    public List<User> getRidersByVehicleType(String vehicleType) {
        return userDAO.getRidersByVehicleType(vehicleType);
    }
  
}
