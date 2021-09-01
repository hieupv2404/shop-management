package shoppingcart.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import shoppingcart.entity.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    //
//    @Query("SELECT u FROM Product u where u.category.id=:categoryId")
//     Iterable<Product> getProductsByCategoryId(@Param("categoryId") Integer categoryId);

    Iterable<Product> findAllByCategory_Id(Integer categoryId);
    Page<Product> findAllByNameContaining(String keySearch, Pageable pageable);
}
