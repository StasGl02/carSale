package com.announcements.carSale.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "offer")
@NoArgsConstructor
@Setter
@Getter
public class Offer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "model_id")
    private Model model;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "engine_id")
    private Engine engine;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "body_id")
    private Body body;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "color_id")
    private Color color;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "region_id")
    private Region region;

    @OneToMany(mappedBy = "offer", fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<Photo> photos;

    @OneToMany(mappedBy = "offer", fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<Comment> comments;

    @OneToMany(mappedBy = "offer", fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<Favorite> favorites;

    private String title;
    private int price;
    private String date;
    private String transmission;
    private double engineCapacity;
    private int year;
    private int mileage;
    private String options;
    private String description;
    private int status;

    public Offer(User user, Model model, Engine engine, Body body, Color color, Region region, String title, int price, String date, String transmission, double engineCapacity, int year, int mileage, String options, String description, int status) {
        this.user = user;
        this.model = model;
        this.engine = engine;
        this.body = body;
        this.color = color;
        this.region = region;
        this.title = title;
        this.price = price;
        this.date = date;
        this.transmission = transmission;
        this.engineCapacity = engineCapacity;
        this.year = year;
        this.mileage = mileage;
        this.options = options;
        this.description = description;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Offer{" +
                "id=" + id +
                ", user=" + user +
                ", model=" + model +
                ", engine=" + engine +
                ", body=" + body +
                ", color=" + color +
                ", region=" + region +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", date='" + date + '\'' +
                ", transmission='" + transmission + '\'' +
                ", engineCapacity=" + engineCapacity +
                ", year=" + year +
                ", mileage=" + mileage +
                ", options='" + options + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                '}';
    }
}
