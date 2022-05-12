package com.announcements.carSale.repos;

import com.announcements.carSale.models.Comment;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CommentRepoTest {
    @Autowired
    private CommentRepo commentRepo;

    @Test
    void findAll() {
        assertEquals(commentRepo.findAll().size(), 2);
    }

    @Test
    void findDateInComments() {
        List<Comment> comments;
        comments = commentRepo.findAll();
        for (Comment c : comments) {
            assertEquals(c.getPublicationTime().split(" ")[0], "11.05.2022");
        }
    }
}