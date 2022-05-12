package com.announcements.carSale.repos;

import com.announcements.carSale.models.Region;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegionRepo extends JpaRepository<Region, Long> {
}
