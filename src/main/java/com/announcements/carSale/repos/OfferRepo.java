package com.announcements.carSale.repos;

import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OfferRepo extends JpaRepository<Offer, Long> {
    List<Offer> findOffersByUser(User user);
    List<Offer> findOffersByStatusOrderByPriceAsc(int status);
    List<Offer> findOffersByStatusOrderByPriceDesc(int status);
    List<Offer> findOffersByStatusOrderByMileageAsc(int status);
    List<Offer> findOffersByStatusOrderByYearAsc(int status);
    List<Offer> findOffersByStatusOrderByYearDesc(int status);
}
