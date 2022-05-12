package com.announcements.carSale.repos;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ModelRepoTest {
    @Autowired
    private ModelRepo modelRepo;

    @Test
    void findAllModels() {
        assertEquals(3211, modelRepo.findAll().size());
    }

    @Test
    void findModelsByMake() {
        assertEquals(modelRepo.findByMake(1).size(), 4);
    }
}