package shoppingcart.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import shoppingcart.entity.Category;
import shoppingcart.entity.Product;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
}
