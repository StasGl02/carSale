package com.announcements.carSale.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="make")
@NoArgsConstructor
@Getter
@Setter
public class Make {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    private String makeName;

    @OneToMany(mappedBy = "make", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Model> models;

    @Override
    public String toString() {
        return "Make{" +
                "id=" + id +
                ", makeName='" + makeName + '\'' + '}';
    }
}
