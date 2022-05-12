package com.announcements.carSale.services;

import com.announcements.carSale.models.Model;
import com.announcements.carSale.repos.ModelRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModelService {
    @Autowired
    private ModelRepo modelRepo;

    public List<Model> findModelsByMake(long id) {
        return modelRepo.findByMake(id);
    }

    public void saveModel(Model model) {
        modelRepo.save(model);
    }

    public Model findModelById(long id) {
        return modelRepo.getById(id);
    }
}
