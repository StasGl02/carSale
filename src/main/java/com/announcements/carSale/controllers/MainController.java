package com.announcements.carSale.controllers;

import com.announcements.carSale.models.*;
import com.announcements.carSale.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
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

    @GetMapping("/")
    public String mainPage(Model model) {
        List<Offer> offers = offerService.findApprovedOffersPriceAsc();
        fill(model, makeService, bodyService, engineService, colorService, regionService);
        model.addAttribute("offers", offers);
        return "main";
    }

    @PostMapping("/filter")
    public String filter(@RequestParam(value = "sort", required = false) String sort, Model model) {
        switch (sort) {
            case "byPriceDesc" -> model.addAttribute("offers", offerService.findApprovedOffersPriceDesc());
            case "byPriceAsc" -> model.addAttribute("offers", offerService.findApprovedOffersPriceAsc());
            case "byYearDesc" -> model.addAttribute("offers", offerService.findApprovedOffersYearDesc());
            case "byYearAsc" -> model.addAttribute("offers", offerService.findApprovedOffersYearAsc());
            case "byMileage" -> model.addAttribute("offers", offerService.findApprovedOffersMileageAsc());
        }
        fill(model, makeService, bodyService, engineService, colorService, regionService);
        return "main";
    }

    @PostMapping("/search")
    public String search(@RequestParam(value = "model", required = false, defaultValue = "0") String model,
                         @RequestParam(value = "color", required = false, defaultValue = "0") String color,
                         @RequestParam(value = "engine", required = false, defaultValue = "0") String engine,
                         @RequestParam(value = "mileageFrom", required = false, defaultValue = "0") String mileageFrom,
                         @RequestParam(value = "mileageTo", required = false, defaultValue = "0") String mileageTo,
                         @RequestParam(value = "priceFrom", required = false, defaultValue = "0") String priceFrom,
                         @RequestParam(value = "priceTo", required = false, defaultValue = "0") String priceTo,
                         Model modelAttr) {
        List<Offer> allOffers = offerService.findApprovedOffersPriceAsc();
        List<Offer> searchOffers = new ArrayList<>();
        for (Offer offer : allOffers) {
            if ((offer.getModel() == modelService.findModelById(Long.parseLong(model)) || model.equals("0"))
                    && (offer.getColor() == colorService.findColorById(Long.parseLong(color)) || color.equals("0"))
                    && (offer.getEngine() == engineService.findEngineById(Long.parseLong(engine)) || engine.equals("0"))
                    && (offer.getMileage() >= Integer.parseInt(mileageFrom) || mileageFrom.equals("0"))
                    && (offer.getMileage() <= Integer.parseInt(mileageTo) || mileageTo.equals("0"))
                    && (offer.getPrice() >= Double.parseDouble(priceFrom) || priceFrom.equals("0"))
                    && (offer.getPrice() <= Double.parseDouble(priceTo) || priceTo.equals("0"))
            ) {
                searchOffers.add(offer);
            }
        }
        modelAttr.addAttribute("offers", searchOffers);
        fill(modelAttr, makeService, bodyService, engineService, colorService, regionService);
        return "main";
    }

    static void fill(Model model, MakeService makeService, BodyService bodyService, EngineService engineService, ColorService colorService, RegionService regionService) {
        List<Make> makes = makeService.findAllMakes();
        List<Body> bodies = bodyService.findBodies();
        List<Engine> engines = engineService.findEngines();
        List<Color> colors = colorService.findColors();
        List<Region> regions = regionService.findRegions();

        model.addAttribute("makes", makes);
        model.addAttribute("bodies", bodies);
        model.addAttribute("engines", engines);
        model.addAttribute("colors", colors);
        model.addAttribute("regions", regions);
    }
}
