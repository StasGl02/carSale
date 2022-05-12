package com.announcements.carSale.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="model")
@NoArgsConstructor
@Getter
@Setter
public class Model {

    public Model(Long id, String modelName) {
        this.id = id;
        this.modelName = modelName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    private String modelName;

    @ManyToOne
    @JoinColumn(name = "make_id")
    private Make make;

    @Override
    public String toString() {
        return "Model{" +
                "id=" + id +
                ", modelName='" + modelName + '\'' +
                ", make=" + make +
                '}';
    }
}
