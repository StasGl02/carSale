package com.announcements.carSale.repos;

import com.announcements.carSale.models.Favorite;
import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FavoriteRepo extends JpaRepository<Favorite, Long> {
    List<Favorite> findFavoritesByUser(User user);

    Favorite findFavoriteByUserAndOffer(User user, Offer offer);
}
