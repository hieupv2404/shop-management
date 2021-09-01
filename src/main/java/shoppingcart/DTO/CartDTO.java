package shoppingcart.DTO;

import shoppingcart.entity.Product;
import shoppingcart.entity.User;

import java.util.Date;

public class CartDTO {
    private Integer id;
    private User user;
    private Product product;
    private Integer amount = 1;

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
