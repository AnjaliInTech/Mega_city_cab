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
    // Method to assign a rider to a ride
    public void assignRider(int rideId, String riderUsername, String vehicleNumber, String phone) {
        String query = "UPDATE rides SET rider_username = ?, vehicle_plate_number = ?, mobile = ?, ride_status = 'ASSIGNED' WHERE id = ?";

        try (Connection conn = db_connection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, riderUsername);
            stmt.setString(2, vehicleNumber);
            stmt.setString(3, phone);
            stmt.setInt(4, rideId);

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Better to log this in real projects
            throw new RuntimeException("Database error while assigning rider", e);
        }
    }
    // Method to get all rides with status "ASSIGNED"
    public List<Ride> getAssignedRides() throws SQLException {
        String query = "SELECT * FROM rides WHERE ride_status = ?";
        List<Ride> assignedRides = new ArrayList<>();
        try (Connection conn = db_connection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, "ASSIGNED");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Ride ride = new Ride(
                        rs.getInt("id"),
                        rs.getString("start_location"),
                        rs.getString("end_location"),
                        rs.getString("customer_username"),
                        rs.getString("rider_username") != null ? rs.getString("rider_username") : "",
                        rs.getDouble("price"),
                        rs.getDouble("length_of_ride"),
                        rs.getString("ride_status"),
                        rs.getString("vehicle_type"),
                        rs.getString("vehicle_plate_number") != null ? rs.getString("vehicle_plate_number") : "",
                        rs.getString("mobile") != null ? rs.getString("mobile") : "",
                        rs.getTimestamp("ride_started_at") != null ? rs.getTimestamp("ride_started_at").toLocalDateTime() : null,
                        rs.getTimestamp("ride_ended_at") != null ? rs.getTimestamp("ride_ended_at").toLocalDateTime() : null
                );
                assignedRides.add(ride);
            }
        } catch (SQLException e) {
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
        return assignedRides;
    }
    
}