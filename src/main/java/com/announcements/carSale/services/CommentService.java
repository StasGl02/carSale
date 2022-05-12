package com.announcements.carSale.services;

import com.announcements.carSale.models.Comment;
import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.User;
import com.announcements.carSale.repos.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepo commentRepo;

    public void saveComment(User user, Offer offer, String text, String date) {
        commentRepo.save(new Comment(user, offer, text, date));
    }

    public void deleteComment(Comment comment) {
        commentRepo.delete(comment);
    }

}
