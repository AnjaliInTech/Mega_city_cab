package com.megacity.services.implementation;

import com.megacity.dao.UserDAO;
import com.megacity.models.User;
import com.megacity.service.CustomerService;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    private UserDAO userDAO = new UserDAO();

    @Override
    public List<User> getAllCustomers() {
        return userDAO.getAllUsers();
    }
}