package com.megacity.dao;

import com.megacity.models.Ride;
import utils.db_connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RideDao {

    // Method to book a ride
    public void bookRide(Ride ride) {
        String query = "INSERT INTO rides (start_location, end_location, customer_username, price, length_of_ride, ride_status, vehicle_type) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = db_connection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, ride.getStart_location());
            stmt.setString(2, ride.getEnd_location());
            stmt.setString(3, ride.getCustomer_username());
            stmt.setDouble(4, ride.getPrice());
            stmt.setDouble(5, ride.getLengthOfRide());
            stmt.setString(6, ride.getRideStatus());
            stmt.setString(7, ride.getVehicleType());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Better to log this in real projects
            throw new RuntimeException("Database error while booking ride", e);
        }
    }

    // Method to fetch requested rides
    public List<Ride> getRequestedRides() {
        List<Ride> rides = new ArrayList<>();
        String query = "SELECT * FROM rides WHERE ride_status = 'REQUESTED'";

        try (Connection conn = db_connection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Ride ride = new Ride();
                ride.setId(rs.getInt("id"));
                ride.setStart_location(rs.getString("start_location"));
                ride.setEnd_location(rs.getString("end_location"));
                ride.setCustomer_username(rs.getString("customer_username"));
                ride.setPrice(rs.getDouble("price"));
                ride.setLengthOfRide(rs.getDouble("length_of_ride"));
                ride.setRideStatus(rs.getString("ride_status"));
                ride.setVehicleType(rs.getString("vehicle_type"));
                rides.add(ride);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Database error while fetching requested rides", e);
        }

        return rides;
    }
}