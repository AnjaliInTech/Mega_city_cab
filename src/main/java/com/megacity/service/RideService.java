package com.megacity.service;

import com.megacity.models.Ride;

import java.time.LocalDateTime;
import java.util.List;

public interface RideService {
    void bookRide(Ride ride);
    
}