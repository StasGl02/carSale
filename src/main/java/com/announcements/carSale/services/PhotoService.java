package com.announcements.carSale.services;

import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.Photo;
import com.announcements.carSale.repos.PhotoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class PhotoService {
    @Autowired
    private PhotoRepo photoRepo;

    public void savePhoto(MultipartFile file, Offer offer) {
        try {
            photoRepo.save(new Photo(file.getBytes(), offer));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public Photo findPhoto(long id) {
        return photoRepo.getById(id);
    }

    public List<Photo> findPhotos() {
        return photoRepo.findAll();
    }

    public List<Photo> findUniquePhotos(List<Offer> offers) {
        List<Photo> photos = new ArrayList<>();
        for (Offer offer : offers) {
            Photo p = photoRepo.findFirstByOffer(offer);
            if (p != null)
                photos.add(p);
        }
        return photos;
    }
}
