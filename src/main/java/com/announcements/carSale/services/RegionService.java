package com.announcements.carSale.services;

import com.announcements.carSale.models.Region;
import com.announcements.carSale.repos.RegionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegionService {
    @Autowired
    private RegionRepo regionRepo;

    public void saveRegion(Region region) {
        regionRepo.save(region);
    }

    public List<Region> findRegions() {
        return regionRepo.findAll();
    }

    public Region findRegionById(long id) {
        return regionRepo.getById(id);
    }
}
