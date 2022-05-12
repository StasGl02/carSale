package com.announcements.carSale.repos;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class UserRepoTest {
    @Autowired
    private UserRepo userRepo;
    @Test
    public void authorizationAdmin() {
        assertTrue(userRepo.findByUsername("admin").isAdmin());
    }
}