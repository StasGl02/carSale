package com.announcements.carSale.services;

import com.announcements.carSale.models.Favorite;
import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.User;
import com.announcements.carSale.repos.OfferRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OfferService {
    @Autowired
    private OfferRepo offerRepo;

    public List<Offer> findFavoriteOffers(List<Favorite> favorites) {
        List<Offer> offers = new ArrayList<>();
        for (Favorite f : favorites) {
            offers.add(offerRepo.getById(f.getOffer().getId()));
        }
        return offers;
    }
    public List<Offer> findApprovedOffers() {
        return offerRepo.findOffersByStatusOrderByPriceAsc(1);
    }

    public List<Offer> findRejectedOffers() {
        return offerRepo.findOffersByStatusOrderByPriceAsc(-1);
    }

    public List<Offer> findUnreviewedOffers() {
        return offerRepo.findOffersByStatusOrderByPriceAsc(0);
    }

    public List<Offer> findClosedOffers() {
        return offerRepo.findOffersByStatusOrderByPriceAsc(2);
    }

    public Offer saveOffer(Offer offer) {
        return offerRepo.save(offer);
    }

    public void delete(Offer offer) {
        offerRepo.delete(offer);
    }

    public List<Offer> findOffersByUser(User user) {
        return offerRepo.findOffersByUser(user);
    }
}
