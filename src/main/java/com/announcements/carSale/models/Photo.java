package com.announcements.carSale.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Base64;

@Entity
@Table(name = "photo")
@NoArgsConstructor
@Setter
@Getter
public class Photo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Lob
    private byte[] photoData;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "offer_id")
    private Offer offer;

    public Photo(byte[] photoData, Offer offer) {
        this.photoData = photoData;
        this.offer = offer;
    }

    public String getPhotoStr() {
        byte[] imgBase64 = Base64.getEncoder().encode(this.getPhotoData());
        String imgData = new String(imgBase64);
        return ("data:/image/*;base64," + imgData);
    }

    @Override
    public String toString() {
        return "Photo{" +
                "id=" + id +
                ", offer=" + offer +
                '}';
    }
}
