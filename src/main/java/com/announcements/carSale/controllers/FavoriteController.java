package com.announcements.carSale.controllers;

import com.announcements.carSale.models.Favorite;
import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.User;
import com.announcements.carSale.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class FavoriteController {
    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private OfferService offerService;

    @PostMapping("/publication/addFavorite")
    public String addFavorite(@RequestParam("offerId") Offer offer, @RequestParam("userId") User user) {
        favoriteService.saveFavorite(new Favorite(user, offer));
        return "redirect:/publication/" + offer.getId();
    }

    @PostMapping("/publication/removeFavorite")
    public String removeFavorite(@RequestParam("favoriteId") Favorite favorite) {
        favoriteService.deleteFavorite(favorite);
        return "redirect:/publication/" + favorite.getOffer().getId();
    }

    @GetMapping("/favorite/{user}")
    public String showFavorite(@PathVariable User user, Model model) {
        List<Favorite> favorites = favoriteService.findFavoritesByUser(user);
        List<Offer> offers = offerService.findFavoriteOffers(favorites);
        model.addAttribute("offers", offers);
        return "main";
    }
}
