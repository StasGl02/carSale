package com.announcements.carSale.services;

import com.announcements.carSale.models.Engine;
import com.announcements.carSale.repos.EngineRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EngineService {
    @Autowired
    private EngineRepo engineRepo;

    public void saveEngine(Engine engine) {
        engineRepo.save(engine);
    }

    public List<Engine> findEngines() {
        return engineRepo.findAll();
    }

    public Engine findEngineById(long id) {
        return engineRepo.getById(id);
    }
}
