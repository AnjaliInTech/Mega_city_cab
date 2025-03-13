package com.megacity.service;

import com.megacity.models.Ride;

import java.util.List;

public interface RideService {
    void bookRide(Ride ride);
    List<Ride> getRequestedRides();
    // Method to assign a rider to a ride
    void assignRider(int rideId, String riderUsername, String vehicleNumber, String phone);
}