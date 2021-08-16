package shoppingcart.entity;


import org.springframework.validation.annotation.Validated;

import javax.persistence.*;
import java.util.Map;

@Entity
@Table
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;
    @Column(nullable = false)
    Integer amount = 1;
}
