package com.megacity.service;

import java.util.List;

import com.megacity.models.User;

public interface UserService {
    boolean registerUser(User user);
    List<User> getRidersByVehicleType(String vehicleType);
   
}
