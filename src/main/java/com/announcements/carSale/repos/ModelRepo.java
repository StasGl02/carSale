package com.announcements.carSale.repos;

import com.announcements.carSale.models.Model;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ModelRepo extends JpaRepository<Model, Long> {
    @Query("select new Model(id, modelName) from Model where make.id = :id")
    List<Model> findByMake(@Param("id") long id);
}
