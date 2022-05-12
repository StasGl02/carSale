package com.announcements.carSale.controllers;

import com.announcements.carSale.models.*;
import com.announcements.carSale.services.*;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class OfferController {
    @Autowired
    private MakeService makeService;

    @Autowired
    private ModelService modelService;

    @Autowired
    private EngineService engineService;

    @Autowired
    private ColorService colorService;

    @Autowired
    private BodyService bodyService;

    @Autowired
    private RegionService regionService;

    @Autowired
    private OfferService offerService;

    @Autowired
    private PhotoService photoService;

    @GetMapping("/offer")
    public String publication(Model model) {
        MainController.fill(model, makeService, bodyService, engineService, colorService, regionService);
        return "offer";
    }

    @ResponseBody
    @GetMapping(value=  {"/offer/loadModelsByMake/{id}", "/search/loadModelsByMake/{id}"})
    public String loadModelsByMake(@PathVariable("id") long id) {
        Gson gson = new Gson();
        return gson.toJson(modelService.findModelsByMake(id));
    }

    @PostMapping("/offer")
    public String publish(@AuthenticationPrincipal User user,
                          @RequestParam String title, @RequestParam int price,
                          @RequestParam(value = "checkboxes", required = false) List<String> checkboxes,
                          @RequestParam long model, @RequestParam long body,
                          @RequestParam long color, @RequestParam long engine,
                          @RequestParam String transmission, @RequestParam double engineCapacity,
                          @RequestParam int year, @RequestParam int mileage,
                          @RequestParam String description, @RequestParam long region,
                          @RequestParam(value = "photos", required = false) MultipartFile[] photos) throws IOException {

        com.announcements.carSale.models.Model m = modelService.findModelById(model);
        Body b = bodyService.findBodyById(body);
        Color c = colorService.findColorById(color);
        Engine e = engineService.findEngineById(engine);
        Region r = regionService.findRegionById(region);
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm");
        LocalDateTime now = LocalDateTime.now();
        String currentDate = dtf.format(now);

        StringBuilder options = new StringBuilder("00000000");
        for (String i : checkboxes) {
            options.setCharAt(Integer.parseInt(i) - 1, '1');
        }
        Offer offer = new Offer(user, m, e, b, c, r, title, price,
                currentDate, transmission, engineCapacity, year, mileage, options.toString(), description, 0);
        Offer savedOffer = offerService.saveOffer(offer);
        for (MultipartFile f : photos) {
            photoService.savePhoto(f, savedOffer);
        }
        return "redirect:/";
    }
}
