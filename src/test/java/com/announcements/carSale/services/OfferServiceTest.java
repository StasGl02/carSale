package com.announcements.carSale.services;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
class OfferServiceTest {
    @Autowired
    private OfferService offerService;

    @Test
    void findApprovedOffers() {
        assertEquals(offerService.findApprovedOffersPriceAsc().size(), 2);
    }

    @Test
    void findUnreviewedOffers() {
        assertEquals(offerService.findUnreviewedOffersPriceAsc().size(), 1);
    }
}