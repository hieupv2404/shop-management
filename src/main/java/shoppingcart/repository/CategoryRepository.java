package shoppingcart.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shoppingcart.entity.Category;
import shoppingcart.entity.Product;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
}
