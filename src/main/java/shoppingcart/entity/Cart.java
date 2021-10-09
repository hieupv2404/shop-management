package shoppingcart.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.ToString;
import org.springframework.validation.annotation.Validated;

import javax.persistence.*;
import java.util.Map;
@ToString
@Entity
@Table
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "user_id")
    private User user;
    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;
    @Column(nullable = false)
    Integer amount = 1;
    public Cart() {
    }

    public Cart(Integer id, User user, Product product, Integer amount) {
        this.id = id;
        this.user = user;
        this.product = product;
        this.amount = amount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }
}
