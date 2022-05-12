package com.announcements.carSale.services;

import com.announcements.carSale.models.Role;
import com.announcements.carSale.models.User;
import com.announcements.carSale.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;


@Service
public class RegistrationService {
    @Autowired
    private UserRepo userRepo;

    public User findUserByUsername(User user){
        return userRepo.findByUsername(user.getUsername());
    }

    public void saveUser(User user){
        user.setActive(true);
        user.setRole(Collections.singleton(Role.USER));
        userRepo.save(user);
    }
}
