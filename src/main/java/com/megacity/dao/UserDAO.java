package com.megacity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utils.db_connection;
import com.megacity.models.User;

public class UserDAO {
    public boolean registerUser(User user) {
        boolean result = false;
        String query = "INSERT INTO users (name, nic, address, phone, username, password, role, vehicle_type, vehicle_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection connection = db_connection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getNic());
            preparedStatement.setString(3, user.getAddress());
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setString(5, user.getUsername());
            preparedStatement.setString(6, user.getPassword());
            preparedStatement.setString(7, user.getRole());
            preparedStatement.setString(8, user.getVehicleType());
            preparedStatement.setString(9, user.getVehicleNumber());
            
            int rows = preparedStatement.executeUpdate();
            result = rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}