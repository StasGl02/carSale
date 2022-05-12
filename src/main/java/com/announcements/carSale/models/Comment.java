package com.announcements.carSale.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="comment")
@NoArgsConstructor
@Setter
@Getter
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "offer_id")
    private Offer offer;

    private String text;

    private String publicationTime;

    public Comment(User user, Offer offer, String text, String publicationTime) {
        this.user = user;
        this.offer = offer;
        this.text = text;
        this.publicationTime = publicationTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", user=" + user +
                ", offer=" + offer +
                ", text='" + text + '\'' +
                ", publicationTime='" + publicationTime + '\'' +
                '}';
    }
}
