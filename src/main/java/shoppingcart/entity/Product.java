package shoppingcart.entity;

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
    @ManyToOne
    @JoinColumn(name="category_id")
    private Category category;
    @OneToMany(mappedBy = "product")
    private List<Rate> rateList;
}
