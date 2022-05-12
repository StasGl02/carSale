package com.announcements.carSale.repos;

import com.announcements.carSale.models.Engine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EngineRepo extends JpaRepository<Engine, Long> {
}
