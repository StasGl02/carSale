package com.announcements.carSale.services;

import com.announcements.carSale.models.Make;
import com.announcements.carSale.repos.MakeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MakeService {
    @Autowired
    private MakeRepo makeRepo;

    public void saveMake(Make make) {
        makeRepo.save(make);
    }

    public List<Make> findAllMakes() {
        return makeRepo.findAll();
    }

    public Make findMakeById(long id) {
        return makeRepo.getById(id);
    }
}
