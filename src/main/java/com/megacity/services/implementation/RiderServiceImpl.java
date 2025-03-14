package com.megacity.services.implementation;

import java.util.List;
import com.megacity.dao.UserDAO;
import com.megacity.models.User;
import com.megacity.service.RiderService;

public class RiderServiceImpl implements RiderService {
    private UserDAO userDAO;

    public RiderServiceImpl() {
        this.userDAO = new UserDAO(); // Initialize the UserDAO
    }

    @Override
    public List<User> getAllRiders() {
        return userDAO.getAllRider(); // Call the DAO method
    }
}