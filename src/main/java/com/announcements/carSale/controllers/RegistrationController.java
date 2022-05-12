package com.announcements.carSale.controllers;

import com.announcements.carSale.models.User;
import com.announcements.carSale.services.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private RegistrationService registrationService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = registrationService.findUserByUsername(user);
        if (userFromDb != null) {
            model.put("message", "Пользователь уже существует");
            return "registration";
        }
        registrationService.saveUser(user);
        return "redirect:/login";
    }
}
