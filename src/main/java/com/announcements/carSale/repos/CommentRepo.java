package com.announcements.carSale.repos;

import com.announcements.carSale.models.Comment;
import com.announcements.carSale.models.Offer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepo extends JpaRepository<Comment, Long> {
    List<Comment> findCommentsByOffer(Offer offer);
}
