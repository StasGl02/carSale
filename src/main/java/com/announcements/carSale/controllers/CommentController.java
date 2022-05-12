package com.announcements.carSale.controllers;

import com.announcements.carSale.models.Comment;
import com.announcements.carSale.models.Offer;
import com.announcements.carSale.models.User;
import com.announcements.carSale.services.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/publication/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping
    public String comment(@RequestParam("offerId") Offer offer, @RequestParam("userId") User user,
                          @RequestParam String comment) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm");
        LocalDateTime now = LocalDateTime.now();
        commentService.saveComment(user, offer, comment, dtf.format(now));
        return "redirect:/publication/" + offer.getId();
    }

    @PostMapping("/delete")
    public String deleteComment(@RequestParam("commentId") Comment comment) {
        commentService.deleteComment(comment);
        return "redirect:/publication/" + comment.getOffer().getId();
    }
}
