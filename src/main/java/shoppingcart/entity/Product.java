package shoppingcart.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(nullable = false,unique = true)
    String name;
    @Column(nullable = false)
    Long price;
    @Column
    Double rateAverage=0.0;
    @ManyToMany(mappedBy = "productList")
    private List<Category> category;
    @OneToMany(mappedBy = "product")
    @JsonIgnore
    private List<Rate> rateList;

    @OneToMany(mappedBy = "product")
    private List<Review> reviews;

    @OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
    private List<OrderDetail> orderDetails;

    public Product() {
    }

    public Product(Integer id, String name, Long price, Double rateAverage, List<Category> category, List<Rate> rateList, List<OrderDetail> orderDetails) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.rateAverage = rateAverage;
        this.category = category;
        this.rateList = rateList;
        this.orderDetails = orderDetails;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Double getRateAverage() {
        return rateAverage;
    }

    public void setRateAverage(Double rateAverage) {
        this.rateAverage = rateAverage;
    }

    public List<Category> getCategory() {
        return category;
    }

    public void setCategory(List<Category> category) {
        this.category = category;
    }

    public List<Rate> getRateList() {
        return rateList;
    }

    public void setRateList(List<Rate> rateList) {
        this.rateList = rateList;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
}
