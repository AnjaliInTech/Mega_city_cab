package com.megacity.services.implementation;

import com.megacity.dao.RideDao;
import com.megacity.models.Ride;
import com.megacity.service.RideService;

import java.util.List;

public class RideServiceImpl implements RideService {
    private final RideDao rideDao = new RideDao();

    @Override
    public void bookRide(Ride ride) {
        rideDao.bookRide(ride);
    }

    @Override
    public List<Ride> getRequestedRides() {
        return rideDao.getRequestedRides();
    }
    @Override
    public void assignRider(int rideId, String riderUsername, String vehicleNumber, String phone) {
        // Delegate the rider assignment operation to the DAO layer
        rideDao.assignRider(rideId, riderUsername, vehicleNumber, phone);
    }
}