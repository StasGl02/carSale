package com.announcements.carSale.services;

import com.announcements.carSale.models.Favorite;
import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.User;
import com.announcements.carSale.repos.FavoriteRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoriteService {
    @Autowired
    private FavoriteRepo favoriteRepo;

    public void saveFavorite(Favorite favorite) {
        favoriteRepo.save(favorite);
    }

    public void deleteFavorite(Favorite favorite) {
        favoriteRepo.delete(favorite);
    }

    public List<Favorite> findFavoritesByUser(User user) {
        return favoriteRepo.findFavoritesByUser(user);
    }

    public Favorite findFavoriteByUserAndOffer(User user, Offer offer) {
        return favoriteRepo.findFavoriteByUserAndOffer(user, offer);
    }

}
