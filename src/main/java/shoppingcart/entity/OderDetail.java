package shoppingcart.entity;

import javax.persistence.*;

@Entity
@Table(name = "OderDetail")
public class OderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @OneToOne
    @JoinColumn(name = "oder_id")
    private Oder oder;
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
    private Integer count;

    public OderDetail() {
    }

    public OderDetail(Integer id, Oder oder, Product product, Integer count) {
        this.id = id;
        this.oder = oder;
        this.product = product;
        this.count = count;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Oder getOder() {
        return oder;
    }

    public void setOder(Oder oder) {
        this.oder = oder;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
