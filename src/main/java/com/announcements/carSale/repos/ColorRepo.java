package com.announcements.carSale.repos;

import com.announcements.carSale.models.Color;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ColorRepo extends JpaRepository<Color, Long> {
}
