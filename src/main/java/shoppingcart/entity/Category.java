package shoppingcart.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(unique = true,nullable = false)
    String name;
    @OneToMany(mappedBy = "category")
    private List<Product> productList;
}
