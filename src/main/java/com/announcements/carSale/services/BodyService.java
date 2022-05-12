package com.announcements.carSale.services;

import com.announcements.carSale.models.Body;
import com.announcements.carSale.repos.BodyRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BodyService {
    @Autowired
    private BodyRepo bodyRepo;

    public void saveBody(Body body) {
        bodyRepo.save(body);
    }

    public List<Body> findBodies() {
        return bodyRepo.findAll();
    }

    public Body findBodyById(long id) {
        return bodyRepo.getById(id);
    }
}
