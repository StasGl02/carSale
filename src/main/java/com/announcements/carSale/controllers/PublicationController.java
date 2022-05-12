package com.announcements.carSale.controllers;

import com.announcements.carSale.models.Favorite;
import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.User;
import com.announcements.carSale.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/publication")
public class PublicationController {

    @Autowired
    private OfferService offerService;

    @Autowired
    private FavoriteService favoriteService;

    @PostMapping("/close")
    public String closeOffer(@RequestParam("offerId") Offer offer) {
        offer.setStatus(2);
        offerService.saveOffer(offer);
        return "redirect:/";
    }

    @GetMapping("unreviewed")
    public String showUnreviewedOffers(Model model) {
        List<Offer> offers = offerService.findUnreviewedOffersPriceAsc();
        model.addAttribute("offers", offers);
        return "main";
    }

    @GetMapping("/myPublications/{user}")
    public String showMyPublications(@PathVariable User user, Model model) {
        List<Offer> offers = offerService.findOffersByUser(user);
        model.addAttribute("offers", offers);
        return "main";
    }

    @GetMapping("{offer}")
    public String showOffer(@AuthenticationPrincipal User user,
                            @PathVariable Offer offer, Model model) {
        Favorite favorite = favoriteService.findFavoriteByUserAndOffer(user, offer);
        model.addAttribute("offer", offer);
        model.addAttribute("favorite", favorite);
        return "showOffer";
    }

    @PostMapping("/delete")
    public String deleteOffer(@RequestParam("offerId") Offer offer) {
        offer.setStatus(-1);
        offerService.saveOffer(offer);
        return "redirect:/";
    }

    @PostMapping("/approve")
    public String approveOffer(@RequestParam("offerId") Offer offer) {
        offer.setStatus(1);
        offerService.saveOffer(offer);
        return "redirect:/";
    }
}
