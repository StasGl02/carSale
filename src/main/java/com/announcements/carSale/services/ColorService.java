package com.announcements.carSale.services;

import com.announcements.carSale.models.Color;
import com.announcements.carSale.repos.ColorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ColorService {
    @Autowired
    private ColorRepo colorRepo;

    public void saveColor(Color color) {
        colorRepo.save(color);
    }

    public List<Color> findColors() {
        return colorRepo.findAll();
    }

    public Color findColorById(long id) {
        return colorRepo.getById(id);
    }
}
