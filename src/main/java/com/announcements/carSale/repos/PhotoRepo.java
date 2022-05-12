package com.announcements.carSale.repos;

import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.Photo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PhotoRepo extends JpaRepository<Photo, Long> {
    Photo findFirstByOffer(Offer offer);
}
