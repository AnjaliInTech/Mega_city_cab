package com.megacity.services.implementation;

import com.megacity.dao.RideDao;
import com.megacity.models.Ride;
import com.megacity.service.RideService;

public class RideServiceImpl implements RideService {
    private final RideDao rideDao = new RideDao();

    @Override
    public void bookRide(Ride ride) {
        // No need to catch SQLException, already handled in RideDao
        rideDao.bookRide(ride);
    }
}
